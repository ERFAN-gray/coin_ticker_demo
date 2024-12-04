import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'IRT',
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'USD',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '9CB30313-4EAC-4DD4-AB4C-3F4DD69D0210';

class CoinData {
  Future getCoinData(String currency) async {
    http.Response response =
        await http.get(Uri.parse("$coinAPIURL/BTC/$currency?apikey=$apiKey"));
    print(response.body);
  }
}
