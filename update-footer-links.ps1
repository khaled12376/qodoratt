# Update footer links to contact.html for privacy, terms, and FAQs

# Get all HTML files
$htmlFiles = Get-ChildItem -Path "." -Filter "*.html"

foreach ($file in $htmlFiles) {
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    $originalContent = $content
    
    # Replace privacy.html with contact.html
    $content = $content -replace 'href="privacy\.html"', 'href="contact.html"'
    
    # Replace terms.html with contact.html
    $content = $content -replace 'href="terms\.html"', 'href="contact.html"'
    
    # Replace faqs.html with contact.html
    $content = $content -replace 'href="faqs\.html"', 'href="contact.html"'
    
    # Only write if content changed
    if ($content -ne $originalContent) {
        Set-Content -Path $file.FullName -Value $content -Encoding UTF8 -NoNewline
        Write-Host "Updated: $($file.Name)" -ForegroundColor Green
    }
}

Write-Host "`nAll footer links updated successfully!" -ForegroundColor Cyan
