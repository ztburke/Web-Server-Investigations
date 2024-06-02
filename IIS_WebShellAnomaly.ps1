<#
.DESCRIPTION
    Triage Windows based websites to find web shells or anomalies for investigation
#>

# Specify the path to the web directory
$webDir = "C:\path\to\your\web\directory"

# Specify the file types to look for
$fileTypes = @("*.php", "*.asp", "*.aspx", "*.jsp", "*.pl", "*.cgi")

# Check if the web directory exists
if (Test-Path $webDir) {
    # Loop through each file type
    foreach ($fileType in $fileTypes) {
        # Get all files of the current type
        $files = Get-ChildItem -Path $webDir -Filter $fileType -Recurse -ErrorAction SilentlyContinue

        # Loop through each file
        foreach ($file in $files) {
            # Read the file content
            $content = Get-Content $file.FullName

            # Look for common web shell keywords
            if ($content -match 'shell_exec|exec|passthru|system|proc_open|popen|curl_exec|curl_multi_exec|parse_ini_file|show_source') {
                Write-Output "Possible web shell found: $($file.FullName)"
            }
        }
    }
} else {
    Write-Output "Web directory not found: $webDir"
}
