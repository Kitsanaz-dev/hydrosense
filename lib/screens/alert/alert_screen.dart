import 'package:flutter/material.dart';
import 'package:hydrosense/screens/this_app_bar.dart';

class AlertScreen extends StatelessWidget {
  AlertScreen({super.key});

  // Mock alerts
  final List<Map<String, String>> alerts = [
    {
      'title': "Mina’s Farm",
      'description':
          "pH is slightly acidic.",
      'time': "2025-03-31 09:21:59"
    },
    {
      'title': "Mina’s Farm",
      'description':
          "Water is murky.",
      'time': "2025-03-31 09:21:59"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: ThisAppBar(
          appbartitle: 'Alert & Warnings',
        ),
      ),
      body: ListView.builder(
        itemCount: alerts.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 3,
            child: ListTile(
              leading: const Icon(
                Icons.warning_amber_outlined,
                color: Colors.red,
                size: 48,
              ),
              title: Text(
                alerts[index]['title']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Text(
                alerts[index]['description']!,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    alerts[index]['time']!,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black38,
                    ),
                  ),
                ],
              ),
              contentPadding: const EdgeInsets.all(12),
            ),
          );
        },
      ),
    );
  }
}
