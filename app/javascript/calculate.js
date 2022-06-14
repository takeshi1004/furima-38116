function calculate() {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const shipCharge = itemPrice.value * 0.1;
    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = Math.floor(shipCharge);

    const profit = document.getElementById("profit");
    profit.innerHTML = Math.floor(itemPrice.value - shipCharge);
  });


};

window.addEventListener('load', calculate);
