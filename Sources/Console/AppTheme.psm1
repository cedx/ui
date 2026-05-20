using namespace System.Text.Json.Serialization

<#
.SYNOPSIS
	Enumerates different themes an operating system or application can show.
#>
[JsonConverter([JsonStringEnumConverter])]
enum AppTheme {
	System
	Light
	Dark
}
