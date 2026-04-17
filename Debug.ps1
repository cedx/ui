#!/usr/bin/env pwsh
$ErrorActionPreference = "Stop"
$PSNativeCommandUseErrorActionPreference = $true

Import-Module "$PSScriptRoot/UI.psd1"
try { <# Insert the command to be debugged here. #> }
catch { Write-Error "$_`n$($_.ScriptStackTrace)" }
