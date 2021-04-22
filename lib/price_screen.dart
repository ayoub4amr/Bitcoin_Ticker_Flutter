import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:bitcoin_ticker/coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  var btc = '?';
  var eth = '?';
  var ltc = '?';

  Future getBtc(selectedCurrency) async {
    var url = Uri.parse(
        'https://rest.coinapi.io/v1/exchangerate/BTC/$selectedCurrency?apikey=53834A8A-4539-4885-A054-5A6E995B4431');
    double rate = await CoinData(url).getBTCtoUSD();
    setState(() {
      btc = rate.toStringAsFixed(0);
    });
  }

  Future getEth(selectedCurrency) async {
    var url = Uri.parse(
        'https://rest.coinapi.io/v1/exchangerate/ETH/$selectedCurrency?apikey=53834A8A-4539-4885-A054-5A6E995B4431');
    double rate = await CoinData(url).getBTCtoUSD();
    setState(() {
      eth = rate.toStringAsFixed(0);
    });
  }

  Future getLtc(selectedCurrency) async {
    var url = Uri.parse(
        'https://rest.coinapi.io/v1/exchangerate/LTC/$selectedCurrency?apikey=53834A8A-4539-4885-A054-5A6E995B4431');
    double rate = await CoinData(url).getBTCtoUSD();
    setState(() {
      ltc = rate.toStringAsFixed(0);
    });
  }

  String selectedCurrency = 'AUD';
  List<Widget> picker() {
    List<Widget> currencies = [];
    for (var currency in currenciesList) {
      currencies.add(Text(
        currency,
        style: TextStyle(color: Colors.white),
      ));
    }
    return currencies;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBtc(selectedCurrency);
    getEth(selectedCurrency);
    getLtc(selectedCurrency);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Column(
              children: [
                Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 10,
                    child: Center(
                      child: Text(
                        '1 ${cryptoList[0]} = $btc $selectedCurrency',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 10,
                    child: Center(
                      child: Text(
                        '1 ${cryptoList[1]} = $eth $selectedCurrency',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 10,
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 48.0),
                    child: Center(
                      child: Text(
                        '1 ${cryptoList[2]} = $ltc $selectedCurrency',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: CupertinoPicker(
              itemExtent: 32.0,
              backgroundColor: Colors.lightBlue,
              children: picker(),
              onSelectedItemChanged: (index) {
                setState(() {
                  selectedCurrency = currenciesList[index];
                  getBtc(selectedCurrency);
                  getEth(selectedCurrency);
                  getLtc(selectedCurrency);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

// DropdownButton(
// onChanged: (value) {
// setState(() {
// selectedCurrency = value;
// });
// },
// value: selectedCurrency,
// items:
// currenciesList.map<DropdownMenuItem<String>>((String value) {
// return DropdownMenuItem<String>(
// value: value,
// child: Text(value),
// );
// }).toList(),
// ),
