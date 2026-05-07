using namespace System.Collections.Generic
using module ../Alignment.psm1
using module ../AppTheme.psm1

<#
.SYNOPSIS
	A dropdown menu for switching the application theme.
.INPUTS
	The child content.
.OUTPUTS
	The rendered component.
#>
function New-UIThemeDropdown {
	[Alias("uiThemeDropdown")]
	[CmdletBinding()]
	[OutputType([string])]
	param (
		# The text of the dropdown menu.
		[Parameter(Position = 0, ValueFromPipelineByPropertyName)]
		[ValidateNotNullOrWhiteSpace()]
		[string] $Text = "Thème",

		# The alignment of the dropdown menu.
		[Parameter(ValueFromPipelineByPropertyName)]
		[Alignment] $Alignment = [Alignment]::End,

		# The current application theme.
		[Parameter(ValueFromPipelineByPropertyName)]
		[AppTheme] $AppTheme = [AppTheme]::System,

		# Value indicating whether to store the application theme in a cookie.
		[Parameter(ValueFromPipelineByPropertyName)]
		[switch] $Cookie,

		# The URI for which the associated cookie is valid.
		[Parameter(ValueFromPipelineByPropertyName)]
		[string] $CookieDomain = "",

		# The key of the storage entry providing the saved application theme.
		[Parameter(ValueFromPipelineByPropertyName)]
		[ValidateNotNullOrWhiteSpace()]
		[string] $StorageKey = "AppTheme"
	)

	process {
		$attributes = @{
			alignment = $Alignment
			appTheme = $AppTheme
			cookie = $Cookie
			cookieDomain = $CookieDomain
			storageKey = $StorageKey
			text = $Text
		}

		tag theme-dropdown -Attributes $attributes {
			li -Class nav-item, dropdown {
				button -Class dropdown-toggle, nav-link -DataSet @{ BsToggle = "dropdown" } -Type button {
					i -Class icon, icon-fill (Get-UIAppThemeIcon $AppTheme)
					span -Class mx-1 $Label
				}
				ul -Class dropdown-menu, ($Alignment -eq [Alignment]::End ? "dropdown-menu-end" : "") {
					foreach ($theme in [Enum]::GetValues[AppTheme]()) {
						li {
							button -Class dropdown-item, d-flex, align-items-center, justify-content-between -Type button -Value $theme {
								span {
									i -Class icon, icon-fill, me-1 (Get-UIAppThemeIcon $theme)
									Get-UIAppThemeLabel $theme
								}
								if ($theme -eq $AppTheme) { i -Class icon, ms-3 "check" }
							}
						}
					}
				}
			}
		}
	}
}
