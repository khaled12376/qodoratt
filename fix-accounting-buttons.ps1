# Fix enrollment buttons in accounting page
$file = "program-accounting-finance.html"
$content = Get-Content $file -Raw -Encoding UTF8

# Replace all enrollment buttons with translated version
$content = $content -replace '<i class="fa fa-user-plus me-2"></i>Enroll in This Program', '<i class="fa fa-user-plus me-2"></i><span data-translate="enroll_button">Enroll in This Program</span>'

# Save the file
$content | Set-Content $file -Encoding UTF8 -NoNewline

Write-Host "Fixed enrollment buttons in $file"
