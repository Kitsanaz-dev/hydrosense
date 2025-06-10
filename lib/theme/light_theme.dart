import 'package:flutter/material.dart';
import 'foundation/app_theme.dart';
import 'res/palette.dart';
import 'res/typo.dart';

class LightTheme implements AppTheme {
  @override
  Brightness brightness = Brightness.light;

  @override
  AppColor color = AppColor(
    primary: Palette.lightprimary,
    background: Palette.lightbackground,
    bar: Palette.lightbar,
    stroke: Palette.lightstroke,
    block: Palette.white,
    text: Palette.black,
    subtext: Palette.grey700,
    onPrimary: Palette.lightonPrimary,
  );

  @override
  late AppTypo typo = AppTypo(
    typo: const NotoSansLao(),
    fontColor: color.text,
  );

  @override
  AppDeco deco = AppDeco(
    shadow: [
      BoxShadow(
        color: Palette.black.withAlpha(68),
        blurRadius: 35,
      ),
    ],
  );
}
