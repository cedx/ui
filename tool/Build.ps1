using module ./Cmdlets.psm1

"Building the solution..."
$sourceMap = -not $Release
Build-DotNetSolution ($Release ? "Release" : "Debug")
Invoke-TypeScript "$PSScriptRoot/../src/Client/tsconfig.json" -SourceMap:$sourceMap
