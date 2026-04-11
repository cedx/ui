using namespace System.Collections.Generic
using module ../KeyboardModifiers.psm1

<#
.SYNOPSIS
	Renders a loading indicator.
.INPUTS
	The child content.
.OUTPUTS
	The rendered loading indicator.
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
		$cssClass = [List[string]] @($Open ? "show" : "hide")
		if ($Fade) { $cssClass.Add("fade") }

		# TODO Check if $Fade/$Open must be unwrapped (i.e. $WakeLock.IsPresent, also inside "Belin.Html" library?).
		$attributes = @{ fade = $Fade; open = $Open }
		tag loading-indicator -attributes $attributes -class $cssClass $Content
	}
}
