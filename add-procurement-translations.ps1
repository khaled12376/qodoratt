# Script to add data-translate attributes to procurement programs 3-6

$filePath = "program-procurement.html"
$content = Get-Content $filePath -Raw -Encoding UTF8

# Program 3
$content = $content -replace `
    '(<h4 class="text-primary mb-3">3\. Modern and Advanced Management of Procurement and Contracts</h4>)', `
    '<h4 class="text-primary mb-3" data-translate="proc_prog_3_title">3. Modern and Advanced Management of Procurement and Contracts</h4>'

# Program 4
$content = $content -replace `
    '(<h4 class="text-primary mb-3">4\. Supply Chain Risk Management</h4>)', `
    '<h4 class="text-primary mb-3" data-translate="proc_prog_4_title">4. Supply Chain Risk Management</h4>'

# Program 5
$content = $content -replace `
    '(<h4 class="text-primary mb-3">5\. Effective Management of Procurement Contracts and Claims Assessment and Settlement</h4>)', `
    '<h4 class="text-primary mb-3" data-translate="proc_prog_5_title">5. Effective Management of Procurement Contracts and Claims Assessment and Settlement</h4>'

# Program 6
$content = $content -replace `
    '(<h4 class="text-primary mb-3">6\. Certified Warehouse Manager</h4>)', `
    '<h4 class="text-primary mb-3" data-translate="proc_prog_6_title">6. Certified Warehouse Manager</h4>'

# Save the file
$content | Set-Content $filePath -Encoding UTF8 -NoNewline

Write-Host "Added data-translate to procurement program titles (3-6)"
