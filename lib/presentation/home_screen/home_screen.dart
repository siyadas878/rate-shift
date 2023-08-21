import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rate_shift/applications/country_codes.dart/code_provider.dart';
import 'package:rate_shift/presentation/country_codes/country_codes.dart';
import 'package:rate_shift/presentation/srevices_screen/services_screen%20.dart';
import 'package:rate_shift/presentation/widgets/gradiant_continer.dart';

import '../widgets/text_style.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const TextWidget(
            text: 'Rate-Shift', textsize: 20, color: Colors.amber),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: size.height * 0.2,
                width: size.width * 0.4,
                child: Image.asset(
                  'assets/pngwing.com (3).png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ServiceScreen(),
                      ));
                },
                child: GradiantContainer(
                    height: size.height * 0.07,
                    width: size.width * 0.6,
                    body: const Center(
                        child: TextWidget(
                            text: 'Rate Converter',
                            textsize: 20,
                            color: Colors.yellowAccent)),
                    size: size),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              InkWell(
                 onTap: () {
                  Provider.of<GetCodeProvider>(context,listen: false).fetchData();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CountryCodes(),
                      ));
                   
                },
                child: 
                GradiantContainer(
                    height: size.height * 0.07,
                    width: size.width * 0.6,
                    body: const Center(
                        child: TextWidget(
                            text: 'Country Codes',
                            textsize: 20,
                            color: Colors.yellowAccent)),
                    size: size),
              )
            ],
          ),
        ),
      ),
    );
  }
}
