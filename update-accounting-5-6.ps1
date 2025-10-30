# Update remaining accounting programs 5-15 with data-translate attributes

$file = "program-accounting-finance.html"
$content = Get-Content $file -Raw -Encoding UTF8

# Program 5
$content = $content -replace `
'<!-- Program 5 -->\s*<div class="mb-4 p-4 bg-light rounded">\s*<h4 class="text-primary mb-3">5\. Preparation and Analysis of the Cash Flow Statement</h4>', `
'<!-- Program 5 -->
                        <div class="mb-4 p-4 bg-light rounded">
                            <h4 class="text-primary mb-3" data-translate="acc_prog_5_title">5. Preparation and Analysis of the Cash Flow Statement</h4>'

$content = $content -replace `
'<h6 class="fw-bold mb-2"><span data-translate="objectives_title">Objectives:</span></h6>\s*<ul class="mb-3">\s*<li>Importance of the cash flow statement and methods of its preparation</li>\s*<li>Concept, characteristics, and sources of cash flows</li>\s*<li>How to prepare and present the cash flow statement</li>\s*</ul>\s*<h6 class="fw-bold mb-2"><span data-translate="main_axes_title">Main Axes:</span></h6>\s*<ul>\s*<li>Conceptual framework of cash flow statements</li>\s*<li>Operating, investing, and financing activities of economic enterprises</li>\s*<li>Importance of presenting cash flow information</li>\s*<li>Distinguishing between the cash budget and the cash flow statement</li>\s*<li>Data required for preparing the cash flow statement</li>\s*<li>Egyptian and international standards for cash flows</li>\s*<li>Egyptian Accounting Standard \(4\) – American Accounting Standard \(95\)</li>\s*<li>International Accounting Standard \(7\)</li>\s*<li>Practical case studies</li>\s*</ul>\s*<a href="contact\.html" class="btn btn-primary mt-3">\s*<i class="fa fa-user-plus me-2"></i>Enroll in This Program\s*</a>\s*</div>\s*<!-- Program 6 -->', `
'<h6 class="fw-bold mb-2"><span data-translate="objectives_title">Objectives:</span></h6>
                            <p data-translate="acc_prog_5_obj">Understand the importance of the cash flow statement and methods of its preparation. Learn the concept, characteristics, and sources of cash flows. Master how to prepare and present the cash flow statement.</p>
                            <h6 class="fw-bold mb-2"><span data-translate="main_axes_title">Main Axes:</span></h6>
                            <ul>
                                <li data-translate="acc_prog_5_axis_1">Conceptual framework of cash flow statements</li>
                                <li data-translate="acc_prog_5_axis_2">Operating, investing, and financing activities of economic enterprises</li>
                                <li data-translate="acc_prog_5_axis_3">Importance of presenting cash flow information</li>
                                <li data-translate="acc_prog_5_axis_4">Distinguishing between the cash budget and the cash flow statement</li>
                                <li data-translate="acc_prog_5_axis_5">Data required for preparing the cash flow statement</li>
                                <li data-translate="acc_prog_5_axis_6">Egyptian and international standards for cash flows</li>
                                <li data-translate="acc_prog_5_axis_7">Egyptian Accounting Standard (4) – American Accounting Standard (95)</li>
                                <li data-translate="acc_prog_5_axis_8">International Accounting Standard (7)</li>
                                <li data-translate="acc_prog_5_axis_9">Practical case studies</li>
                            </ul>
                            <a href="contact.html" class="btn btn-primary mt-3">
                                <i class="fa fa-user-plus me-2"></i>Enroll in This Program
                            </a>
                        </div>

                        <!-- Program 6 -->'

# Program 6
$content = $content -replace `
'<!-- Program 6 -->\s*<div class="mb-4 p-4 bg-light rounded">\s*<h4 class="text-primary mb-3">6\. Accounting and Tax Problems of Contracting Companies and How to Deal with Them</h4>\s*<h6 class="fw-bold mb-2"><span data-translate="objectives_title">Objectives:</span></h6>\s*<p class="mb-3">Full awareness of all scientific and practical aspects in addressing the accounting and tax problems in the contracting sector and how to deal with them and avoid common mistakes in this vital field\.</p>\s*<h6 class="fw-bold mb-2"><span data-translate="main_axes_title">Main Axes:</span></h6>\s*<ul>\s*<li>Accounting standards\.\.\. and their importance for related organizations</li>\s*<li>Relationship between accounting standards and auditing standards</li>\s*<li>Accounting problems for fixed assets and depreciation</li>\s*<li>Accounting problems for financial and real estate investments</li>\s*<li>Accounting problems for joint ownership shares</li>\s*<li>Accounting problems for revenue recognition and long-term contracts</li>\s*<li>Presentation of assets and liabilities</li>\s*<li>Change in accounting policies</li>\s*</ul>', `
'<!-- Program 6 -->
                        <div class="mb-4 p-4 bg-light rounded">
                            <h4 class="text-primary mb-3" data-translate="acc_prog_6_title">6. Accounting and Tax Problems of Contracting Companies and How to Deal with Them</h4>
                            <h6 class="fw-bold mb-2"><span data-translate="objectives_title">Objectives:</span></h6>
                            <p class="mb-3" data-translate="acc_prog_6_obj">Gain full awareness of all scientific and practical aspects in addressing the accounting and tax problems in the contracting sector and how to deal with them and avoid common mistakes in this vital field.</p>
                            <h6 class="fw-bold mb-2"><span data-translate="main_axes_title">Main Axes:</span></h6>
                            <ul>
                                <li data-translate="acc_prog_6_axis_1">Accounting standards and their importance for related organizations</li>
                                <li data-translate="acc_prog_6_axis_2">Relationship between accounting standards and auditing standards</li>
                                <li data-translate="acc_prog_6_axis_3">Accounting problems for fixed assets and depreciation</li>
                                <li data-translate="acc_prog_6_axis_4">Accounting problems for financial and real estate investments</li>
                                <li data-translate="acc_prog_6_axis_5">Accounting problems for joint ownership shares</li>
                                <li data-translate="acc_prog_6_axis_6">Accounting problems for revenue recognition and long-term contracts</li>
                                <li data-translate="acc_prog_6_axis_7">Presentation of assets and liabilities</li>
                                <li data-translate="acc_prog_6_axis_8">Change in accounting policies</li>
                            </ul>'

Write-Host "Processing programs 5-6..." -ForegroundColor Cyan

# Save
[System.IO.File]::WriteAllText($file, $content, [System.Text.UTF8Encoding]::new($false))
Write-Host "Updated programs 5-6" -ForegroundColor Green
