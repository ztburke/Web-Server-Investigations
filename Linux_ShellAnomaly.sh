#!/bin/bash

## Triage Linux hosts for web shell or anomalies

# Specify the path to the web directory
webDir="/var/www"

# Check if the web directory exists
if [ -d "$webDir" ]; then
    # Find files modified in the last 24 hours
    echo "Files modified in the last 24 hours:"
    find $webDir -type f -mtime 0

    # Find files with long strings
    echo "Files with long strings:"
    awk 'length($0)>100' *.php
   
    # Find files with certain extensions
    echo "Files with .php, .aspx, .jsp, .pl, .cgi extensions:"
    find $webDir -type f \( -name "*.php" -o -name "*.aspx" -o -name "*.jsp" -o -name "*.pl" -o -name "*.cgi" \)
    
    #Web Shell Keyword Search
    echo "Possible Web Shells:"
    grep -RPn "(passthru|exec|eval|shell_exec|assert|system) *\(" /var/www/

else
    echo "Web directory not found: $webDir"
fi
