# PowerShell script to fix duration and certification info in all program pages

$files = @(
    "program-quality.html",
    "program-marketing.html",
    "program-safety-health.html",
    "engineering-programs.html",
    "program-leadership.html",
    "program-management.html",
    "program-accounting-finance.html"
)

foreach ($file in $files) {
    $filePath = "d:\Work\GlobalAcademy\$file"
    if (Test-Path $filePath) {
        $content = Get-Content $filePath -Raw -Encoding UTF8
        
        # Fix duration info - split into two lines
        $content = $content -replace '<p class="mb-0"([^>]*)data-translate="(\w+)_duration_info">([^<]+)<br>([^<]+)</p>', '<p class="mb-0"$1><span data-translate="$2_duration_line1">$3</span><br><span data-translate="$2_duration_line2">$4</span></p>'
        
        # Fix certification info - split into two lines  
        $content = $content -replace '<p class="mb-0 text-white"([^>]*)data-translate="(\w+)_cert_info">([^<]+)<br>([^<]+)</p>', '<p class="mb-0 text-white"$1><span data-translate="$2_cert_line1">$3</span><br><span data-translate="$2_cert_line2">$4</span></p>'
        
        $content | Set-Content $filePath -Encoding UTF8 -NoNewline
        Write-Host "Fixed $file" -ForegroundColor Green
    }
}

Write-Host "`nAll files fixed!" -ForegroundColor Cyan
