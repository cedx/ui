<#
.SYNOPSIS
	Renders a menu activator.
.INPUTS
	The child content.
.OUTPUTS
	The rendered menu activator.
#>
function New-MenuActivator {
	[CmdletBinding()]
	[OutputType([string])]
	param (
		# The child content.
		[Parameter(Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
		[object] $Content
	)

	process {
		tag menu-activator $Content
	}
}
