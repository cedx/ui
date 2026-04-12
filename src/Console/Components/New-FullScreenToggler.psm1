<#
.SYNOPSIS
	A component for toggling an element to full-screen.
.INPUTS
	The child content.
.OUTPUTS
	The rendered component.
#>
function New-FullScreenToggler {
	[CmdletBinding()]
	[OutputType([string])]
	param (
		# The child content.
		[Parameter(Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
		[object] $Content,

		# The CSS selector used to target the element.
		[Parameter(ValueFromPipelineByPropertyName)]
		[ValidateNotNullOrWhiteSpace()]
		[string] $Target = "body",

		# Value indicating whether to prevent the device screen from dimming or locking when in full-screen mode.
		[Parameter(ValueFromPipelineByPropertyName)]
		[switch] $WakeLock
	)

	process {
		# TODO Check if $WakeLock must be unwrapped (i.e. $WakeLock.IsPresent, also inside "Belin.Html" library?).
		$attributes = @{ target = $Target; wakeLock = $WakeLock }
		tag fullscreen-toggler -attributes $attributes -on @{ Click = "this.toggleFullScreen(event)" } $Content
	}
}
