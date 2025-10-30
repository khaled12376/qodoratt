# Batch update script for adding data-translate to page headers

$updates = @{
    "program-quality.html" = @{
        title = "quality_title"
        subtitle = "quality_subtitle"
        displayTitle = "Quality Programs"
    }
    "program-safety-health.html" = @{
        title = "safety_title"
        subtitle = "safety_subtitle"
        displayTitle = "Safety & Health Programs"
    }
    "program-accounting-finance.html" = @{
        title = "accounting_title"
        subtitle = "accounting_subtitle"
        displayTitle = "Accounting & Finance"
    }
    "program-procurement.html" = @{
        title = "procurement_title"
        subtitle = "procurement_subtitle"
        displayTitle = "Procurement & Supply Chain"
    }
    "program-human-resources.html" = @{
        title = "hr_title"
        subtitle = "hr_subtitle"
        displayTitle = "Human Resources"
    }
}

foreach ($file in $updates.Keys) {
    $filePath = "d:\Work\GlobalAcademy\$file"
    if (Test-Path $filePath) {
        $content = Get-Content $filePath -Raw -Encoding UTF8
        $info = $updates[$file]
        
        # Update h1 header
        $pattern1 = '<h1 class="display-3 text-white animated slideInDown">' + [regex]::Escape($info.displayTitle) + '</h1>'
        $replacement1 = '<h1 class="display-3 text-white animated slideInDown" data-translate="' + $info.title + '">' + $info.displayTitle + '</h1>'
        $content = $content -replace $pattern1, $replacement1
        
        # Update section h1
        $pattern2 = '<h1 class="mb-5">' + [regex]::Escape($info.displayTitle) + '</h1>'
        $replacement2 = '<h1 class="mb-5" data-translate="' + $info.title + '">' + $info.displayTitle + '</h1>'
        $content = $content -replace $pattern2, $replacement2
        
        # Update breadcrumb last item
        $pattern3 = '<li class="breadcrumb-item text-white active">' + [regex]::Escape($info.displayTitle) + '</li>'
        $replacement3 = '<li class="breadcrumb-item text-white active" data-translate="' + $info.title + '">' + $info.displayTitle + '</li>'
        $content = $content -replace $pattern3, $replacement3
        
        # Save file
        $content | Out-File -FilePath $filePath -Encoding UTF8 -NoNewline
        Write-Host "✓ Updated $file" -ForegroundColor Green
    }
}

Write-Host ""
Write-Host "=== All files updated! ===" -ForegroundColor Cyan
