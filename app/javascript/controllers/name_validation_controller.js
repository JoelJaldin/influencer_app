import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "message"]

  async checkName() {
    const name = this.inputTarget.value
    const response = await fetch(`/influencers/check_name?name=${encodeURIComponent(name)}`)
    const data = await response.json()

    if (data.exists) {
      this.messageTarget.textContent = "Este nombre ya está en uso."
      this.messageTarget.classList.add("text-red-500")
    } else {
      this.messageTarget.textContent = "Nombre disponible."
      this.messageTarget.classList.remove("text-red-500")
    }
  }
}