import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String? selectedCurrency = "USD";
  List<DropdownMenuItem> getDropDownItems() {
    List<DropdownMenuItem> dropDownItems = [];
    for (String currency in currenciesList) {
      //(int i = 0; i < currenciesList.length; i++ ) {
      //String currency = currenciesList[i];
      var newItem = DropdownMenuItem(
        value: currency,
        child: Text(currency),
      );
      dropDownItems.add(newItem);
    }
    return dropDownItems;
  }

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
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 28),
                child: Text(
                  "1 BTC = ? USD",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
          Container(
              height: 150,
              color: Colors.lightBlue,
              alignment: Alignment.center,
              child: SizedBox(
                width: 50,
                child: CupertinoPicker(
                    selectionOverlay:
                        const CupertinoPickerDefaultSelectionOverlay(
                      background: Colors.transparent,
                    ),
                    offAxisFraction: 0.5,
                    backgroundColor: Colors.lightBlue,
                    itemExtent: 50,
                    onSelectedItemChanged: (selectedIndex) {
                      print(getPickerItems()[selectedIndex]);
                    },
                    children: getPickerItems()),
              )),
        ],
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