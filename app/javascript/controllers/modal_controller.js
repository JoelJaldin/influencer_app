// app/javascript/controllers/modal_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal"]

  connect() {
    this.modalTarget.classList.add("hidden")
  }

  open() {
    document.body.classList.add("blur-background")
    this.modalTarget.classList.remove("hidden")
  }

  close() {
    document.body.classList.remove("blur-background")
    this.modalTarget.classList.add("hidden")
  }
    // Puedes agregar una función para cerrar el modal tras una acción de éxito, por ejemplo:
  closeOnSuccess() {
    this.close()
  }
}