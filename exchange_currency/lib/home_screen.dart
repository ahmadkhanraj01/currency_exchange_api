
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'exchange_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String inputCurrency = 'aUD';
  String ? countryName ;
  double amount = 1;
  ExchangeModule? exchangeRate;


  String convertName(String sym) {
    switch (sym.toLowerCase()) {
      case 'aud':
        return 'Australia';
      case 'brl':
        return 'Brazil';
      case 'cad':
        return 'Canada';
      case 'cny':
        return 'China';
      case 'eur':
        return 'Eurozone';
      case 'gbp':
        return 'United Kingdom';
      case 'hkd':
        return 'Hong Kong';
      case 'idr':
        return 'Indonesia';
      case 'inr':
        return 'India';
      case 'ils':
        return 'Israel';
      case 'jpy':
        return 'Japan';
      case 'mxn':
        return 'Mexico';
      case 'nok':
        return 'Norway';
      case 'nzd':
        return 'New Zealand';
      case 'pkr':
        return 'Pakistan';
      case 'pln':
        return 'Poland';
      case 'ron':
        return 'Romania';
      case 'rub':
        return 'Russia';
      case 'sar':
        return 'Saudi Arabia';
      case 'sek':
        return 'Sweden';
      case 'sgd':
        return 'Singapore';
      case 'usd':
        return 'United States';
      case 'zar':
        return 'South Africa';
      default:
        return 'Unknown'; // Fallback for unrecognized symbols
    }
  }


  CupertinoPicker pickerIn() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }
    return CupertinoPicker(
      backgroundColor: Colors.transparent,
      itemExtent: 32,
      onSelectedItemChanged: (selectedIndex) {
        inputCurrency = currenciesList[selectedIndex];
        print(selectedIndex);
      },
      children: pickerItems,
    );
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UpdateUI();
    countryName = convertName(inputCurrency);
  }
  void UpdateUI() async {
    if (inputCurrency.isNotEmpty) {
      ExchangeModule? data = await ExchangeApi().getData(inputCurrency);
      setState(() {
        exchangeRate = data;
        countryName = convertName(inputCurrency);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Exchange'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color(0xFF2E2C56),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  pickerIn(),
                  Text(countryName ?? 'wait'),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    onChanged: ((value) {
                      if (value.isNotEmpty) {
                        try {
                          amount = double.parse(value);
                        } catch (e) {
                          print('Error parsing amount: $e');
                        }
                      } else {
                        amount = 0.0;
                      }
                    }),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
            SizedBox(height: 10),

            IconButton(
              icon: Icon(Icons.swap_vert, color: Colors.white),
              onPressed: () {},
            ),
            SizedBox(height: 10),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color(0xFF2E2C56),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'PKR',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Text(
                        '${amount * (exchangeRate?.conversionRates?.pKR ?? 0)}',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    (exchangeRate?.conversionRates?.pKR?.toString() ?? 'wait'),
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),

            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: () {
                UpdateUI();
                print(amount);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.sync_alt),
                  SizedBox(width: 8),
                  Text('Convert'),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
