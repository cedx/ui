using namespace System.Text.Json.Serialization

<#
.SYNOPSIS
	Identifies the web storage area.
#>
[JsonConverter([JsonStringEnumConverter])]
enum StorageArea {
	Local
	Session
}
