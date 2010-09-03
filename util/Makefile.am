
HELP2MAN = @HELP2MAN@
if COND_MAN_PAGES
man_MANS = mbchk.1
endif

if BUILD_MBCHK
bin_PROGRAMS = mbchk
endif

mbchk_SOURCES = mbchk.c
mbchk_CPPFLAGS = -I$(top_srcdir)/doc 

$(srcdir)/mbchk.1: ./mbchk
	$(HELP2MAN)  \
		--name="check the format of a Multiboot kernel" \
		--section=1 --output=$@ ./$<
