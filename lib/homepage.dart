import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  List? currencies;
  HomePage(this.currencies);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List? currencies;
  final List<MaterialColor> _colors = [Colors.blue, Colors.red, Colors.indigo];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cryto-currencies")),
      body: _cryptoWidget(),
    );
  }

  Widget _cryptoWidget() {
    return Container(
      child: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
                itemCount: currencies?.length,
                itemBuilder: (BuildContext context, int index) {
                  final Map currency = widget.currencies?[index];
                  final MaterialColor color =
                      _colors[index % widget.currencies!.length];
                  return _getListItem(currency, color);
                }),
          ),
        ],
      ),
    );
  }

  //listTile for having a leading icon along with a heading and a subheading
  ListTile _getListItem(Map currency, MaterialColor color) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: Text(currency['name'][0]),
      ),
      title: Text(
        currency['name'],
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: _getSubtitle(currency['quotes']['USD']['price'],
          currency['quotes']['USD']['percent_change_1h']),
      isThreeLine: true,
    );
  }

  Widget _getSubtitle(double price, double percentageChange) {
    TextSpan priceTextWidget = TextSpan(
        text: '\$$price\n', style: const TextStyle(color: Colors.black));

    TextSpan percentChangeTextWidget;

    if (percentageChange > 0 || percentageChange == 0.0) {
      percentChangeTextWidget = TextSpan(
          text: "1 hour: $percentageChange%",
          style: const TextStyle(color: Colors.green));
    } else {
      percentChangeTextWidget = TextSpan(
          text: "1 hour: $percentageChange%",
          style: const TextStyle(color: Colors.red));
    }

    return RichText(
        text: TextSpan(
      children: [priceTextWidget, percentChangeTextWidget],
    ));
  }
}
