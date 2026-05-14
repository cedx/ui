<#
.SYNOPSIS
	Renders an action bar.
.INPUTS
	The child content.
.OUTPUTS
	The rendered component.
#>
function New-UIActionBar {
	[Alias("uiActionBar")]
	[CmdletBinding()]
	[OutputType([string])]
	param (
		# The child content.
		[Parameter(Position = 0, ValueFromPipeline)]
		[object] $Content
	)

	process {
		tag action-bar $Content
	}
}
