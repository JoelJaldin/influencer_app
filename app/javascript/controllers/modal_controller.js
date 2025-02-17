import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal", "form"]

  connect() {
    console.log("Modal controller connected") // Depuración
    this.modalTarget.classList.add("hidden")
  }

  open() {
    console.log("Opening modal") // Depuración
    document.body.classList.add("blur-background")
    this.modalTarget.classList.remove("hidden")
  }

  close() {
    console.log("Closing modal") // Depuración
    document.body.classList.remove("blur-background")
    this.modalTarget.classList.add("hidden")
    this.formTarget.reset() // Reinicia el formulario
  }
}