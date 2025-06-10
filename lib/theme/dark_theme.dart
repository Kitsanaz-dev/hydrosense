import 'package:flutter/material.dart';
import 'foundation/app_theme.dart';
import 'res/palette.dart';
import 'res/typo.dart';

class DarkTheme implements AppTheme {
  @override
  Brightness brightness = Brightness.dark;

  @override
  AppColor color = AppColor(
    primary: Palette.darkprimary,
    background: Palette.darkbackground,
    bar: Palette.darkbar,
    stroke: Palette.darkstroke,
    block: Palette.black,
    text: Palette.white,
    subtext: Palette.grey500,
    onPrimary: Palette.darkonPrimary,
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
