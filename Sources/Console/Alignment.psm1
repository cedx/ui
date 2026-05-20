using namespace System.Text.Json.Serialization

<#
.SYNOPSIS
	Defines the alignment of a component.
#>
[JsonConverter([JsonStringEnumConverter])]
enum Alignment {
	Start
	Center
	End
}
