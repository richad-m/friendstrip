import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

const initFlatpickr = () => {

  const bookingForm = document.getElementById('booking-form-div');
  if (bookingForm) {
    flatpickr("#range_start", {
      plugins: [new rangePlugin({ input: "#range_end"})],
      minDate: "today",
      inline: true,
      dateFormat: "Y-m-d"
    })
  };

  // const startDate = document.getElementsByClassName('flatpickr-day selected startRange');
  // const endDate = document.getElementsByClassName(' flatpickr-day selected endRange');

  // const changeClass = (element) => {
  //   element.classList.remove(' selected endRange') || element.classList.remove('selected startRange');
  // };

  // if (startDate && endDate) {
  //   startDate.addEventListener('click', (event) => {
  //     event.preventDefault();
  //      changeClass(startDate)
  //     console.log(startDate)
  //   });
  //   endDate.addEventListener('click', (event) => {
  //     event.preventDefault();
  //      changeClass(endDate)
  //   });
  // }
}

export { initFlatpickr };


// Verifier a chaue clic si .startRange.selected exists
                            // .endRange.selected exists
                            // si oui suppriòer les deux classes de ces eleòents au prochain clic dans le flatpickr
