import 'dart:ui';

import 'package:flutter/material.dart';

Color getTurbidityColor(double turbidity) {
  if (turbidity < 5) {
    return const Color(0xFF16C60C);
  } else if (turbidity >= 5 && turbidity < 10) {
    return const Color(0xFFF7630C);
  } else if (turbidity >= 10) {
    return const Color(0xFFE81224);
  } return const Color(0xFFEEEEEE);
}
