"Running the test suite..."
# dotnet test --settings .runsettings

npx tsc --build src/Client/tsconfig.json --sourceMap
npx esbuild test/Client/Main.js --bundle --legal-comments=none --outfile=var/Tests.js --sourcemap
node test/Client/Playwright.js

# pwsh -Command {
# 	Import-Module Pester
# 	Invoke-Pester test
# 	exit $LASTEXITCODE
# }
