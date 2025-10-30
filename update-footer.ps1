# PowerShell script to update footer in all HTML files

# Get all HTML files
$htmlFiles = Get-ChildItem -Path "." -Filter "*.html" | Where-Object { $_.Name -ne "navbar.html" }

$newFooter = @'
    <!-- Footer Start -->
  
    <div class="container-fluid bg-dark text-light footer pt-5 mt-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container py-5">
            <div class="row g-5">
                <div class="col-lg-3 col-md-6">
                    <h4 class="text-white mb-3" data-translate="footer_quick_link">Quick Link</h4>
                    <a class="btn btn-link" href="about.html" data-translate="footer_about">About Us</a>
                    <a class="btn btn-link" href="contact.html" data-translate="footer_contact_us">Contact Us</a>
                    <a class="btn btn-link" href="privacy.html" data-translate="footer_privacy">Privacy Policy</a>
                    <a class="btn btn-link" href="terms.html" data-translate="footer_terms">Terms & Condition</a>
                    <a class="btn btn-link" href="faqs.html" data-translate="footer_faqs">FAQs & Help</a>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h4 class="text-white mb-3" data-translate="footer_contact_title">Contact</h4>
                    <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>Egypt</p>
                    <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>+012</p>
                    <p class="mb-2"><i class="fa fa-envelope me-3"></i>info@example.com</p>
                    <div class="d-flex pt-2">
            
                        <a class="btn btn-outline-light btn-social" href="https://www.facebook.com/profile.php?id=61579270026809" target="_blank" rel="noopener noreferrer"><i class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-outline-light btn-social" href="https://wa.me/YOUR_PHONE_NUMBER" target="_blank" rel="noopener noreferrer"><i class="fab fa-whatsapp"></i></a>
                        <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
                <!-- Gallery
                <div class="col-lg-3 col-md-6">
                    <h4 class="text-white mb-3">Gallery</h4>
                    <div class="row g-2 pt-2">
                        <div class="col-4">
                            <img class="img-fluid bg-light p-1" src="img/course-1.jpg" alt="">
                        </div>
                        <div class="col-4">
                            <img class="img-fluid bg-light p-1" src="img/course-2.jpg" alt="">
                        </div>
                        <div class="col-4">
                            <img class="img-fluid bg-light p-1" src="img/course-3.jpg" alt="">
                        </div>
                        <div class="col-4">
                            <img class="img-fluid bg-light p-1" src="img/course-2.jpg" alt="">
                        </div>
                        <div class="col-4">
                            <img class="img-fluid bg-light p-1" src="img/course-3.jpg" alt="">
                        </div>
                        <div class="col-4">
                            <img class="img-fluid bg-light p-1" src="img/course-1.jpg" alt="">
                        </div>
                    </div>
                </div>
                -->
                <div class="col-lg-3 col-md-6">
                    <h4 class="text-white mb-3" data-translate="footer_newsletter">Newsletter</h4>
                    <p data-translate="footer_newsletter_text">Stay updated with our latest programs</p>
                    <div class="position-relative mx-auto" style="max-width: 400px;">
                        <input class="form-control border-0 w-100 py-3 ps-4 pe-5" type="text" placeholder="Your email" data-translate-placeholder="footer_email_placeholder">
                        <button type="button" class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2" data-translate="footer_signup">SignUp</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="copyright">
                <div class="row">
                    <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                        &copy; <a class="border-bottom" href="#">Global Academy</a>, <span data-translate="footer_rights">All Right Reserved</span>.
                    </div>
                    <div class="col-md-6 text-center text-md-end">
                        <div class="footer-menu">
                            <a href="" data-translate="footer_home">Home</a>
                            <a href="" data-translate="footer_cookies">Cookies</a>
                            <a href="" data-translate="footer_help">Help</a>
                            <a href="">FQAs</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer End -->
'@

foreach ($file in $htmlFiles) {
    Write-Host "Processing $($file.Name)..."
    
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    
    # Replace footer - match from <!-- Footer Start --> to <!-- Footer End -->
    $pattern = '(?s)<!-- Footer Start -->.*?<!-- Footer End -->'
    
    if ($content -match $pattern) {
        $content = $content -replace $pattern, $newFooter
        
        # Write back to file
        [System.IO.File]::WriteAllText($file.FullName, $content, [System.Text.UTF8Encoding]::new($false))
        Write-Host "Updated $($file.Name)" -ForegroundColor Green
    } else {
        Write-Host "Footer not found in $($file.Name)" -ForegroundColor Yellow
    }
}

Write-Host "`nAll files processed!" -ForegroundColor Cyan
