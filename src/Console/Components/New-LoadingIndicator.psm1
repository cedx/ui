<#
.SYNOPSIS
	A component that shows up when an HTTP request starts, and hides when all concurrent HTTP requests are completed.
.INPUTS
	The child content.
.OUTPUTS
	The rendered component.
#>
function New-LoadingIndicator {
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
		$cssClass = ($Fade ? "fade" : ""), ($Open ? "show" : "hide")
		tag loading-indicator -attributes $attributes -class $cssClass $Content
	}
}
