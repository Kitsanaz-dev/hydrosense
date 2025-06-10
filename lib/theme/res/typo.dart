import 'package:flutter/material.dart';

abstract class Typo {
  const Typo({
    required this.name,
    required this.light,
    required this.regular,
    required this.semiBold,
    required this.bold,
    required this.extraBold,
  });

  final String name;
  final FontWeight light;
  final FontWeight regular;
  final FontWeight semiBold;
  final FontWeight bold;
  final FontWeight extraBold;
}

class NotoSansLao implements Typo {
  const NotoSansLao();

  @override
  final String name = 'noto_sans_lao';

  @override
  final FontWeight light = FontWeight.w300;

  @override
  final FontWeight regular = FontWeight.w400;

  @override
  final FontWeight semiBold = FontWeight.w600;

  @override
  final FontWeight bold = FontWeight.w700;

  @override
  final FontWeight extraBold = FontWeight.w800;
}