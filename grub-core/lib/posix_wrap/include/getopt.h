#ifndef GRUB_GETOPT_H
#define GRUB_GETOPT_H 1

struct option {
  const char *name;
  int         has_arg;
  int        *flag;
  int         val;
};

enum
  {
    no_argument,
    required_argument,
    optional_argument
  };
extern char *optarg;
extern int optind, opterr, optopt;

#define __getopt_argv_const const

int getopt(int argc, char * const argv[],
	   const char *optstring);

int getopt_long(int argc, char * const argv[],
		const char *optstring,
		const struct option *longopts, int *longindex);

int getopt_long_only(int argc, char * const argv[],
		     const char *optstring,
		     const struct option *longopts, int *longindex);

#endif
