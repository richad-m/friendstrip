// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import { initFlatpickr } from "../plugins/flatpickr";
import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete';
import { tabButtons } from '../components/tab_button';

document.addEventListener('turbolinks:load', () => {
  initFlatpickr();
  initAutocomplete();
  tabButtons();
  $('.modal').on('shown.bs.modal', function () {
    $('#myInput').trigger('focus')
  })
  $(function () {
    $('[data-toggle="tooltip"]').tooltip()
  })
  // initMapbox();
  if (document.querySelector("#map-pending")) {
    initMapbox(document.querySelector("#map-pending"));
  }

  if (document.querySelector("#map-validated")) {
    initMapbox(document.querySelector("#map-validated"));
  }

  if (document.querySelector("#map-all")) {
    initMapbox(document.querySelector("#map-all"));
  }
})

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';



