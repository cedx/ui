using namespace System.Text.Json.Serialization

<#
.SYNOPSIS
	Defines tone variants.
#>
[JsonConverter([JsonStringEnumConverter])]
enum Variant {
	Danger
	Warning
	Info
	Success
	Primary
	Secondary
	Light
	Dark
}

<#
.SYNOPSIS
	Gets the CSS class corresponding to the specified variant.
.INPUTS
	The variant.
.OUTPUTS
	The CSS class corresponding to the specified variant.
#>
function Get-VariantCssClass {
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
