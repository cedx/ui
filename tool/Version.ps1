"Updating the version number in the sources..."
$version = (Import-PowerShellDataFile UI.psd1).ModuleVersion
(Get-Content package.json -Raw) -replace '"version": "\d+(\.\d+){2}"', """version"": ""$version""" | Set-Content package.json -NoNewLine
foreach ($file in Get-ChildItem -Exclude node_modules -Filter *.csproj -Recurse) {
	(Get-Content $file -Raw) -replace "<Version>\d+(\.\d+){2}</Version>", "<Version>$version</Version>" | Set-Content $file -NoNewLine
}
