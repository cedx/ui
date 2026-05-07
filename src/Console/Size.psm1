using namespace System.Text.Json.Serialization

<#
.SYNOPSIS
	Defines the size of an element.
#>
[JsonConverter([JsonStringEnumConverter])]
enum Size {
	ExtraSmall
	Small
	Medium
	Large
	ExtraLarge
	ExtraExtraLarge
}
