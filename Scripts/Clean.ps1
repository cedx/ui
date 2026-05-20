"Deleting all generated files..."
Remove-Item */obj -Force -Recurse
Remove-Item Binaries, Distributable -ErrorAction Ignore -Force -Recurse
Remove-Item Temp/* -Exclude .gitkeep -Force -Recurse
