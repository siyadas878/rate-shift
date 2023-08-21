import 'package:flutter/material.dart';
import 'package:rate_shift/constats/conts.dart';

class DropDownProvider extends ChangeNotifier {
  String toCode = currencyCodes.first;
  String fromCode = currencyCodes.first;

  void dropDownSelectionTo(String value) {
    fromCode = value;
    notifyListeners();
  }

  void dropDownSelectionFrom(String value) {
    toCode = value;
    notifyListeners();
  }
}
