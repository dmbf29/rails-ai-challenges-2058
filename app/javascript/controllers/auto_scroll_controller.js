import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="auto-scroll"
export default class extends Controller {
  connect() {
    // this.element -> where we put the controller (user's message)
    this.element.scrollIntoView();
  }
}
