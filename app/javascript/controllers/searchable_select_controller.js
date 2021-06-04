import { Controller } from "stimulus";
import Choices from "choices.js";

export default class extends Controller {
  static targets = ['input']
  connect() {
    this._initChoice();
  }
  _initChoice() {
    this.choicesInstance = new Choices(this.inputTarget, {
      removeItemButton: true,
      classNames: {
        containerOuter: 'choices select-multiple'
      }
    });
  };
};
