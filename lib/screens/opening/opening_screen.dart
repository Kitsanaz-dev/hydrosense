import 'package:flutter/material.dart';
import 'package:hydrosense/screens/navbar.dart';
import 'package:hydrosense/theme/theme_service.dart';

class OpeningScreen extends StatelessWidget {
  const OpeningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the next screen when tapped
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Navbar(),
          ),
        );
      },
      child: Scaffold(
        body: Stack(
          children: [
            // Background color
            Container(
              color: context.color.primary, // Light blue color
            ),
            // Centered content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // App Logo
                  Image.asset(
                    'assets/images/intro/icon.png', // Replace with your logo image
                    width: 450, // Adjust logo size
                    height: 450,
                  ),
                ],
              ),
            ),
            // Footer text
            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'Tap everywhere to continue',
                  style: context.typo.subtitle1.copyWith(
                    fontWeight: context.typo.regular,
                    color: context.color.onPrimary,
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
