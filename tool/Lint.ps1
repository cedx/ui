using module PSScriptAnalyzer

"Performing the static analysis of source code..."
$PSScriptRoot, "src", "test" | Invoke-ScriptAnalyzer -ExcludeRule PSAvoidUsingPositionalParameters, PSUseShouldProcessForStateChangingFunctions -Recurse
Test-ModuleManifest UI.psd1 | Out-Null

npx tsc --build src/Client/tsconfig.json --noEmit
npx eslint --cache --cache-location var --config etc/ESLint.js src/Client test/Client
