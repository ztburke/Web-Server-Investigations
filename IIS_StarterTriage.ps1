<#
.DESCRIPTION
    Triage IIS to provide site information and application pools configured on the web server
#>

# Import the WebAdministration module
Import-Module WebAdministration

# Get the list of all sites
$sites = Get-ChildItem IIS:\Sites

# Display site information
Write-Host "Site Information:"
foreach ($site in $sites) {
    Write-Host "Site Name: $($site.name)"
    Write-Host "Site ID: $($site.id)"
    Write-Host "Site Physical Path: $($site.physicalPath)"
    Write-Host "Site Bindings: $($site.bindings.Collection)"
    Write-Host "------------------------"
}

# Get the list of all application pools
$appPools = Get-ChildItem IIS:\AppPools

# Display application pool information
Write-Host "Application Pool Information:"
foreach ($appPool in $appPools) {
    Write-Host "App Pool Name: $($appPool.name)"
    Write-Host "App Pool State: $($appPool.state)"
    Write-Host "App Pool .NET CLR Version: $($appPool.managedRuntimeVersion)"
    Write-Host "App Pool Pipeline Mode: $($appPool.managedPipelineMode)"
    Write-Host "------------------------"
}
