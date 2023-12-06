param (
    [string]$scriptLibFolder = ".\scripts\lib"
)


# Get all .ps1 files from the folder
$scriptFiles = Get-ChildItem -Path $scriptLibFolder -Filter "*.ps1" -Recurse

if(-not (Get-Module ImportExcel -ListAvailable)){
    Install-Module -Name ImportExcel -Scope CurrentUser -Force
}

Write-Debug "Loading Powershell Libraries ..."
# Loop through each file and dot source it
foreach ($file in $scriptFiles) {
    try {
        Write-Debug "Sourcing $($file.FullName)..."
        . $file.FullName
    }
    catch {
        Write-Warning "Failed to source $($file.FullName): $_"
    }
}
