
/*
  * Copyright (C) 1999,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013  Free Software Foundation, Inc.
  *
  * GRUB is free software: you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
  * the Free Software Foundation, either version 3 of the License, or
  * (at your option) any later version.
  *
  * GRUB is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
  * along with GRUB.  If not, see <http://www.gnu.org/licenses/>.
*/

#include <config.h>

#include <grub/util/install.h>
#include <grub/util/misc.h>
#include <grub/emu/config.h>
#include <grub/greffs.h>

#include <string.h>

#pragma GCC diagnostic ignored "-Wmissing-prototypes"
#pragma GCC diagnostic ignored "-Wmissing-declarations"
#include <argp.h>
#pragma GCC diagnostic error "-Wmissing-prototypes"
#pragma GCC diagnostic error "-Wmissing-declarations"

static char *output_image;
static char **files;
static int nfiles;
const struct grub_install_image_target_desc *format;

enum
  {
    OPTION_OUTPUT = 'o',
    OPTION_FORMAT = 'O'
  };

static struct argp_option options[] = {
  GRUB_INSTALL_OPTIONS,
  {"output", 'o', N_("FILE"),
   0, N_("save output in FILE [required]"), 2},
  {"format", 'O', N_("FILE"), 0, 0, 2},
  {"compression", 'C', "xz|none|auto", OPTION_HIDDEN, 0, 2},
  {0, 0, 0, 0, 0, 0}
};

static char *
help_filter (int key, const char *text, void *input __attribute__ ((unused)))
{
  switch (key)
    {
    case 'O':
      {
	char *formats = grub_install_get_image_targets_string (), *ret;
	ret = xasprintf ("%s\n%s %s", _("generate an image in FORMAT"),
			 _("available formats:"), formats);
	free (formats);
	return ret;
      }
    default:
      return grub_install_help_filter (key, text, input);
    }
}

static error_t
argp_parser (int key, char *arg, struct argp_state *state)
{
  if (key == 'C')
    key = GRUB_INSTALL_OPTIONS_INSTALL_CORE_COMPRESS;

  if (grub_install_parse (key, arg))
    return 0;

  switch (key)
    {

    case 'o':
      if (output_image)
	free (output_image);

      output_image = xstrdup (arg);
      break;

    case 'O':
      {
	format = grub_install_get_image_target (arg);
	if (!format)
	  {
	    printf (_("unknown target format %s\n"), arg);
	    argp_usage (state);
	    exit (1);
	  }
	break;
      }

    case ARGP_KEY_ARG:
      files[nfiles++] = xstrdup (arg);
      break;

    default:
      return ARGP_ERR_UNKNOWN;
    }
  return 0;
}

struct argp argp = {
  options, argp_parser, N_("[OPTION] SOURCE..."),
  N_("Generate a standalone image (containing all modules) in the selected format")"\v"N_("Graft point syntax (E.g. /boot/grub/grub.cfg=./grub.cfg) is accepted"), 
  NULL, help_filter, NULL
};

struct file_desc
{
  char *name;
  char *source;
  grub_size_t size;
  grub_size_t mtime;
};
static struct file_desc *file_descs;
static size_t n_file_descs, alloc_file_descs;

static inline void
canonicalize (char *name)
{
  char *iptr, *optr;
  for (iptr = name, optr = name; *iptr; )
    {
      while (*iptr == '/')
	iptr++;
      if (iptr[0] == '.' && (iptr[1] == '/' || iptr[1] == 0))
	{
	  iptr += 2;
	  continue;
	}
      if (iptr[0] == '.' && iptr[1] == '.' && (iptr[2] == '/' || iptr[2] == 0))
	{
	  iptr += 3;
	  if (optr == name)
	    continue;
	  for (optr -= 2; optr >= name && *optr != '/'; optr--);
	  optr++;
	  continue;
	}
      while (*iptr && *iptr != '/')
	*optr++ = *iptr++;
      if (*iptr)
	*optr++ = *iptr++;
    }
  *optr = 0;
}

