import { Controller } from "@hotwired/stimulus";
import Swal from "sweetalert2";

// Connects to data-controller="alert"
export default class extends Controller {
  static targets = ["link"];

  show(event) {
    console.log("clicked!!!");
    event.preventDefault();
    Swal.fire({
      title: "Are you sure?",
      text: "This action cannot be undone.",
      icon: "warning",
      showCancelButton: true,
      confirmButtonText: "Yes, delete it!",
    }).then((result) => {
      console.log(result);
      if (result.isConfirmed) {
        // actually delete iot
        // click on the hidden link that does the deleting
        this.linkTarget.click();
      }
    });
  }
}
