using namespace System.Text.Json.Serialization

<#
.SYNOPSIS
	Defines tone variants.
#>
[JsonConverter([JsonStringEnumConverter])]
enum Variant {
	Danger
	Warning
	Info
	Success
	Primary
	Secondary
	Light
	Dark
}
