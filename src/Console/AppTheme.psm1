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

<#
.SYNOPSIS
	Gets the icon corresponding to the specified theme.
.INPUTS
	The application theme.
.OUTPUTS
	The icon corresponding to the specified theme.
#>
function Get-AppThemeIcon {
	[CmdletBinding()]
	[OutputType([string])]
	param (
		# The application theme.
		[Parameter(Mandatory, Position = 0, ValueFromPipeline)]
		[AppTheme] $AppTheme
	)

	process {
		switch ($AppTheme) {
			([AppTheme]::Dark) { return "dark_mode"; break }
			([AppTheme]::Light) { return "light_mode"; break }
			default { return "contrast" }
		}
	}
}

<#
.SYNOPSIS
	Gets the label corresponding to the specified theme.
.INPUTS
	The application theme.
.OUTPUTS
	The label corresponding to the specified theme.
#>
function Get-AppThemeLabel {
	[CmdletBinding()]
	[OutputType([string])]
	param (
		# The application theme.
		[Parameter(Mandatory, Position = 0, ValueFromPipeline)]
		[AppTheme] $AppTheme
	)

	process {
		switch ($AppTheme) {
			([AppTheme]::Dark) { return "Sombre"; break }
			([AppTheme]::Light) { return "Clair"; break }
			default { return "Auto" }
		}
	}
}
