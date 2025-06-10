import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hydrosense/src/service/theme_service.dart';

class TipDetailScreen extends StatelessWidget {
  final String title;
  final String image;
  final String content;

  const TipDetailScreen({
    super.key,
    required this.title,
    required this.image,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Container(
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
              leading: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  CupertinoIcons.chevron_back,
                  color: context.color.onPrimary,
                ),
              ),
              title: Text(
                "Farming Tips",
                style: context.typo.headline4.copyWith(
                  fontWeight: context.typo.extraBold,
                  color: context.color.onPrimary,
                ),
              ),
              backgroundColor: context.color.primary,
              elevation: 0,
              toolbarHeight: 100,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24,
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(image),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                content,
                style: context.typo.subtitle2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
