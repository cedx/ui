using module ./Size.psm1

<#
.SYNOPSIS
	Gets the CSS class corresponding to the specified size.
.INPUTS
	The size.
.OUTPUTS
	The CSS class corresponding to the specified size.
#>
function Get-UISizeCssClass {
	[CmdletBinding()]
	[OutputType([string])]
	param (
		# The size.
		[Parameter(Mandatory, Size = 0, ValueFromPipeline)]
		[Size] $Size
	)

	process {
		switch ($Size) {
			([Size]::ExtraSmall) { return "xs"; break }
			([Size]::Small) { return "sm"; break }
			([Size]::Large) { return "lg"; break }
			([Size]::ExtraLarge) { return "xl"; break }
			([Size]::ExtraExtraLarge) { return "xxl"; break }
			default { return "md" }
		}
	}
}
