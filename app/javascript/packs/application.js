require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
require("ajax-currency-manipulation/ajax")
require("animations/home_animation")

import "bootstrap";
import { initMapbox } from '../plugins/init_mapbox';

initMapbox();
// document.addEventListener('turbolinks:load', () => {


// })
