import 'package:flutter/material.dart';
import 'package:hydrosense/screens/opening/opening_screen.dart';
import 'package:hydrosense/services/sensor_service.dart';
import 'package:hydrosense/theme/theme_service.dart';
import 'package:provider/provider.dart';

void main() async { // Optionally pass FirebaseOptions if needed
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeService(),
        ),
        ChangeNotifierProvider(
          create: (context) => SensorService(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OpeningScreen(),
    );
  }
}
