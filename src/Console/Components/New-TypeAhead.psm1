<#
.SYNOPSIS
	A dynamic list of suggested values for an associated control.
.INPUTS
	The child content.
.OUTPUTS
	The rendered component.
#>
function New-ActionBar {
	[CmdletBinding()]
	[OutputType([string])]
	param (
		# The data list identifier.
		[Parameter(Mandatory, Position = 0, ValueFromPipelineByPropertyName)]
		[string] $List,

		# The delay in milliseconds to wait before triggering autocomplete suggestions.
		[Parameter(ValueFromPipelineByPropertyName)]
		[ValidateRange("NonNegative")]
		[int] $Delay = 300,

		# The minimum character length needed before triggering autocomplete suggestions.
		[Parameter(ValueFromPipelineByPropertyName)]
		[ValidateRange("Positive")]
		[int] $MinLength = 2
	)

	process {
		$attributes = @{ delay = $Delay; list = $List; minLength = $MinLength }
		tag type-ahead -attributes $attributes { datalist -id $List }
	}
}
