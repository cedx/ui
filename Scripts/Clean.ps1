"Deleting all generated files..."
Get-ChildItem -Directory -Filter obj -Recurse | Remove-Item -Force -Recurse
Remove-Item Binaries, Distributable -ErrorAction Ignore -Force -Recurse
Remove-Item Temp/* -Exclude .gitkeep -Force -Recurse
