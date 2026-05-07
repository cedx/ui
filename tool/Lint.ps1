using module PSScriptAnalyzer
using module ./Cmdlets.psm1

"Performing the static analysis of source code..."
$PSScriptRoot, "src", "test" | Invoke-ScriptAnalyzer -ExcludeRule PSAvoidUsingPositionalParameters, PSUseShouldProcessForStateChangingFunctions -Recurse
Test-ModuleManifest UI.psd1 | Out-Null

Invoke-TypeScript src/Client/tsconfig.json -NoEmit
Invoke-ESLint src/Client, test/Client -Configuration etc/ESLint.js
