import 'package:flutter/material.dart';
import 'package:hydrosense/theme/theme_service.dart';
import 'package:url_launcher/link.dart';

Uri _exampleUri = Uri.parse(
  'https://drive.google.com/file/d/1KGaav1-OAJ_kSrr34ogyk7aWGVKHxjkd/view?usp=drive_link',
);

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.color.background,
      margin: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 16,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: context.color.stroke,
          width: 2, // optional stroke
        ),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Link(
              uri: _exampleUri,
              builder: (context, followLink) => TextButton(
                onPressed: followLink,
                child: Text(
                  'Visit history of $name',
                  style: context.typo.body1.copyWith(
                    fontWeight: context.typo.regular,
                    color: context.color.text,
                    letterSpacing: 0.4,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
