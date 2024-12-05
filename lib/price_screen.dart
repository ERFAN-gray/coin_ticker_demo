import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String pickedCurreny = "IRT";
  CoinData coinData = CoinData();
  @override
  void initState() {
    super.initState();
    getData();
  }

  Map<String, String> coinvalues = {};
  bool isWaiting = false;

  void getData() async {
    isWaiting = true;
    try {
      var data = await coinData.getCoinData(pickedCurreny);
      isWaiting = false;
      setState(() {
        coinvalues = data;
      });
    } catch (error) {
      // ignore: avoid_print
      print(error);
    }
  }

  // String? selectedCurrency = "USD";
  // List<DropdownMenuItem> getDropDownItems() {
  //   List<DropdownMenuItem> dropDownItems = [];
  //   for (String currency in currenciesList) {
  //     //(int i = 0; i < currenciesList.length; i++ ) {
  //     //String currency = currenciesList[i];
  //     var newItem = DropdownMenuItem(
  //       value: currency,
  //       child: Text(currency),
  //     );
  //     dropDownItems.add(newItem);
  //   }
  //   return dropDownItems;
  // }

  List<Widget> getPickerItems() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }
    return pickerItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text(
          "Coin Ticker",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: false,
      ),
      // ignore: prefer_const_constructors
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CryptoCard(
                    crypto: "BTC",
                    value: isWaiting ? "?" : coinvalues["BTC"]!,
                    selectedCurrency: pickedCurreny),
                CryptoCard(
                    crypto: "ETH",
                    value: isWaiting ? "?" : coinvalues["ETH"]!,
                    selectedCurrency: pickedCurreny),
                CryptoCard(
                    crypto: "LTC",
                    value: isWaiting ? "?" : coinvalues["LTC"]!,
                    selectedCurrency: pickedCurreny),
              ]),
          Container(
              height: 130,
              color: Colors.lightBlue,
              alignment: Alignment.center,
              child: SizedBox(
                width: 52,
                child: CupertinoPicker(
                    selectionOverlay:
                        const CupertinoPickerDefaultSelectionOverlay(
                      background: Colors.transparent,
                    ),
                    offAxisFraction: 0.5,
                    backgroundColor: Colors.lightBlue,
                    itemExtent: 50,
                    onSelectedItemChanged: (selectedIndex) {
                      setState(() {
                        pickedCurreny = currenciesList[selectedIndex];
                        getData();
                      });
                    },
                    children: getPickerItems()),
              )),
        ],
      ),
    );
  }
}

class CryptoCard extends StatelessWidget {
  const CryptoCard(
      {super.key,
      required this.crypto,
      required this.value,
      required this.selectedCurrency});

  final String crypto;
  final String value;
  final String selectedCurrency;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 28),
          child: Text(
            "1 $crypto = $value $selectedCurrency",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

// DropdownButton(
//                 value: selectedCurrency,
//                 items: getDropDownItems(),
//                 onChanged: (value) {
//                   setState(() {
//                     selectedCurrency = value;
//                     print(value);
//                   });
//                 }),


// CupertinoPicker(
//                   backgroundColor: Colors.lightBlue,
//                   itemExtent: 40,
//                   onSelectedItemChanged: (selectedIndex) {
//                     print(selectedIndex);
//                   },
//                   children: getDropDownItems())),