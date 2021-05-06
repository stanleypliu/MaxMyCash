require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
require("ajax-currency-manipulation/ajax.js.erb")
require("animations/page_animations")
import Swal from 'sweetalert2'

import "bootstrap";
import { initMapbox } from '../plugins/init_mapbox';
import 'mapbox-gl/dist/mapbox-gl.css';
import 'controllers';

// document.addEventListener('turbolinks:load', () => {
//   initMapbox();
// })
initMapbox();

alert = document.querySelector('#payalert')

if (alert) {
  Swal.fire({
    title: 'Success!',
    text: 'Your transaction was received. Thank you for using Revonew.',
    icon: 'success',
    confirmButtonText: 'Great!'
  })
}


