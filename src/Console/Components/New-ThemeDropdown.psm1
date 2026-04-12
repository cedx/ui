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
function New-ThemeDropdown {
	[CmdletBinding()]
	[OutputType([string])]
	param (
		# The label of the dropdown menu.
		[Parameter(Position = 0, ValueFromPipelineByPropertyName)]
		[ValidateNotNullOrWhiteSpace()]
		[string] $Label = "Thème",

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
			label = $Label
			storageKey = $StorageKey
		}

		tag theme-dropdown -attributes $attributes {
			li -class nav-item, dropdown {
				button -class dropdown-toggle, nav-link -dataset @{ BsToggle = "dropdown" } -type button {
					i -class icon, icon-fill (Get-AppThemeIcon $AppTheme)
					span -class mx-1 $Label
				}
				ul -class dropdown-menu, $Alignment -eq [Alignment]::End ? "dropdown-menu-end" : "" {
					foreach ($theme in [Enum]::GetValues[AppTheme]()) {
						li {
							button -class dropdown-item, d-flex, align-items-center, justify-content-between -type button -value $theme {
								span {
									i -class icon, icon-fill, me-1 (Get-AppThemeIcon $theme)
									Get-AppThemeLabel $theme
								}
								if ($theme -eq $AppTheme) { i -class icon, ms-3 "check" }
							}
						}
					}
				}
			}
		}
	}
}
