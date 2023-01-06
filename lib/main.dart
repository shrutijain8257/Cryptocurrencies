import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:crypto_flutter/homepage.dart';
import 'package:flutter/material.dart';

void main() async {
  List? currencies = await getCurrencies();
  print(currencies);
  runApp(MyApp(currencies));
}

class MyApp extends StatelessWidget {
  final List _currencies;
  const MyApp(this._currencies);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal),
      home: HomePage(_currencies),
    );
  }
}

Future<List> getCurrencies() async {
  //String cryptourl = "https://api.coinpaprika.com/v1/tickers";
   String cryptourl = "https://api.wazirx.com/sapi/v1/tickers/24hr";

  http.Response response = await http.get(Uri.parse(cryptourl));
  return jsonDecode(response.body);
}
