import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
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
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  final url;

  CoinData(this.url);

  Future getBTCtoUSD() async {
    var response = await http.get(this.url);

    if (response.statusCode == 200) {
      print(response.statusCode);
      var data = convert.jsonDecode(response.body);
      return data['rate'];
    } else {
      print(response.statusCode);
    }
  }
}
