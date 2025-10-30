# Update Management Programs with Full Details

$filePath = "program-management.html"
$content = Get-Content $filePath -Raw -Encoding UTF8

# Program 1: Effective Administrative Communication
$old1 = @"
            <!-- Program 1 -->
            <div class="mb-4 p-4 bg-light rounded">
              <h4 class="text-primary mb-3" data-translate="mgmt_prog_1_title">1. Effective Administrative Communication</h4>
              <a href="contact.html" class="btn btn-primary mt-3">
                <i class="fa fa-user-plus me-2"></i><span data-translate="enroll_button">Enroll in This Program</span>
              </a>
            </div>
"@

$new1 = @"
            <!-- Program 1 -->
            <div class="mb-4 p-4 bg-light rounded">
              <h4 class="text-primary mb-3" data-translate="mgmt_prog_1_title">1. Effective Administrative Communication</h4>
              <h6 class="fw-bold mb-2"><span data-translate="program_objectives_label">Objectives:</span></h6>
              <ul class="mb-3">
                <li data-translate="mgmt_prog_1_obj_1">Train the participant on the most important skills that help them achieve good communication with their employees</li>
                <li data-translate="mgmt_prog_1_obj_2">Learn the art of dealing with difficult individuals</li>
              </ul>
              <h6 class="fw-bold mb-2"><span data-translate="main_axes_label">Main Axes:</span></h6>
              <ul>
                <li data-translate="mgmt_prog_1_axis_1">Personality and human behavior</li>
                <li data-translate="mgmt_prog_1_axis_2">Concept and importance of effective communication</li>
                <li data-translate="mgmt_prog_1_axis_3">Elements of effective communication</li>
                <li data-translate="mgmt_prog_1_axis_4">Conditions for successful communication</li>
                <li data-translate="mgmt_prog_1_axis_5">Most important types of communication</li>
                <li data-translate="mgmt_prog_1_axis_6">Barriers to the communication process</li>
                <li data-translate="mgmt_prog_1_axis_7">Evaluation of communication skills</li>
              </ul>
              <a href="contact.html" class="btn btn-primary mt-3">
                <i class="fa fa-user-plus me-2"></i><span data-translate="enroll_button">Enroll in This Program</span>
              </a>
            </div>
"@

$content = $content.Replace($old1, $new1)

# Program 2: Advanced Skills in Office Management
$old2 = @"
            <!-- Program 2 -->
            <div class="mb-4 p-4 bg-light rounded">
              <h4 class="text-primary mb-3" data-translate="mgmt_prog_2_title">2. Advanced Skills in Office Management and Work Organization</h4>
              <a href="contact.html" class="btn btn-primary mt-3">
                <i class="fa fa-user-plus me-2"></i><span data-translate="enroll_button">Enroll in This Program</span>
              </a>
            </div>
"@

$new2 = @"
            <!-- Program 2 -->
            <div class="mb-4 p-4 bg-light rounded">
              <h4 class="text-primary mb-3" data-translate="mgmt_prog_2_title">2. Advanced Skills in Office Management and Work Organization</h4>
              <h6 class="fw-bold mb-2"><span data-translate="program_objectives_label">Objectives:</span></h6>
              <ul class="mb-3">
                <li data-translate="mgmt_prog_2_obj_1">Develop the necessary knowledge, skills, and attitudes to understand the function of executive secretarial work and office management</li>
                <li data-translate="mgmt_prog_2_obj_2">Develop the competencies and skills of employees in secretarial and office management</li>
                <li data-translate="mgmt_prog_2_obj_3">Develop the behavioral skills of secretarial staff and prepare them psychologically and professionally</li>
                <li data-translate="mgmt_prog_2_obj_4">Develop the skills of executive secretarial work, office management, as well as effective communication skills</li>
                <li data-translate="mgmt_prog_2_obj_5">Acquire and develop meeting organization skills, memo and message coordination skills, as well as dealing with others skills</li>
              </ul>
              <h6 class="fw-bold mb-2"><span data-translate="main_axes_label">Main Axes:</span></h6>
              <ul>
                <li data-translate="mgmt_prog_2_axis_1">Executive secretarial work and the fundamentals of modern office management</li>
                <li data-translate="mgmt_prog_2_axis_2">Effective skills in office management and secretarial work</li>
                <li data-translate="mgmt_prog_2_axis_3">Technical secretarial skills</li>
                <li data-translate="mgmt_prog_2_axis_4">Effective communication and correspondence skills</li>
                <li data-translate="mgmt_prog_2_axis_5">The role of information technology and office work skills</li>
              </ul>
              <a href="contact.html" class="btn btn-primary mt-3">
                <i class="fa fa-user-plus me-2"></i><span data-translate="enroll_button">Enroll in This Program</span>
              </a>
            </div>
"@

$content = $content.Replace($old2, $new2)

Write-Host "Programs 1-2 updated..." -ForegroundColor Green

# Save the file
Set-Content -Path $filePath -Value $content -Encoding UTF8 -NoNewline
Write-Host "File saved successfully!" -ForegroundColor Cyan