static void
add_tar_file (const char *from,
	      const char *to)
{
  grub_util_fd_t in;
  size_t idx;

  if (grub_util_is_special_file (from))
    return;

  if (grub_util_is_directory (from))
    {
      grub_util_fd_dir_t d;
      grub_util_fd_dirent_t de;

      d = grub_util_fd_opendir (from);

      while ((de = grub_util_fd_readdir (d)))
	{
	  char *fp, *tfp;
	  if (strcmp (de->d_name, ".") == 0)
	    continue;
	  if (strcmp (de->d_name, "..") == 0)
	    continue;
	  fp = grub_util_path_concat (2, from, de->d_name);
	  tfp = xasprintf ("%s/%s", to, de->d_name);
	  add_tar_file (fp, tfp);
	  free (fp);
	}
      grub_util_fd_closedir (d);
      return;
    }

  idx = n_file_descs++;
  if (idx >= alloc_file_descs)
    {
      alloc_file_descs = 2 * n_file_descs;
      file_descs = xrealloc (file_descs, alloc_file_descs
			     * sizeof (file_descs[0]));
    }

  in = grub_util_fd_open (from, GRUB_UTIL_FD_O_RDONLY);
  if (!GRUB_UTIL_FD_IS_VALID (in))
    grub_util_error (_("cannot open `%s': %s"), from, grub_util_fd_strerror ());

  file_descs[idx].name = xstrdup (to);
  file_descs[idx].source = xstrdup (from);
  canonicalize (file_descs[idx].name);
  file_descs[idx].mtime = grub_util_get_mtime (from);
  file_descs[idx].size = grub_util_get_fd_size (in, from, NULL);

  grub_util_fd_close (in);
}

static int
filecmp (const void *p1, const void *p2)
{
  const struct file_desc *a = p1, *b = p2;

  /* Don't use strcmp, it's buggy on some systems.  */
  return grub_strcmp (a->name, b->name);
}

static void
write_memdisk (char *memdisk_img)
{
  FILE *memdisk;
  struct grub_greffs_header head;
  struct grub_greffs_inode inode;
  size_t total_strlen = 0, i;
  size_t name_pad = 0;
  grub_uint32_t file_offset;

  qsort (file_descs, n_file_descs, sizeof (file_descs[0]), filecmp);

  for (i = 0; i < n_file_descs; i++)
    total_strlen += grub_strlen (file_descs[i].name);
  name_pad = ALIGN_UP (total_strlen, 4) - total_strlen;
  total_strlen += name_pad;

  grub_memcpy (head.magic, GRUB_GREFFS_MAGIC, sizeof (head.magic));
  head.nfiles = grub_cpu_to_le32 (n_file_descs);
  head.inodes_offset = grub_cpu_to_le32 (sizeof (head)
					 + sizeof (grub_uint32_t)
					 * (n_file_descs + 1));
  head.string_ptrs_offset = grub_cpu_to_le32 (sizeof (head));

  memdisk = grub_util_fopen (memdisk_img, "wb");
  if (!memdisk)
    grub_util_error (_("Can't create file: %s"), strerror (errno));

  fwrite (&head, 1, sizeof (head), memdisk);

  grub_uint32_t curname = sizeof (head) + sizeof (grub_uint32_t)
    * (n_file_descs + 1) + sizeof (inode) * n_file_descs;
  for (i = 0; i <= n_file_descs; i++)
    {
      grub_uint32_t curname_le = grub_cpu_to_le32 (curname);
      fwrite (&curname_le, 1, sizeof (curname_le), memdisk);
      if (i != n_file_descs)
	curname += grub_strlen (file_descs[i].name);
    }

  file_offset = sizeof (head) + sizeof (grub_uint32_t)
    * (n_file_descs + 1) + sizeof (inode) * n_file_descs + total_strlen;
  for (i = 0; i < n_file_descs; i++)
    {
      inode.start = grub_cpu_to_le32 (file_offset);
      inode.size = grub_cpu_to_le32 (file_descs[i].size);
      inode.mtime = grub_cpu_to_le32 (file_descs[i].mtime);
      inode.type = 0;
      fwrite (&inode, 1, sizeof (inode), memdisk);
      file_offset += file_descs[i].size;
    }

  for (i = 0; i < n_file_descs; i++)
    fwrite (file_descs[i].name, 1, grub_strlen (file_descs[i].name), memdisk);

  if (!grub_install_copy_buffer)
    grub_install_copy_buffer = xmalloc (GRUB_INSTALL_COPY_BUFFER_SIZE);

  grub_memset (grub_install_copy_buffer, 0, 4);
  fwrite (grub_install_copy_buffer, 1, name_pad, memdisk);

  for (i = 0; i < n_file_descs; i++)
    {
      grub_util_fd_t in;
      size_t remaining = file_descs[i].size;
      in = grub_util_fd_open (file_descs[i].source, GRUB_UTIL_FD_O_RDONLY);
      if (!GRUB_UTIL_FD_IS_VALID (in))
	grub_util_error (_("cannot open `%s': %s"),
			 file_descs[i].source, grub_util_fd_strerror ());
 
      while (remaining)
	{
	  size_t toread = remaining;
	  ssize_t r;
	  if (remaining > GRUB_INSTALL_COPY_BUFFER_SIZE)
	    toread = GRUB_INSTALL_COPY_BUFFER_SIZE;
	  r = grub_util_fd_read (in, grub_install_copy_buffer, toread);
	  if (r <= 0)
	    break;
	  fwrite (grub_install_copy_buffer, 1, r, memdisk);
	  if (r >= remaining)
	    remaining = 0;
	  else
	    remaining -= r; 
	}
      grub_util_fd_close (in);

      grub_memset (grub_install_copy_buffer, 0, GRUB_INSTALL_COPY_BUFFER_SIZE);
      while (remaining)
	{
	  size_t toread = remaining;
	  if (remaining > GRUB_INSTALL_COPY_BUFFER_SIZE)
	    toread = GRUB_INSTALL_COPY_BUFFER_SIZE;
	  fwrite (grub_install_copy_buffer, 1, toread, memdisk);
	  remaining -= toread; 
	}
    }

  fclose (memdisk);
}

