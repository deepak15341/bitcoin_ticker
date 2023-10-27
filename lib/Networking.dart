import 'dart:convert';

import 'package:http/http.dart' as http;

class Networking{
  String selectedValue;
  String selectedCrypto;
  Networking( {required this.selectedValue,required this.selectedCrypto,});
  Future<double> getRateData() async{
    late http.Response response;
    response = await http.get(Uri.parse('https://rest.coinapi.io/v1/exchangerate/$selectedCrypto/$selectedValue/apikey-E7A21E91-47EA-4C28-A94B-14A534E96C52')) ;
    if(response.statusCode==200){
      var decodeData = response.body;
      double rates = jsonDecode(decodeData)['rate'];
      return rates;
    }
    else{
      return (response.statusCode).toDouble();
    }

  }

}