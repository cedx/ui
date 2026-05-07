<#
.SYNOPSIS
	Renders an action bar.
.INPUTS
	The child content.
.OUTPUTS
	The rendered component.
#>
function New-UIActionBar {
	[CmdletBinding()]
	[OutputType([string])]
	param (
		# The child content.
		[Parameter(Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
		[object] $Content
	)

	process {
		tag action-bar $Content
	}
}
