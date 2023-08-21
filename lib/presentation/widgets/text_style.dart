import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final double textsize;
  final Color? color;
  const TextWidget({this.color,required this.text, required this.textsize, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        color: color,
        fontSize: textsize,
        fontFamily: GoogleFonts.aBeeZee.toString(),
        fontWeight: FontWeight.bold
      ),
    );
  }
}
