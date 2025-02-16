import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["list"]

  sortBy(event) {
    const criteria = event.target.dataset.criteria
    fetch(`/influencers?sort=${criteria}`, {
      headers: { "Accept": "text/vnd.turbo-stream.html" }
    })
      .then(response => response.text())
      .then(html => {
        this.listTarget.innerHTML = html
      })
  }
}