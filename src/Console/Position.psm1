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
