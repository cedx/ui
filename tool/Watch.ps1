using module ./Cmdlets.psm1

"Watching for file changes..."
Invoke-TypeScript src/Client/tsconfig.json -SourceMap -Watch
