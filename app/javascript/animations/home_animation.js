const left = $('.left.w-50');
const right = $('.right.w-50');
const navbarLeft = $('.navbar-left');
const exchangeButton = $('.black-gradient-button');

$(function () {
  if (left && right) {
    console.log('success');
    left.addClass('showing');
    right.addClass('showing');
  };
  navbarLeft.addClass('showing');
  if (exchangeButton) {
    exchangeButton.addClass('showing');
  };
});

