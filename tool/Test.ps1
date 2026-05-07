using module ./Cmdlets.psm1

"Running the test suite..."
Invoke-TypeScript "$PSScriptRoot/../src/Client/tsconfig.json" -SourceMap
Invoke-NodeTest

pwsh -Command {
	Import-Module Pester
	Invoke-Pester test
	exit $LASTEXITCODE
}
