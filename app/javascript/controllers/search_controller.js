// app/javascript/controllers/search_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "list"]

  async search() {
    const query = this.inputTarget.value
    const response = await fetch(`/influencers?query=${encodeURIComponent(query)}`, {
      headers: { "Accept": "text/vnd.turbo-stream.html" }
    })
    const html = await response.text()
    this.listTarget.innerHTML = html
  }
}