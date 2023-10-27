import 'package:bitcoin_ticker/Networking.dart';
import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



String finalselectedValue = 'USD';
String finalselectedCrypto ='BTC';
double btcrates=0;
double ethrates=0;
double ltcrates=0;

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {




      void getData({required String selectedValue, required String selectedCrypto}) async{
      double dataFromNetwork =  await Networking(selectedValue: selectedValue,selectedCrypto:  selectedCrypto).getRateData() ;
      double rates = double.parse(dataFromNetwork.toStringAsFixed(2));
      setState(() {
        finalselectedValue = selectedValue;
        finalselectedCrypto = selectedCrypto;
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context) => const PriceScreen(),));
      });
      if(selectedCrypto==cryptoList[0]){
        btcrates=rates;
      }
      else if(selectedCrypto==cryptoList[1]){
        ethrates=rates;
      }
      else{
        ltcrates=rates;
      }

      }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 ${cryptoList[0]} = $btcrates $finalselectedValue',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 ${cryptoList[1]} = $ethrates $finalselectedValue',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 ${cryptoList[2]} = $ltcrates $finalselectedValue',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: DropdownButton<String>(
              dropdownColor: Colors.grey,
              borderRadius: BorderRadius.circular(10),
              iconDisabledColor: Colors.white,
              iconEnabledColor: Colors.white54,
              iconSize: 50,
              focusColor: Colors.white,
              value: finalselectedValue,
              items:
                  currenciesList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(()  {
                  finalselectedValue = value!;
                 getData(selectedValue: finalselectedValue,selectedCrypto: cryptoList[0]);
                 getData(selectedValue: finalselectedValue,selectedCrypto: cryptoList[1]);
                 getData(selectedValue: finalselectedValue,selectedCrypto: cryptoList[2]);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
