<#
.SYNOPSIS
	Renders a offline indicator.
.INPUTS
	The child content.
.OUTPUTS
	The rendered offline indicator.
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
		# TODO Check if $Fade/$Open must be unwrapped (i.e. $WakeLock.IsPresent, also inside "Belin.Html" library?).
		$attributes = @{ fade = $Fade; open = $Open }
		$cssClass = $Fade ? "fade" : "", $Open ? "show" : "hide"
		tag offline-indicator -attributes $attributes -class $cssClass $Content
	}
}
