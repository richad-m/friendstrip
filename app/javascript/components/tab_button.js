
const tabButtons = () => {
  if (document.querySelector("#pending-prop")) {
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
  }
};

export {tabButtons}
