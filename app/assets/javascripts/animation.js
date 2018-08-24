jQuery("#js-rotating").Morphext({
    // The [in] animation type. Refer to Animate.css for a list of available animations.
    animation: "fadeInDown",
    // An array of phrases to rotate are created based on this separator. Change it if you wish to separate the phrases differently (e.g. So Simple | Very Doge | Much Wow | Such Cool).
    separator: ",",
    // The delay between the changing of each phrase in milliseconds.
    speed: 2000,
    complete: function () {
        // Called after the entrance animation is executed.
    }
});



let activeSlide = jQuery('.js-first');

jQuery('.js-second').hide();
jQuery('.js-third').hide();

jQuery('.banner').on('click', function() {
  activeSlide.addClass('animated fadeOutRight');
  activeSlide = activeSlide.next();
  activeSlide.show().addClass('animated fadeInLeft');
});





// document.addEventListener('DOMContentLoaded', function() {
//   // jQuery('.js-home-banner').hide();
//   // jQuery('.js-home-banner').delay(2000).fadeIn(2000);
//   textAnimation('.js-text-one', '.js-text-two');

// });

// const textAnimation = (elementToDisappear, elementToAppear) => {
//   jQuery(elementToDisappear).slideUp(2000);
//   jQuery(elementToAppear).delay(1000).slideDown(1000);
// }
