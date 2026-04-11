using namespace System.Text.Json.Serialization

<#
.SYNOPSIS
	Defines the position of an element.
#>
[JsonConverter([JsonStringEnumConverter])]
enum Position {
	TopStart
	TopCenter
	TopEnd
	MiddleStart
	MiddleCenter
	MiddleEnd
	BottomStart
	BottomCenter
	BottomEnd
}

<#
.SYNOPSIS
	Gets the CSS class corresponding to the specified position.
.INPUTS
	The position.
.OUTPUTS
	The CSS class corresponding to the specified position.
#>
function Get-PositionCssClass {
	[CmdletBinding()]
	[OutputType([string])]
	param (
		# The position.
		[Parameter(Mandatory, Position = 0, ValueFromPipeline)]
		[Position] $Position
	)

	process {
		switch ($Position) {
			([Position]::TopCenter) { return "top-0 start-50 translate-middle-x"; break }
			([Position]::TopEnd) { return "top-0 end-0"; break }
			([Position]::MiddleStart) { return "top-50 start-0 translate-middle-y"; break }
			([Position]::MiddleCenter) { return "top-50 start-50 translate-middle"; break }
			([Position]::MiddleEnd) { return "top-50 end-0 translate-middle-y"; break }
			([Position]::BottomStart) { return "bottom-0 start-0"; break }
			([Position]::BottomCenter) { return "bottom-0 start-50 translate-middle-x"; break }
			([Position]::BottomEnd) { return "bottom-0 end-0"; break }
			default { return "top-0 start-0" }
		}
	}
}
