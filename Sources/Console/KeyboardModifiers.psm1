<#
.SYNOPSIS
	Enumerates modifier flags for keyboard accelerators.
#>
[Flags()]
enum KeyboardModifiers {
	None
	Ctrl = 1
	Shift = 2
	Alt = 4
	Meta = 8
}
