using module ./Cmdlets.psm1

"Watching for file changes..."
Invoke-TypeScript "$PSScriptRoot/../src/Client/tsconfig.json" -SourceMap -Watch
