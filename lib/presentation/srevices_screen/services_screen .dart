import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rate_shift/applications/dropdown_provider/dropdown_provider.dart';
import 'package:rate_shift/presentation/widgets/text_style.dart';
import '../../applications/get_rate/get_rate.dart';
import '../widgets/dropdown_widget.dart';
import '../widgets/fromto_container.dart';
import '../widgets/gradiant_continer.dart';

class ServiceScreen extends StatelessWidget {
  ServiceScreen({Key? key}) : super(key: key);

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const TextWidget(
            text: 'Converter', textsize: 20, color: Colors.amber),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FromToContainer(
                      size: size,
                      fromTo: 'FROM',
                      data: Consumer<DropDownProvider>(
                        builder: (context, toDropDownProvider, child) {
                          return DropDown(
                            onSelectionChanged:
                                toDropDownProvider.dropDownSelectionFrom,
                            initialValue: toDropDownProvider.toCode,
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.1,
                    ),
                    FromToContainer(
                      size: size,
                      fromTo: 'TO',
                      data: Consumer<DropDownProvider>(
                        builder: (context, fromDropDownProvider, child) {
                          return DropDown(
                            onSelectionChanged:
                                fromDropDownProvider.dropDownSelectionTo,
                            initialValue: fromDropDownProvider.fromCode,
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                GradiantContainer(
                  size: size,
                  body: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: size.width * 0.3,
                          height: size.height * 0.06,
                          child: TextField(
                            controller: controller,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Amount',
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.orangeAccent)),
                          onPressed: () async {
                            final dropDownProvider =
                                context.read<DropDownProvider>();
                            final getRateProvider =
                                context.read<GetRateProvider>();
          
                            // Fetch data from API
                            await getRateProvider.fetchData(
                              dropDownProvider.fromCode,
                              dropDownProvider.toCode,
                              controller.text,
                            );
                          },
                          child: const Text('Submit'),
                        )
                      ],
                    ),
                  ),
                  height: size.height * 0.1,
                  width: size.width * 0.7,
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                const Divider(color: Colors.orangeAccent),
                SizedBox(
                  height: size.height * 0.03,
                ),
                GradiantContainer(
                  height: size.height * 0.2,
                  width: size.width * 0.7,
                  body: Consumer<GetRateProvider>(
                    builder: (context, getRateProvider, child) {
                      final apiData = getRateProvider.apiData;
                      if (apiData == null) {
                        DateTime dateTime =
                            DateTime.now();
                        String currentdate =DateFormat('yyyy-MM-dd').format(dateTime);
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               TextWidget(
                                  text: currentdate, textsize: 17),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  TextWidget(text: 'FROM', textsize: 17),
                                  Icon(FontAwesomeIcons.arrowRight),
                                  TextWidget(text: 'TO', textsize: 17),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              const TextWidget(text: 'RESULT', textsize: 20),
                            ],
                          ),
                        );
                      } else {
                        return Consumer<DropDownProvider>(
                          builder: (context, value, child) {
                            String from = value.fromCode;
                            String to = value.toCode;
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextWidget(
                                      text: 'DATE: ${apiData['date']}',
                                      textsize: 17),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      TextWidget(text: to, textsize: 17),
                                      const Icon(FontAwesomeIcons.arrowRight),
                                      TextWidget(text: from, textsize: 17),
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  TextWidget(
                                      text: '$from  ${apiData['result']}',
                                      textsize: 20),
                                ],
                              ),
                            );
                          },
                          // child:
                        );
                      }
                    },
                  ),
                  size: size,
                ),
                SizedBox(
                  height: size.height * 0.07,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
