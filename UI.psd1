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
	)

	NestedModules = @(
		"src/Console/New-ActionBar.psm1"
		"src/Console/New-Alert.psm1"
		"src/Console/New-BackButton.psm1"
		"src/Console/New-FullScreenToggler.psm1"
		"src/Console/New-KeyboardAccelerator.psm1"
		"src/Console/New-LoadingIndicator.psm1"
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
