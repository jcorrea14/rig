/*!
 * Start Bootstrap - Agnecy Bootstrap Theme (http://startbootstrap.com)
 * Code licensed under the Apache License v2.0.
 * For details, see http://www.apache.org/licenses/LICENSE-2.0.
 */

// jQuery for page scrolling feature - requires jQuery Easing plugin
$(function() {
    $('a.page-scroll').bind('click', function(event) {
        var $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: $($anchor.attr('href')).offset().top
        }, 1500, 'easeInOutExpo');
        event.preventDefault();
    });
});

// Highlight the top nav as scrolling occurs
$('body').scrollspy({
    target: '.navbar-fixed-top'
})

// Closes the Responsive Menu on Menu Item Click
$('.navbar-collapse ul li a').click(function() {
    $('.navbar-toggle:visible').click();
});


// BG Parallax

(function($) {

    $.fn.parallax = function(options) {

        var windowHeight = $(window).height();

        // Establish default settings
        var settings = $.extend({
            speed: 0.15
        }, options);

        // Iterate over each object in collection
        return this.each(function() {

            // Save a reference to the element
            var $this = $(this);

            // Set up Scroll Handler
            $(document).scroll(function() {

                var scrollTop = $(window).scrollTop();
                var offset = $this.offset().top;
                var height = $this.outerHeight();

                // Check if above or below viewport
                if (offset + height <= scrollTop || offset >= scrollTop + windowHeight) {
                    return;
                }

                var yBgPosition = Math.round((offset - scrollTop) * settings.speed);

                // Apply the Y Background Position to Set the Parallax Effect
                $this.css('background-position', 'center ' + yBgPosition + 'px');

            });
        });
    }
}(jQuery));

$(document).ready(function() {
    $window = $(window);
    if ($window.width() > 1200) {
        // Cache the Window object
	   
        $('.why-rig-locator').parallax({
            speed: 0.25
        });

        $('.become-member').parallax({
            speed: 0.45
        });
    }
});


    jQuery(document).ready(function ($) {
        $('#tabs').tab();
    });
  