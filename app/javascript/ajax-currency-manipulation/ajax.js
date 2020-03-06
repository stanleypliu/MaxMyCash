const exchangedCurrency = document.querySelector('.exchanged-currency');
const dropdownInput = document.querySelector('.dropdown-currency');
const ratesURL = `http://data.fixer.io/api/latest?access_key=6be59aaac4ccb088b8d91e92e87bf7fa`;

dropdownInput.addEventListener('input', (event) => {
  const currency = event.target.value;
  const currencyAmount = document.querySelector('.currency-amount').value;
  const dropdownInputSplit = currency.split(' ')[0];
  fetch(ratesURL).then(response => response.json()).then((data) => {
    document.querySelector('.exchanged-currency').innerHTML = "";
    const exchanged_amount = (currencyAmount / data.rates[dropdownInputSplit]).toFixed(2);
    exchangedCurrency.insertAdjacentHTML('afterbegin', `<br><div class="currency-span"><h3>You'll get <b>${exchanged_amount} Euros</b> back<h3>!</div></br>`);
  })
})
