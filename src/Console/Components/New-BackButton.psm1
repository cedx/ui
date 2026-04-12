<#
.SYNOPSIS
	A component that moves back in the session history when clicked.
.INPUTS
	The child content.
.OUTPUTS
	The rendered component.
#>
function New-ActionBar {
	[CmdletBinding()]
	[OutputType([string])]
	param (
		# The child content.
		[Parameter(Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
		[object] $Content,

		# The number of pages to go back.
		[Parameter(ValueFromPipelineByPropertyName)]
		[ValidateRange("NonNegative")]
		[int] $Steps = 1
	)

	process {
		$attributes = @{ steps = $Steps }
		tag back-button -attributes $attributes -on @{ Click = "this.goBack(event)" } $Content
	}
}
