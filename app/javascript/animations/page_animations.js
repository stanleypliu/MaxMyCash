// ELEMENTS - could put all of these in an array that the script checks through completely upon loading each page and if found, then it'll add the class to reduce code redundancy.

// Navbar
const navbarLeft = $('.navbar-left');
const exchangeLink = $('.navbar-link.responsive');

// Homepage
// const left = $('.left.w-50');
const homeClasses = [$('.home-description'), $('.revonew-description'),
$('.right'), $('.exchange-button'), $('.animated-coins'), $('svg')];
// const path = $('.path');


// Dashboard
const dashboardClasses = [$('.user-info'), $('.user-greeting'),
$('.avatar-dash'), $('.running-total'), $('.user-content-container'),
$('.tab-content')];

// New listing
const payment = $('.payment');
const listingForm = $('.card-box-shadow');

// Index of listings
const listingCard = $('.card');

// Buttons
const blueButtonHome = $('.blue-gradient-button-home');

// Carousel
const carouselAbout = $('.carousel-control-about');
const carouselTeam = $('.carousel-control-team');
const carouselItem = $('.carousel-item');

$(function () {
  $(window).width() < 600 ? exchangeLink.show() : exchangeLink.hide();
  if ($(window).width() >= 768) {
    navbarLeft.addClass('showing');
    if (blueButtonHome) {
      blueButtonHome.addClass('showing');
    }
    if (window.location.href == "http://www.revonew.xyz/" || "http://localhost:3000" ) {
      homeClasses.forEach(item => item.addClass('showing'));
      const animatedCoins = $('.animated-coins.showing');
      animatedCoins.on("animationend", function() {
        $('svg').addClass('fading');
      });
      // console.log(path.getTotalLength());
    };
    if (window.location.href == "http://www.revonew.xyz/dashboard" || "http://localhost:3000/dashboard") {
      dashboardClasses.forEach(item => item.addClass('showing'));
    };
    if (window.location.href == "http://www.revonew.xyz/listings/new" || "http://localhost:3000/listings/new") {
      payment.addClass('showing');
      listingForm.addClass('showing');
    };
    if (window.location.href == "http://www.revonew.xyz/listings" || "http://localhost:3000/listings") {
      listingCard.each(function(index) {
        // console.log(index);
        // const timeout = 1000 * index;
        // $(this).delay(timeout);
        $(this).addClass('showing');
      });
      listingCard.addClass('showing');
    };
    if (window.location.href == "http://www.revonew.xyz/about" || "http://localhost:3000/about") {
      // carouselAbout.hide();
      carouselAbout.on("click", function(){
        // console.log(carouselTeam.parentsUntil(".about-carousel"));
        const currentItem = carouselAbout.parentsUntil(".about-carousel");
        // console.log(currentItem.next());
        // console.log(carouselTeam.parents()[1].next());
        currentItem.removeClass('active');
        currentItem.prev().addClass('active');
      });
      carouselTeam.on("click", function(){
        // console.log(carouselTeam.parentsUntil(".about-carousel"));
        const currentItem = carouselTeam.parentsUntil(".about-carousel");
        // console.log(currentItem.next());
        // console.log(carouselTeam.parents()[1].next());
        currentItem.removeClass('active');
        currentItem.next().addClass('active');
        // carouselTeam.parents()[1].
      });
    }
  }
});
