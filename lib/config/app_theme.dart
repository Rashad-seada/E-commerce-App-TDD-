import 'package:flutter/material.dart';

const Color DarkPrimClr = Color(0xff181a20);
const Color DarkSecClr = Color(0xff1f222a);
const Color DarkthirdClr = Color(0xff35383f);
const Color DarkDeActiveClr = Color(0xff393939);
const Color DarkactiveClr = Color(0xfffafafa);
const Color InvertedClr = Colors.white;


const Color PrimClr = Color(0xffffffff);
const Color SecClr = Color(0xfffafafa);
const Color ThirdClr = Color(0xffe7e7e7);
const Color DeActiveClr = Color(0xff393939);
const Color ActiveClr = Color(0xff101010);
const Color DarkInvertedClr = Colors.black;


class AppTheme {

  static Color primClr(context) {
    if(Theme.of(context).brightness == Brightness.light) return PrimClr;
    return DarkPrimClr;
  }

  static Color secClr(context) {
    if(Theme.of(context).brightness == Brightness.light) return SecClr;
    return DarkSecClr;
  }

  static Color thirdClr(context) {
    if(Theme.of(context).brightness == Brightness.light) return ThirdClr;
    return DarkthirdClr;
  }

  static Color activeClr(context) {
    if(Theme.of(context).brightness == Brightness.light) return ActiveClr;
    return DarkactiveClr;
  }

  static Color deActiveClr(context) {
    if(Theme.of(context).brightness == Brightness.light) return DeActiveClr;
    return DarkDeActiveClr;
  }

  static Color checkBoxClr(context) {
    if(Theme.of(context).brightness == Brightness.light) return DarkInvertedClr;
    return InvertedClr;
  }

  static Color invertedClr(context) {
    if(Theme.of(context).brightness == Brightness.light) return InvertedClr;
    return DarkInvertedClr;
  }
}

