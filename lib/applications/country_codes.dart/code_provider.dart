import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetCodeProvider extends ChangeNotifier {
  bool isloading=false;
  Map<String, dynamic>? apiData;
  Map<String, dynamic>? codes;
  Future<void> fetchData() async {
    isloading=true;
  String apiUrl = 'https://api.apilayer.com/exchangerates_data/symbols';
  String token = '8F7oYe8Q7ydXDTLp12zqe58HZgKq25tI';
  final response = await http.get(
    Uri.parse(apiUrl),
    headers: {'apikey': token},
  );
  try {
    if (response.statusCode == 200) {
      apiData = json.decode(response.body);
      codes = Map<String, dynamic>.from(apiData?['symbols']);
      notifyListeners();
      
      await Duration(seconds: 3);
      isloading=false;
      notifyListeners();
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    print('error----------$e');
  }
}
}