'turbo:load turbo:render'.split(" ").forEach(function(eventName){
  window.addEventListener(eventName, function(){
    const itemPrice = document.getElementById("item-price");
  
    itemPrice.addEventListener('input', function(){
      const addTaxPrice = document.getElementById("add-tax-price");
      const profit = document.getElementById("profit")
      const itemPriceVal = itemPrice.value;
      const addTaxPriceVal = itemPriceVal * 0.1;
      const profitVal = itemPriceVal - addTaxPriceVal
      
      addTaxPrice.textContent = `${Math.floor(addTaxPriceVal)}`;
      profit.textContent = `${Math.floor(profitVal)}`;
    });
  });
});

