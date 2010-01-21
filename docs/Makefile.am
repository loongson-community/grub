info_TEXINFOS = grub.texi
grub_TEXINFOS = internals.texi fdl.texi
man_MANS = grub.8 grub-install.8 grub-md5-crypt.8 grub-terminfo.8
HELP2MAN = help2man
SRC2TEXI = src2texi
noinst_SCRIPTS = $(HELP2MAN) $(SRC2TEXI)

EXTRA_DIST = menu.lst $(man_MANS) $(noinst_SCRIPTS)
CLEANFILES = $(noinst_PROGRAMS)

# Cancel the rule %.texi -> %. This rule may confuse make to determine
# the dependecies.
.texi:

%.c.texi: %.c $(srcdir)/$(SRC2TEXI)
	$(SHELL) $(srcdir)/$(SRC2TEXI) $(srcdir) $< $@

%.h.texi: %.h $(srcdir)/$(SRC2TEXI)
	$(SHELL) $(srcdir)/$(SRC2TEXI) $(srcdir) $< $@

%.S.texi: %.S $(srcdir)/$(SRC2TEXI)
	$(SHELL) $(srcdir)/$(SRC2TEXI) $(srcdir) $< $@

if MAINTAINER_MODE
$(srcdir)/grub.8: ../grub/grub $(srcdir)/$(HELP2MAN)
	$(PERL) $(srcdir)/$(HELP2MAN) --name="the grub shell" \
		--section=8 --output=$@ $<

$(srcdir)/grub-install.8: ../util/grub-install $(srcdir)/$(HELP2MAN)
	chmod 755 $<
	$(PERL) $(srcdir)/$(HELP2MAN) --name="install GRUB on your drive" \
		--section=8 --output=$@ $<

$(srcdir)/grub-md5-crypt.8: ../util/grub-md5-crypt $(srcdir)/$(HELP2MAN)
	chmod 755 $<
	$(PERL) $(srcdir)/$(HELP2MAN) \
		--name="Encrypt a password in MD5 format" \
		--section=8 --output=$@ $<

$(srcdir)/grub-terminfo.8: ../util/grub-terminfo $(srcdir)/$(HELP2MAN)
	chmod 755 $<
	$(PERL) $(srcdir)/$(HELP2MAN) \
		--name="Generate a terminfo command from a terminfo name" \
		--section=8 --output=$@ $<
endif
