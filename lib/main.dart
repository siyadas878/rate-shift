import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rate_shift/applications/country_codes.dart/code_provider.dart';
import 'package:rate_shift/applications/dropdown_provider/dropdown_provider.dart';
import 'package:rate_shift/applications/get_rate/get_rate.dart';
import 'package:rate_shift/presentation/home_screen/home_screen.dart';
import 'package:rate_shift/presentation/srevices_screen/services_screen%20.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DropDownProvider(),
        ),
         ChangeNotifierProvider(
          create: (context) => GetRateProvider(),
        ),
         ChangeNotifierProvider(
          create: (context) => GetCodeProvider(),
        )
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark().copyWith(
            primaryColor: Colors.amberAccent,
          ),
          home: HomeScreen()),
    );
  }
}
