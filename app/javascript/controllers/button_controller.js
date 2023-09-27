import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="button"
export default class extends Controller {
  connect() {
    console.log("connected to button controller")
  }

  changeColor() {
    console.log("change color");
    if (this.element.classList.contains("bg-blue-500")) {
      this.element.classList.replace("bg-blue-500", "bg-red-500");
    } else if (this.element.classList.contains("bg-red-500")) {
      this.element.classList.replace("bg-red-500", "bg-blue-500");
    }
  }

}
