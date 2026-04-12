if ($Release) {
	& "$PSScriptRoot/Clean.ps1"
	& "$PSScriptRoot/Version.ps1"
	& "$PSScriptRoot/Client/Build.ps1"
}
else {
	"The ""-Release"" switch must be set!"
	exit 1
}

"Publishing the package..."
$version = (Import-PowerShellDataFile UI.psd1).ModuleVersion
git tag "v$version"
git push origin "v$version"
npm login
npm publish

$output = "var/NuGet"
dotnet pack --output $output
Get-Item "$output/*.nupkg" | ForEach-Object { dotnet nuget push $_ --api-key $Env:NUGET_API_KEY --source NuGet }

$output = "var/PSModule"
New-Item $output/src/Console -ItemType Directory | Out-Null
Copy-Item UI.psd1 $output/Belin.UI.psd1
Copy-Item *.md $output
Copy-Item src/Console/* $output/src/Console -Recurse

$output = "var/PSGallery"
New-Item $output -ItemType Directory | Out-Null
Compress-PSResource var/PSModule $output
Get-Item "$output/*.nupkg" | ForEach-Object { Publish-PSResource -ApiKey $Env:PSGALLERY_API_KEY -NupkgPath $_ -Repository PSGallery }
