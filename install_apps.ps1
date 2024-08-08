# Read package names from packages.txt file
$packagesJson = Get-Content packages.json | ConvertFrom-Json

# Install with Error handling
foreach ($package in $packagesJson.packages) {
    try {
        winget install --id $package.id -e --accept-package-agreements --accept-source-agreements
		Write-Host "Successfully installed" $package.name
    } catch [System.Exception] {
        Write-Error "Error installing" $packages.name "${_.Exception.Message}"
    }
}
