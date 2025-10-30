# PowerShell script to add language dropdown and translation to all HTML files

$files = @(
    "about.html",
    "contact.html",
    "programs.html",
    "diplomas.html",
    "courses.html",
    "program-safety-health.html",
    "program-marketing.html",
    "program-quality.html",
    "program-accounting-finance.html",
    "program-procurement.html",
    "program-human-resources.html",
    "diploma-training-development.html",
    "diploma-accounting-finance.html",
    "diploma-management-science.html",
    "diploma-womens-leadership.html",
    "diploma-project-management.html",
    "engineering-programs.html",
    "team.html",
    "testimonial.html",
    "eng-civil-archi-phase-one.html",
    "eng-civil-archi-phase-two.html",
    "eng-civil-archi-phase-three.html",
    "eng-civil-archi-phase-three-new.html",
    "eng-feasibility-surveying.html",
    "eng-mech-elec-combined.html",
    "eng-real-estate-valuation.html",
    "eng-tech-office.html"
)

$languageDropdown = @'
                
                <!-- Language Selector -->
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle d-flex align-items-center" data-bs-toggle="dropdown">
                        <i class="fas fa-globe me-2"></i>
                        <span id="currentLang">EN</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end fade-down">
                        <a href="#" class="dropdown-item" onclick="switchLanguage('en'); return false;">
                            <i class="fas fa-flag-usa me-2"></i>English
                        </a>
                        <a href="#" class="dropdown-item" onclick="switchLanguage('ar'); return false;">
                            <i class="fas fa-flag me-2"></i>العربية
                        </a>
                    </div>
                </div>
'@

foreach ($file in $files) {
    $filePath = "d:\Work\GlobalAcademy\$file"
    
    if (Test-Path $filePath) {
        Write-Host "Processing: $file" -ForegroundColor Cyan
        $content = Get-Content $filePath -Raw
        
        # Check if language dropdown already exists
        if ($content -match 'id="currentLang"') {
            Write-Host "  ✓ Language dropdown already exists" -ForegroundColor Green
        } else {
            # Add language dropdown before closing navbar-nav div
            $content = $content -replace '(\s*<a href="contact\.html" class="nav-item nav-link"(?:[^>]*)>Contact</a>\s*)(</div>\s*<a href="contact\.html" class="btn btn-primary)', "`$1$languageDropdown`$2"
            Write-Host "  ✓ Added language dropdown" -ForegroundColor Green
        }
        
        # Check if translate.js is already included
        if ($content -match 'js/translate\.js') {
            Write-Host "  ✓ translate.js already included" -ForegroundColor Green
        } else {
            # Add translate.js before closing body tag
            $content = $content -replace '(\s*<script src="js/main\.js"></script>\s*)(</body>)', "`$1    <script src=`"js/translate.js`"></script>`r`n`$2"
            Write-Host "  ✓ Added translate.js script" -ForegroundColor Green
        }
        
        # Save the modified content
        $content | Out-File -FilePath $filePath -Encoding UTF8 -NoNewline
        Write-Host "  ✓ Saved $file" -ForegroundColor Green
        Write-Host ""
    } else {
        Write-Host "  ✗ File not found: $file" -ForegroundColor Red
        Write-Host ""
    }
}

Write-Host "==================================" -ForegroundColor Cyan
Write-Host "Script completed!" -ForegroundColor Green
Write-Host "==================================" -ForegroundColor Cyan
