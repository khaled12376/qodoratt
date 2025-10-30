# PowerShell script to add data-translate attributes to accounting programs

$filePath = "program-accounting-finance.html"
$content = Get-Content $filePath -Raw -Encoding UTF8

# Program 2
$content = $content -replace '(?s)<h4 class="text-primary mb-3">2\. Accounting and Costs in the Contracting Sector and Budget Preparation for Engineers</h4>\s*<h6 class="fw-bold mb-2"><span data-translate="objectives_title">Objectives:</span></h6>\s*<ul class="mb-3">\s*<li>Accounting systems in the contracting sector.*?</li>\s*<li>Statement of cash flows.*?</li>\s*<li>Statements reports.*?</li>\s*<li>Concept and importance.*?</li>\s*<li>Cost statements.*?</li>\s*</ul>\s*<h6 class="fw-bold mb-2"><span data-translate="main_axes_title">Main Axes:</span></h6>\s*<ul>\s*<li>Introduction to income statements.*?</li>\s*<li>Analysis and allocation.*?</li>\s*<li>Costs and profitability.*?</li>\s*<li>Factors of cost change.*?</li>\s*<li>Change in cost level.*?</li>\s*<li>Definition of planning budgets.*?</li>\s*<li>Revenue and expenditure.*?</li>\s*<li>Planning budgets as a control tool.*?</li>\s*</ul>', @'
<h4 class="text-primary mb-3" data-translate="acc_prog_2_title">2. Accounting and Costs in the Contracting Sector and Budget Preparation for Engineers</h4>
                            <h6 class="fw-bold mb-2"><span data-translate="objectives_title">Objectives:</span></h6>
                            <p data-translate="acc_prog_2_obj">Master accounting systems in the contracting sector and how to prepare budgets and financial statements including Income statements, Statement of financial position, Statement of cash flows, Annual profit statement and financial performance status. Learn the concept and importance of designing a cost system and its role in performing managerial functions, and understand cost statements and systems and their relationship to final profitability.</p>
                            <h6 class="fw-bold mb-2"><span data-translate="main_axes_title">Main Axes:</span></h6>
                            <ul>
                                <li data-translate="acc_prog_2_axis_1">Introduction to income statements (Statement of results of operations)</li>
                                <li data-translate="acc_prog_2_axis_2">Analysis and allocation of costs to products</li>
                                <li data-translate="acc_prog_2_axis_3">Costs and profitability planning of the enterprise</li>
                                <li data-translate="acc_prog_2_axis_4">Factors of cost change and cost activity</li>
                                <li data-translate="acc_prog_2_axis_5">Change in cost level and its impact on the value of fixed and variable costs</li>
                                <li data-translate="acc_prog_2_axis_6">Definition of planning budgets - their functions and types</li>
                                <li data-translate="acc_prog_2_axis_7">Revenue and expenditure budget (Case studies)</li>
                                <li data-translate="acc_prog_2_axis_8">Planning budgets as a control tool (Case study)</li>
                            </ul>
'@

Write-Host "Processing accounting programs..." -ForegroundColor Cyan

# Save file
[System.IO.File]::WriteAllText($filePath, $content, [System.Text.UTF8Encoding]::new($false))

Write-Host "Updated $filePath" -ForegroundColor Green
