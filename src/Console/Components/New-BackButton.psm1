<#
.SYNOPSIS
	Renders an back button.
.INPUTS
	The child content.
.OUTPUTS
	The rendered back button.
#>
function New-ActionBar {
	[CmdletBinding()]
	[OutputType([string])]
	param (
		# The child content.
		[Parameter(Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
		[object] $Content,

		# The number of pages to go back.
		[ValidateRange("NonNegative")]
		[int] $Steps = 1
	)

	process {
		tag back-button -attributes @{ steps = $Steps } -on @{ Click = "this.goBack(event)" } $Content
	}
}
