
#include <grub/symbol.h>

	.set noreorder
	.set nomacro

FUNCTION (grub_arch_sync_all_caches)
	call_pal 134
	ret $31,($26)
