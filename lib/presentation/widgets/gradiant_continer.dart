import 'package:flutter/material.dart';

class GradiantContainer extends StatelessWidget {
  final double height;
  final double width;
  final Widget body;
  const GradiantContainer({
    required this.height,
    required this.width,
    required this.body,
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
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
      child: body,
    );
  }
}
