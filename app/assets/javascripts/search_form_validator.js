var amount = document.getElementById("amount");

if (amount) {
  amount.addEventListener("input", function (event) {
  if (amount.validity.typeMismatch) {
    amount.setCustomValidity("Please enter an amount!");
  }
  else {
    amount.setCustomValidity("");
  }
});
}

