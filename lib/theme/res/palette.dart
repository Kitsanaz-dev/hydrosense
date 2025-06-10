import 'package:flutter/material.dart';

abstract class Palette {

  //lightmode
  static Color lightprimary = const Color(0xFF52B9ED);
  static Color lightbackground = const Color(0xFFFFFFFF);
  static Color lightbar = const Color(0xFFE5E5E5);
  static Color lightstroke = const Color(0xFFBBE3F7);
  static Color lightonPrimary = const Color(0xFFD9F0FF);

  //darkmode
  static Color darkprimary = const Color(0xFF52B9ED);
  static Color darkbackground = const Color(0xFF121212);
  static Color darkbar = const Color(0xFFE5E5E5);
  static Color darkstroke = const Color(0xFF3A3A3A);
  static Color darkonPrimary = const Color(0xFF0D0D0D);

  //achromatic
  static Color grey500 = const Color(0xFF9E9E9E);
  static Color grey700 = const Color(0xFFBDBDBD);
  static Color white = const Color(0xFFFFFFFF);
  static Color black = const Color(0xFF000000);
}