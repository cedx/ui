@{
	DefaultCommandPrefix = "UI"
	ModuleVersion = "0.1.0"
	PowerShellVersion = "7.6"

	Author = "Cédric Belin <cedx@outlook.com>"
	CompanyName = "Cedric-Belin.fr"
	Copyright = "© Cédric Belin"
	Description = "Component library by Cédric Belin, full stack developer."
	GUID = "13e38ea8-3ddf-4d0d-8440-eeb8d0e8f9fa"

	AliasesToExport = @()
	CmdletsToExport = @()
	VariablesToExport = @()

	FunctionsToExport = @(
		"New-ActionBar"
		"New-Alert"
		"New-BackButton"
		"New-FullScreenToggler"
		"New-KeyboardAccelerator"
		"New-LoadingIndicator"
		"New-MenuActivator"
		"New-OfflineIndicator"
		"New-TabActivator"
		"New-ThemeDropdown"
		"New-TypeAhead"
	)

	NestedModules = @(
		"src/Console/Components/New-ActionBar.psm1"
		"src/Console/Components/New-Alert.psm1"
		"src/Console/Components/New-BackButton.psm1"
		"src/Console/Components/New-FullScreenToggler.psm1"
		"src/Console/Components/New-KeyboardAccelerator.psm1"
		"src/Console/Components/New-LoadingIndicator.psm1"
		"src/Console/Components/New-MenuActivator.psm1"
		"src/Console/Components/New-OfflineIndicator.psm1"
		"src/Console/Components/New-TabActivator.psm1"
		"src/Console/Components/New-ThemeDropdown.psm1"
		"src/Console/Components/New-TypeAhead.psm1"
	)

	RequiredModules = @(
		"Belin.Html"
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
