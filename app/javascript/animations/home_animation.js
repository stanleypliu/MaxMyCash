// Homepage
const left = $('.left.w-50');
const right = $('.right.w-50');

// Navbar
const navbarLeft = $('.navbar-left');
const exchangeButton = $('.black-gradient-button');

// Dashboard
const userInfo = $('.user-info');
const userGreeting = $('.user-greeting');
const avatar = $('.avatar-dash');
const runningTotal = $('.running-total');
const userContent = $('.user-content-container');
const tabContent = $('.tab-content');

$(function () {
  if (left && right) {
    // console.log('success');
    left.addClass('showing');
    right.addClass('showing');
  };
  navbarLeft.addClass('showing');
  if (exchangeButton) {
    exchangeButton.addClass('showing');
  };
  if (window.location.href == "http://www.revonew.xyz/dashboard" || "http://localhost:3000/dashboard") {
    userInfo.addClass('showing');
    userGreeting.addClass('showing');
    avatar.addClass('showing');
    runningTotal.addClass('showing');
    userContent.addClass('showing');
    tabContent.addClass('showing');
  };
});

