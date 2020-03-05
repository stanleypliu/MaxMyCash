const currencyAmount = document.getElement('#currency-amount');

const dropdownInput = document.getElement('#dropdown').value;
if ((dropdownInput !== null || dropdownInput !== undefined) && (currencyAmount !== null || currencyAmount !== undefined || currencyAmount !== 0)) {
  const dropdownInputSplit = dropdownInput.split(' ')[0];

  const currencyURL = 'https://gist.githubusercontent.com/Fluidbyte/2973986/raw/8bb35718d0c90fdacb388961c98b8d56abc392c9/Common-Currency.json';

  let currencyCodes = [];

  fetch(currencyURL)
  .then((data) => {
    data.forEach(currency => {
      currencyCodes.push(currency["codes"])
    });
  });

  if (currencyCodes.includes(dropdownInputSplit) == true) {
    const ratesURL = `http://data.fixer.io/api/latest?access_key=${ENV["FIXER_KEY"]}`;

    // currency_symbols
    // fixer's base currency is EUR
    let exchanged_amount = fetch(url)
                        .then((data) => {
                          // console.log(data);
                          // selected_rate = parsed_response["rates"].to_a.find { |rate| rate[1] == selectedrate }
                          if data.includes(dropdownInputSplit) {
                            data[dropdownInputSplit] * currencyAmount
                          }
                        });

    // # selected_rate[1].to_i * currency_amount to get amount of euros
    // # then multiply by gbp to euro exchange rate to get final value
  }


}



