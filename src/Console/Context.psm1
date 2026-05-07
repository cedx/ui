using namespace System.Text.Json.Serialization

<#
.SYNOPSIS
	Defines contextual modifiers.
#>
[JsonConverter([JsonStringEnumConverter])]
enum Context {
	Danger
	Warning
	Info
	Success
}
