# Do not change this order if you don't know what you are doing.
AUTOMAKE_OPTIONS = 1.7 gnu
SUBDIRS = doc

.PHONY: web-manual
web-manual: all
	@cd '$(srcdir)/doc' ; \
		$(SHELL) ../gendocs.sh -o '$(abs_builddir)/doc/manual' \
		--email $(PACKAGE_BUGREPORT) $(PACKAGE) \
		"$(PACKAGE_NAME) - $(manual_title)"
	@echo " *** Upload the doc/manual directory to web-cvs."
