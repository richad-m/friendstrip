import { initMapbox } from '../plugins/init_mapbox';

const tabButtons = () => {
  if (document.querySelector("#pending-prop")) {
    const pending = document.querySelector(".pending-prop");
    const validatedprop = document.querySelector(".validated-prop");
    const allprop = document.querySelector(".all-prop");

    const pendingBtn = document.querySelector("#pending-prop");
    const validatedpropBtn = document.querySelector("#validated-prop");
    const allpropBtn = document.querySelector("#all-prop");

    pendingBtn.addEventListener("click", (event) => {
      event.preventDefault();
      pending.classList.remove('d-none')
      allprop.classList.add('d-none')
      validatedprop.classList.add('d-none')

      pendingBtn.classList.remove('unactive-tab')
      validatedpropBtn.classList.add('unactive-tab')
      allpropBtn.classList.add('unactive-tab')
      if (document.querySelector("#map-all")) {
        initMapbox(document.querySelector("#map-all"));
      }

      if (document.querySelector("#map-validated")) {
        initMapbox(document.querySelector("#map-validated"));
      }

      if (document.querySelector("#map-pending")) {
        initMapbox(document.querySelector("#map-pending"));
      }
    });

    validatedpropBtn.addEventListener("click", (event) => {
      event.preventDefault();
      validatedprop.classList.remove('d-none')
      pending.classList.add('d-none')
      allprop.classList.add('d-none')

      validatedpropBtn.classList.remove('unactive-tab')
      pendingBtn.classList.add('unactive-tab')
      allpropBtn.classList.add('unactive-tab')
      if (document.querySelector("#map-all")) {
        initMapbox(document.querySelector("#map-all"));
      }

      if (document.querySelector("#map-validated")) {
        initMapbox(document.querySelector("#map-validated"));
      }

      if (document.querySelector("#map-pending")) {
        initMapbox(document.querySelector("#map-pending"));
      }
    });

    allpropBtn.addEventListener("click", (event) => {
      event.preventDefault();
      allprop.classList.remove('d-none')
      pending.classList.add('d-none')
      validatedprop.classList.add('d-none')

      allpropBtn.classList.remove('unactive-tab')
      pendingBtn.classList.add('unactive-tab')
      validatedpropBtn.classList.add('unactive-tab')
      if (document.querySelector("#map-all")) {
        initMapbox(document.querySelector("#map-all"));
      }

      if (document.querySelector("#map-validated")) {
        initMapbox(document.querySelector("#map-validated"));
      }

      if (document.querySelector("#map-pending")) {
        initMapbox(document.querySelector("#map-pending"));
      }
    });
  }
};

export {tabButtons}
