import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rate_shift/presentation/widgets/text_style.dart';

class FromToContainer extends StatelessWidget {
  final Consumer data;
  final String fromTo;
  const FromToContainer({
    super.key,
    required this.data,
    required this.fromTo,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.1,
      width: size.width * 0.3,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.2, 0.4, 0.6, 0.8],
            colors: [
              Colors.deepOrange,
              Colors.deepOrangeAccent,
              Colors.orange,
              Colors.orangeAccent,
            ],
          ),
          boxShadow: [
            BoxShadow(
                blurRadius: 20,
                color: Colors.black,
                spreadRadius: 4,
                offset: Offset(1, 2))
          ],
          borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
               TextWidget(text: fromTo, textsize: 15),
               data
            ],),
          ),
    );
  }
}
