import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hydrosense/screens/tips/tip_detail_screen.dart';
import 'package:hydrosense/src/service/theme_service.dart';

class TipsCard extends StatefulWidget {
  const TipsCard({super.key});

  @override
  State<TipsCard> createState() => _TipsCardState();
}

class _TipsCardState extends State<TipsCard> {
  late Future<List<Map<String, String>>> tipsFuture;

  @override
  void initState() {
    super.initState();
    tipsFuture = fetchTips();
  }

  Future<List<Map<String, String>>> fetchTips() async {
    final String jsonString =
        await rootBundle.loadString('assets/data/tips.json');
    final List<dynamic> jsonResponse = json.decode(jsonString);
    // Convert each item to Map<String, String>
    return jsonResponse.map((item) => Map<String, String>.from(item)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, String>>>(
        future: tipsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final tips = snapshot.data!;
            return ListView.builder(
              itemCount: tips.length,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemBuilder: (context, index) {
                final title = tips[index]['title'] ?? '';
                final imagePath = tips[index]['image'] ?? '';
                final content = tips[index]['content'] ?? '';

                // Create a short snippet from the content
                const snippetLength = 90; // Adjust snippet length as desired
                final snippet = content.length > snippetLength
                    ? '${content.substring(0, snippetLength)}...'
                    : content;

                return Card(
                  color: context.color.background,
                  margin: const EdgeInsets.only(
                    top: 12,
                    bottom: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(
                      color: context.color.stroke,
                      width: 2,
                    ),
                  ),
                  elevation: 3,
                  child: InkWell(
                    // Tapping the whole card navigates to detail screen
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TipDetailScreen(
                            title: title,
                            image: imagePath,
                            content: content,
                          ),
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header Image
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                          child: Image.asset(
                            imagePath,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 180,
                            errorBuilder: (context, error, stackTrace) {
                              // Fallback if the image fails to load
                              return Container(
                                color: Colors.grey.shade200,
                                height: 180,
                                alignment: Alignment.center,
                                child: const Text(
                                  'Image not found',
                                ),
                              );
                            },
                          ),
                        ),

                        // Title + Snippet + "Read More"
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Title
                              Text(
                                title,
                                style: context.typo.subtitle1.copyWith(
                                  fontWeight: context.typo.bold,
                                  color: context.color.text,
                                ),
                              ),
                              const SizedBox(height: 8),

                              // Short snippet of content
                              Text(
                                snippet,
                                style: context.typo.body2.copyWith(
                                  fontWeight: context.typo.regular,
                                  color: context.color.subtext,
                                ),
                              ),
                              const SizedBox(height: 8),

                              // "Read More" link in red
                              Text(
                                'Read More',
                                style: context.typo.body1.copyWith(
                                  fontWeight: context.typo.semiBold,
                                  color: context.color.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      );
  }
}