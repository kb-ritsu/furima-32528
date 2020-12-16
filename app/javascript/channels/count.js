const { to } = require("color-string");
const { add } = require("lodash");

function count() {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1)
    const tax = Math.floor(inputValue * 0.1)
    const totalvalue = document.getElementById("profit");
    totalvalue.innerHTML = Math.floor(inputValue - tax)
  })
}
window.addEventListener("load", count)