// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
//require simple_form_extension


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

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  document.querySelectorAll(".radio-button").forEach(label => {
    label.addEventListener("click", (event) => {
      event.stopPropagation()
      if (event.currentTarget.classList.contains("question-card")) {
        const selected = document.getElementsByClassName("question-card radio-button selected")
        if (selected.length > 0) {
          selected[0].classList.remove("selected")
        }
        document.querySelectorAll(".question-card.radio-button").forEach(element => {
          element.classList.add("unselected")

        })
      }
      if (event.currentTarget.classList.contains("q-card")) {
        const selected = document.getElementsByClassName("q-card radio-button selected")
        if (selected.length > 0) {
          selected[0].classList.remove("selected")
        }
        document.querySelectorAll(".q-card.radio-button").forEach(element => {
          element.classList.add("unselected")

        })
      }
      event.currentTarget.classList.add("selected")
    })
  })

  // document.querySelectorAll(".form-check-label").forEach(label => {
    // label.addEventListener("click", (event) => {
    //   event.currentTarget.closest(".q-cards").querySelectorAll(".form-check-label").forEach(box => {
    //     box.classList.add("greyed-out")
    //   })
      // event.currentTarget.closest(".space-cards").querySelectorAll(".form-check-label").forEach(box => {
      //   box.classList.add("greyed-out")
      // })
  //     event.currentTarget.classList.remove("greyed-out")
  //   })
  // })
});
