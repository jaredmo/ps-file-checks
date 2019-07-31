. ./Variables.ps1

# Simple diff test

# Test-FileCatalog -Detailed -Path $Path -CatalogFilePath $catalogName 


# Detailed diff tests

$params = @{
    Path = $Path
    CatalogFilePath = $oldCatalog
    Detailed = $true
}
$result = Test-FileCatalog @params

#List added files
Write-Output "List added files"
$result.PathItems.Keys | Where-Object { -not
$result.CatalogItems.ContainsKey($_) }

#List removed files
Write-Output ""
Write-Output "List removed files"
$result.CatalogItems.Keys | Where-Object { -not
$result.PathItems.ContainsKey($_) }

#List changed files
Write-Output ""
Write-Output "List changed files"
$result.PathItems.Keys | Where-Object { $result.CatalogItems[$_] -ne
$result.PathItems[$_]}