int
main (int argc, char *argv[])
{
  const char *pkglibdir;
  int i;

  grub_util_host_init (&argc, &argv);
  grub_util_disable_fd_syncs ();

  files = xmalloc ((argc + 1) * sizeof (files[0]));

  argp_parse (&argp, argc, argv, 0, 0, 0);

  pkglibdir = grub_util_get_pkglibdir ();

  if (!output_image)
    grub_util_error ("%s", _("output file must be specified"));

  if (!format)
    grub_util_error ("%s", _("Target format not specified (use the -O option)."));

  if (!grub_install_source_directory)
    grub_install_source_directory = grub_util_path_concat (2, pkglibdir, grub_util_get_target_dirname (format));

  enum grub_install_plat plat = grub_install_get_target (grub_install_source_directory);

  char *memdisk_dir = grub_util_make_temporary_dir ();
  char *boot_grub = grub_util_path_concat (3, memdisk_dir, "boot", "grub");
  grub_install_copy_files (grub_install_source_directory,
			   boot_grub, plat);

  char *memdisk_img = grub_util_make_temporary_file ();

  add_tar_file (memdisk_dir, "");
  for (i = 0; i < nfiles; i++)
    {
      char *eq = grub_strchr (files[i], '=');
      char *from, *to;
      if (!eq)
	{
	  from = files[i];
	  to = files[i];
	}
      else
	{
	  *eq = '\0';
	  to = files[i];
	  from = eq + 1;
	}
      while (*to == '/')
	to++;
      add_tar_file (from, to);
    }

  write_memdisk (memdisk_img);
  grub_util_unlink_recursive (memdisk_dir);

  grub_install_push_module ("memdisk");
  grub_install_push_module ("greffs");

  grub_install_make_image_wrap (grub_install_source_directory,
				"(memdisk)/boot/grub", output_image,
				memdisk_img, NULL,
				grub_util_get_target_name (format), 0);

  grub_util_unlink (memdisk_img);

  return 0;
}
