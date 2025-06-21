import 'package:flutter/material.dart';
import 'package:hydrosense/theme/theme_service.dart';

class ThisAppBar extends StatelessWidget {
  final String appbartitle;
  const ThisAppBar({
    super.key,
    required this.appbartitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 23, 122, 235).withAlpha(68),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        child: AppBar(
          title: Text(
            appbartitle,
            style: context.typo.headline4.copyWith(
              fontWeight: context.typo.extraBold,
              color: context.color.onPrimary,
            ),
          ),
          centerTitle: true,
          backgroundColor: context.color.primary,
          elevation: 0,
          toolbarHeight: 100,
        ),
      ),
    );
  }
}
