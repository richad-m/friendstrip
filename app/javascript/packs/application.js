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

document.addEventListener('turbolinks:load', () => {
  initMapbox();
  initAutocomplete();
  const pending = document.querySelector(".pending-prop");
  const allprop = document.querySelector(".all-prop");

  const pendingBtn = document.querySelector("#pending-prop");
  const allpropBtn = document.querySelector("#all-prop");

  pendingBtn.addEventListener("click", (event) => {
    event.preventDefault();
    pending.classList.remove('d-none')
    allprop.classList.add('d-none')
    pendingBtn.classList.remove('unactive-tab')
    allpropBtn.classList.add('unactive-tab')
  });

  allpropBtn.addEventListener("click", (event) => {
    event.preventDefault();
    allprop.classList.remove('d-none')
    pending.classList.add('d-none')
    allpropBtn.classList.remove('unactive-tab')
    pendingBtn.classList.add('unactive-tab')
  });
  initFlatpickr();
  $('.modal').on('shown.bs.modal', function () {
    $('#myInput').trigger('focus')
  })
  $(function () {
    $('[data-toggle="tooltip"]').tooltip()
  })
})
// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';



