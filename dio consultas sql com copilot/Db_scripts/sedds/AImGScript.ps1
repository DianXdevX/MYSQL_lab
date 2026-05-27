# mG.ps1

$sourceFolder = $PSScriptRoot
$outputFile = Join-Path $sourceFolder "all_migrations.sql"

# Remove old output file if it exists
if (Test-Path $outputFile) {
    Remove-Item $outputFile
}

# Get all SQL files in the same folder as this script
$sqlFiles = Get-ChildItem -Path $sourceFolder -Filter "*.sql" |
    Where-Object { $_.Name -ne "all_migrations.sql" } |
    Sort-Object Name

foreach ($file in $sqlFiles) {
    Add-Content $outputFile "`n-- ==============================="
    Add-Content $outputFile "-- File: $($file.Name)"
    Add-Content $outputFile "-- ===============================`n"

    Get-Content $file.FullName | Add-Content $outputFile
}

Write-Host "SQL files merged into: $outputFile"