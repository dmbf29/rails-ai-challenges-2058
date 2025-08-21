import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="spin"
export default class extends Controller {
  start(event) {
    const div = this.element;
    div.insertAdjacentHTML(
      "beforeend",
      '<div class="btn btn-primary disabled"><i class="fa-solid fa-snowflake fa-spin"></i></div>'
    );
    event.currentTarget.remove();
    this.element.requestSubmit();
  }
}
