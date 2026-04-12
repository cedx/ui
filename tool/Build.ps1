"Building the solution..."
dotnet build --configuration ($Release ? "Release" : "Debug")

$options = $Release ? @() : @("--sourceMap")
npx tsc --build src/Client/tsconfig.json @options
