using module ./Variant.psm1

<#
.SYNOPSIS
	Gets the CSS class corresponding to the specified variant.
.INPUTS
	The variant.
.OUTPUTS
	The CSS class corresponding to the specified variant.
#>
function Get-UIVariantCssClass {
	[CmdletBinding()]
	[OutputType([string])]
	param (
		# The variant.
		[Parameter(Mandatory, Position = 0, ValueFromPipeline)]
		[Variant] $Variant
	)

	process {
		$Variant.ToString().ToLowerInvariant()
	}
}
