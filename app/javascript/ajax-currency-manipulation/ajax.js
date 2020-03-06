const ratesURL = `http://data.fixer.io/api/latest?access_key=6be59aaac4ccb088b8d91e92e87bf7fa`;

const exchangedCurrency = document.querySelector('.exchanged-currency');
const dropdownInput = document.querySelector('.dropdown-currency');
const currencyAmount = document.querySelector('.currency-amount');

dropdownInput.addEventListener('input', (event) => {
  const currencyType = event.target.value;
  const dropdownInputSplit = currencyType.split(' ')[0];
  fetch(ratesURL).then(response => response.json()).then((data) => {
    document.querySelector('.exchanged-currency').innerHTML = "";
    const exchanged_amount = (currencyAmount.value / data.rates[dropdownInputSplit]).toFixed(2);
    isNaN(exchanged_amount) ? 0 : exchangedCurrency.insertAdjacentHTML('afterbegin', `<br><div class="currency-span"><p>You'll get <b>${exchanged_amount} Euros</b> back<p></div></br>`);
  });
});

currencyAmount.addEventListener('input', (event) => {
  // if (dropdownInput.value == undefined) {
  //   return
  // }
  const currencyType = dropdownInput.value;
  const dropdownInputSplit = currencyType.split(' ')[0];

  fetch(ratesURL).then(response => response.json()).then((data) => {
    document.querySelector('.exchanged-currency').innerHTML = "";
    const exchanged_amount = (event.target.value / data.rates[dropdownInputSplit]).toFixed(2);
    isNaN(exchanged_amount) ? 0 : exchangedCurrency.insertAdjacentHTML('afterbegin', `<br><div class="currency-span"><p>You'll get <b>${exchanged_amount} Euros</b> back<p></div></br>`);
  });
});
