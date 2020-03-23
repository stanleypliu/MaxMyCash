// Navbar
const navbarLeft = $('.navbar-left');

// Homepage
// const left = $('.left.w-50');
const homeDesc = $('.home-description');
const revoDesc = $('.revonew-description');
const right = $('.right.w-50');
const exchangeButton = $('.black-gradient-button');
const animatedCoins = $('.animated-coins');
const path = $('.path');


// Dashboard
const userInfo = $('.user-info');
const userGreeting = $('.user-greeting');
const avatar = $('.avatar-dash');
const runningTotal = $('.running-total');
const userContent = $('.user-content-container');
const tabContent = $('.tab-content');

// New listing
const payment = $('.payment');
const listingForm = $('.card-box-shadow');

// Index of listings
const listingCard = $('.card');

// Buttons
const blueButtonHome = $('.blue-gradient-button-home');

$(function () {
  navbarLeft.addClass('showing');
  if (blueButtonHome) {
    blueButtonHome.addClass('showing');
  }
  if (window.location.href == "http://www.revonew.xyz/" || "http://localhost:3000" ) {
    // console.log('success');
    // left.addClass('showing');
    homeDesc.addClass('showing');
    revoDesc.addClass('showing');
    right.addClass('showing');
    animatedCoins.addClass('showing');
    exchangeButton.addClass('showing');
    blueButtonHome.addClass('showing');
  };
  if (window.location.href == "http://www.revonew.xyz/dashboard" || "http://localhost:3000/dashboard") {
    userInfo.addClass('showing');
    userGreeting.addClass('showing');
    avatar.addClass('showing');
    runningTotal.addClass('showing');
    userContent.addClass('showing');
    tabContent.addClass('showing');
  };
  if (window.location.href == "http://www.revonew.xyz/listings/new" || "http://localhost:3000/listings/new") {
    payment.addClass('showing');
    listingForm.addClass('showing');
  };
  if (window.location.href == "http://www.revonew.xyz/listings" || "http://localhost:3000/listings") {
    // listingCard.each(function(index) {
      // console.log(index);
    //   $(this).delay(1000*index).addClass('showing');
    // });
    listingCard.addClass('showing');
  };
});

