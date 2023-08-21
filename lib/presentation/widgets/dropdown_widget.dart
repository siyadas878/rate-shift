import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rate_shift/applications/dropdown_provider/dropdown_provider.dart';
import '../../constats/conts.dart';

class DropDown extends StatelessWidget {
  final void Function(String) onSelectionChanged;
  final String initialValue;

  const DropDown({
    Key? key,
    required this.onSelectionChanged,
    required this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DropDownProvider>(
      builder: (context, value, child) {
        return DropdownButton<String>(
          icon:const Icon(FontAwesomeIcons.circleArrowDown),
          value: initialValue,
          onChanged: (newValue) {
            onSelectionChanged(newValue!);
          },
          items: currencyCodes.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        );
      },
    );
  }
}
