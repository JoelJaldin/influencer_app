import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "counter"]

  connect() {
    this.updateCounter()
  }

  updateCounter() {
    const length = this.inputTarget.value.length
    this.counterTarget.textContent = `${length}/50 caracteres`
  }
}