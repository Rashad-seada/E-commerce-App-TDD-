import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  String text;
  Color? color;
  double size;
  FontWeight fontWeight;
  TextAlign? textAlign;
  int? maxLines;
  TextDecoration? textDecoration;
  CustomText({
    Key? key,
    required this.text,
    this.color,
    this.size = 20,
    this.fontWeight = FontWeight.w500,
    this.textAlign,
    this.maxLines,
    this.textDecoration
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
      style: GoogleFonts.lato(
          textStyle: TextStyle(
              color: color,
              fontSize: size,
              fontWeight: fontWeight,
              decoration: textDecoration,
          )),);
  }
}
