import 'dart:ui';

import 'package:flutter/material.dart';

Color getPHColor(double pH) {
  if (pH < 6.0) {
    return const Color(0xFFE81224); // For pH 0-5.9
  } else if (pH >= 6.0 && pH < 6.9) {
    return const Color(0xFFF7630C); // For pH 6.0-6.9
  } else if ((pH - 6.9).abs() < 0.3) { // Considering floating point precision
    return const Color(0xFF16C60C); // For pH exactly 7.0
  } else if (pH > 7.2 && pH <= 8.0) {
    return const Color(0xFFF7630C); // For pH 7.1-8.0
  } else if (pH > 8.0) {
    return const Color(0xFFEE81224); // For pH 8.1-14
  }
  return const Color(0xFFEEEEEE); // Fallback color
}
