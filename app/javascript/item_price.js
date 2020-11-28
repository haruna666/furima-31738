window.addEventListener('load', function(){
	const itemPrice = document.getElementById("item-price")
	itemPrice.addEventListener("input", () => {
		const inputValue = itemPrice.value;
		console.log(inputValue);

		const addTaxPrice = document.getElementById("add-tax-price")
		addTaxPrice.innerHTML = (Math.floor(inputValue * 0.1));
		console.log(addTaxPrice);

		const profitNumber = document.getElementById("profit")
		// const value_result = inputValue * 0.1
		// console.log(value_result)
		profitNumber.innerHTML = (Math.floor(inputValue * 0.9));
		console.log(profitNumber);
	})
});
