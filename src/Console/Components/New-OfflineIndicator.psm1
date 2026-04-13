<#
.SYNOPSIS
	A component that shows up when the network is unavailable, and hides when connectivity is restored.
.INPUTS
	The child content.
.OUTPUTS
	The rendered component.
#>
function New-OfflineIndicator {
	[CmdletBinding()]
	[OutputType([string])]
	param (
		# The child content.
		[Parameter(Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
		[object] $Content,

		# Value indicating whether to apply a transition.
		[Parameter(ValueFromPipelineByPropertyName)]
		[switch] $Fade,

		# Value indicating whether to initially show this component.
		[Parameter(ValueFromPipelineByPropertyName)]
		[switch] $Open
	)

	process {
		$attributes = @{ fade = $Fade ; open = $Open }
		$cssClass = ($Fade ? "fade" : ""), ($Open ? "show" : "hide")
		tag offline-indicator -attributes $attributes -class $cssClass $Content
	}
}
