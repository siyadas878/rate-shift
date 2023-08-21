import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rate_shift/applications/country_codes.dart/code_provider.dart';
import 'package:rate_shift/presentation/widgets/gradiant_continer.dart';

class CountryCodes extends StatelessWidget {
  const CountryCodes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Consumer<GetCodeProvider>(
          builder: (context, getRateProvider, child) {
            if (getRateProvider.isloading) {
              return Center(child: CircularProgressIndicator());
            }

            if (getRateProvider.codes == null ||
                getRateProvider.codes!.isEmpty) {
              return Center(child: Text("No data available"));
            }

            return ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: size.height * 0.02,),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: getRateProvider.codes!.length,
              itemBuilder: (context, index) {
                final List<String> codeKeys =
                    getRateProvider.codes!.keys.toList();
                final String code = codeKeys[index];
                final String? name = getRateProvider.codes![code];

                return GradiantContainer(
                  height: size.height * 0.08,
                  width: size.width * 0.7,
                  body: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Center(
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          child: Text(code),
                        ),
                        title: Text(name.toString()),
                      ),
                    ),
                  ),
                  size: size,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
