@{
	ModuleVersion = "0.2.0"
	PowerShellVersion = "7.6"
	RootModule = "src/Main.psm1"

	Author = "Cédric Belin <cedx@outlook.com>"
	CompanyName = "Cedric-Belin.fr"
	Copyright = "© Cédric Belin"
	Description = "Component library by Cédric Belin, full stack developer."
	GUID = "13e38ea8-3ddf-4d0d-8440-eeb8d0e8f9fa"

	CmdletsToExport = @()
	VariablesToExport = @()

	AliasesToExport = @(
		"uiActionBar"
		"uiAlert"
		"uiBackButton"
		"uiFullScreenToggler"
		"uiKeyboardAccelerator"
		"uiLoadingIndicator"
		"uiMenuActivator"
		"uiOfflineIndicator"
		"uiTabActivator"
		"uiThemeDropdown"
		"uiTypeAhead"
	)

	FunctionsToExport = @(
		"Get-UIAppThemeIcon"
		"Get-UIAppThemeLabel"
		"Get-UIContextCssClass"
		"Get-UIContextIcon"
		"Get-UIPositionCssClass"
		"Get-UISizeCssClass"
		"Get-UIVariantCssClass"
		"New-UIActionBar"
		"New-UIAlert"
		"New-UIBackButton"
		"New-UIFullScreenToggler"
		"New-UIKeyboardAccelerator"
		"New-UILoadingIndicator"
		"New-UIMenuActivator"
		"New-UIOfflineIndicator"
		"New-UITabActivator"
		"New-UIThemeDropdown"
		"New-UITypeAhead"
	)

	RequiredModules = @(
		@{ ModuleName = "Belin.Html"; ModuleVersion = "2.1.1" }
	)

	PrivateData = @{
		PSData = @{
			LicenseUri = "https://github.com/cedx/ui/blob/main/License.md"
			ProjectUri = "https://github.com/cedx/ui"
			ReleaseNotes = "https://github.com/cedx/ui/releases"
			Tags = "belin", "blazor", "components", "html", "library", "ui"
		}
	}
}
