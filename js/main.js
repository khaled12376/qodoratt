(function ($) {
    "use strict";

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

    // Header carousel
    $(".header-carousel").owlCarousel({
        autoplay: true,
        autoplayTimeout: 3000, // time between slides
        smartSpeed: 600,       // make the transition faster
        items: 1,
        dots: false,
        loop: true,
        nav: true,
        animateOut: 'slideOutLeftFast',
        animateIn: 'slideInRightFast',
        navText: [
            '<i class="bi bi-chevron-left"></i>',
            '<i class="bi bi-chevron-right"></i>'
        ]
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
    
    // Statistics Counter Animation
    function animateCounter() {
        $('.stat-number').each(function() {
            const $this = $(this);
            const target = parseInt($this.data('target'));
            const duration = 2000; // 2 seconds
            const increment = target / (duration / 16); // 60fps
            let current = 0;
            
            const updateCounter = () => {
                if (current < target) {
                    current += increment;
                    if (current > target) current = target;
                    $this.text(Math.floor(current) + (target === 98 ? '' : '+'));
                    requestAnimationFrame(updateCounter);
                } else {
                    $this.text(target + (target === 98 ? '%' : '+'));
                }
            };
            
            updateCounter();
        });
    }
    
    // Trigger counter animation when stats section comes into view
    $(window).scroll(function() {
        const statsSection = $('.stats-section');
        if (statsSection.length) {
            const statsTop = statsSection.offset().top;
            const statsHeight = statsSection.outerHeight();
            const windowTop = $(window).scrollTop();
            const windowHeight = $(window).height();
            
            if (windowTop + windowHeight > statsTop + (statsHeight / 2) && !statsSection.hasClass('animated')) {
                statsSection.addClass('animated');
                animateCounter();
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
    
})(jQuery);
