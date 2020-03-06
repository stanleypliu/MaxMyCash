require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
require("ajax-currency-manipulation/ajax")

import "bootstrap";
import { initMapbox } from '../plugins/init_mapbox';

initMapbox();
// document.addEventListener('turbolinks:load', () => {
 
// })