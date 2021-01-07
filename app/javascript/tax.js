window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const salesProfit = document.getElementById("profit")

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1 )
    salesProfit.innerHTML = (inputValue - addTaxDom.innerHTML).toLocaleString('ja-JP');
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1 ).toLocaleString('ja-JP');
  })
});