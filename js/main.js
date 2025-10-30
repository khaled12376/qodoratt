(function ($) {
    "use strict";

    // Spinner removal functionality
    window.addEventListener("load", function () {
        const spinner = document.getElementById("spinner");
        if (spinner) {
            spinner.classList.remove("show");
            setTimeout(() => spinner.remove(), 300); // Smooth fade optional
        }
    });

    // Spinner
    var spinner = function () {
        setTimeout(function () {
            if ($('#spinner').length > 0) {
                $('#spinner').removeClass('show');
            }
        }, 1);
    };
    spinner();
    
    // Initiate wow.js
    if (typeof WOW === "function") {
        new WOW().init();
    }

    // Sticky Navbar
    $(window).scroll(function () {
        if ($(this).scrollTop() > 300) {
            $('.sticky-top').css('top', '0px');
        } else {
            $('.sticky-top').css('top', '-100px');
        }
    });
    
    // Dropdown on mouse hover
    const $dropdown = $(".dropdown");
    const $dropdownToggle = $(".dropdown-toggle");
    const $dropdownMenu = $(".dropdown-menu");
    const showClass = "show";
    
    $(window).on("load resize", function() {
        if (this.matchMedia("(min-width: 992px)").matches) {
            $dropdown.hover(
                function() {
                    const $this = $(this);
                    $this.addClass(showClass);
                    $this.find($dropdownToggle).attr("aria-expanded", "true");
                    $this.find($dropdownMenu).addClass(showClass);
                },
                function() {
                    const $this = $(this);
                    $this.removeClass(showClass);
                    $this.find($dropdownToggle).attr("aria-expanded", "false");
                    $this.find($dropdownMenu).removeClass(showClass);
                }
            );
        } else {
            $dropdown.off("mouseenter mouseleave");
        }
    });
    
    // Back to top button
    $(window).scroll(function () {
        if ($(this).scrollTop() > 300) {
            $('.back-to-top').fadeIn('slow');
        } else {
            $('.back-to-top').fadeOut('slow');
        }
    });

    $('.back-to-top').click(function () {
        $('html, body').animate({scrollTop: 0}, 1500, 'easeInOutExpo');
        return false;
    });

    // Header carousel - Fast sliding with arrows
    // Initialize header carousel when document is ready
    $(document).ready(function() {
        if ($(".header-carousel").length > 0) {
            $(".header-carousel").owlCarousel({
                autoplay: true,
                autoplayTimeout: 4000, // 4 seconds between slides
                smartSpeed: 800,       // Fast transition speed
                items: 1,
                dots: false,           // Hide dots completely
                loop: true,
                nav: true,             // Always show navigation arrows
                animateOut: 'slideOutLeft',
                animateIn: 'slideInRight',
                navText: [
                    '<i class="bi bi-chevron-left"></i>',
                    '<i class="bi bi-chevron-right"></i>'
                ],
                responsive: {
                    0: {
                        nav: true,     // Show arrows on mobile too
                        dots: false    // Keep dots hidden on mobile
                    },
                    768: {
                        nav: true,
                        dots: true
                    }
                }
            });
        }
    });

    // Testimonials carousel
    $(".testimonial-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 1000,
        center: true,
        margin: 24,
        dots: true,
        loop: true,
        nav : false,
        responsive: {
            0: {
                items:1
            },
            768: {
                items:2
            },
            992: {
                items:3
            }
        }
    });
    
    // Smooth scrolling for anchor links
    $('a[href^="#"]').on('click', function(e) {
        e.preventDefault();
        const target = $(this.getAttribute('href'));
        if (target.length) {
            $('html, body').stop().animate({
                scrollTop: target.offset().top - 100
            }, 1000);
        }
    });

    // Show/Hide Programs functionality
    $('#toggleProgramsBtn').on('click', function() {
        const hiddenPrograms = $('.hidden-program');
        const btn = $(this);
        const currentLang = localStorage.getItem('language') || 'en';
        
        if (hiddenPrograms.first().is(':visible')) {
            // Hide programs
            hiddenPrograms.fadeOut(400);
            const showText = currentLang === 'ar' ? 'عرض كل البرامج' : 'Show All Programs';
            btn.html('<i class="fas fa-plus me-2"></i>' + showText);
        } else {
            // Show programs
            hiddenPrograms.fadeIn(400);
            const hideText = currentLang === 'ar' ? 'عرض أقل' : 'Show Less Programs';
            btn.html('<i class="fas fa-minus me-2"></i>' + hideText);
        }
    });

    // Show/Hide Diplomas functionality
    $('#toggleDiplomasBtn').on('click', function() {
        const hiddenDiplomas = $('.hidden-diploma');
        const btn = $(this);
        const currentLang = localStorage.getItem('language') || 'en';
        
        if (hiddenDiplomas.first().is(':visible')) {
            // Hide diplomas
            hiddenDiplomas.fadeOut(400);
            const showText = currentLang === 'ar' ? 'عرض كل الدبلومات' : 'Show All Diplomas';
            btn.html('<i class="fas fa-plus me-2"></i>' + showText);
        } else {
            // Show diplomas
            hiddenDiplomas.fadeIn(400);
            const hideText = currentLang === 'ar' ? 'عرض أقل' : 'Show Less Diplomas';
            btn.html('<i class="fas fa-minus me-2"></i>' + hideText);
        }
    });
    
})(jQuery);
