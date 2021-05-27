import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('proposition_address');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
