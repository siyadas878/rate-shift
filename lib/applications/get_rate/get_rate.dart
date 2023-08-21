import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetRateProvider extends ChangeNotifier {
  Map<String, dynamic>? apiData;
  Future<void> fetchData(String toCode, String fromCode, String amount) async {
    String apiUrl = 'https://api.apilayer.com/exchangerates_data/convert?to=$toCode&from=$fromCode&amount=$amount';
    String token = '8F7oYe8Q7ydXDTLp12zqe58HZgKq25tI';
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {'apikey': token},
    );
    try {
      if (response.statusCode == 200) {
        apiData = json.decode(response.body);
        notifyListeners();
    } else {
      throw Exception('Failed to load data');
    }
    } catch (e) {
      print('error----------$e');
    }
  }
}
