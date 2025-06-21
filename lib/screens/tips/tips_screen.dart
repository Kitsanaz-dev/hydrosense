import 'package:flutter/material.dart';
import 'package:hydrosense/screens/this_app_bar.dart';

import 'package:hydrosense/screens/tips/tips_card.dart';
import 'package:hydrosense/theme/theme_service.dart';

class TipsScreen extends StatelessWidget {
  const TipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.background,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: ThisAppBar(
          appbartitle: 'Farming Tips',
        ),
      ),
      body: const TipsCard(),
    );
  }
}
