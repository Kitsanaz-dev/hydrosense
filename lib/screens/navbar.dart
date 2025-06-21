import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hydrosense/screens/dashboard/dashboard_screen.dart';
import 'package:hydrosense/screens/settings/settings_screen.dart';
import 'package:hydrosense/screens/tips/tips_screen.dart';
import 'package:hydrosense/services/sensor_service.dart';
import 'package:hydrosense/theme/theme_service.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: const [
          DashboardScreen(),
          TipsScreen(),
          SettingsScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 23, 122, 235)
                  .withAlpha(68), // Shadow color
              spreadRadius: 2, // How much the shadow spreads
              blurRadius: 8, // How blurred the shadow is
              offset: const Offset(
                  0, -3), // Offset in x, y; negative y moves shadow upward
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          ),
          child: SizedBox(
            height: 100,
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (newIndex) {
                setState(() {
                  currentIndex = newIndex;
                  if (newIndex == 0) {
                    SensorService().fetchSensorData();
                  }
                });
              },
              selectedItemColor: context.color.block,
              unselectedItemColor: context.color.onPrimary,
              selectedLabelStyle: context.typo.body1.copyWith(
                color: context.color.block,
                fontWeight: context.typo.bold,
                letterSpacing: 0.25,
              ),
              unselectedLabelStyle: context.typo.body2.copyWith(
                color: context.color.onPrimary,
                fontWeight: context.typo.regular,
              ),

              showSelectedLabels: true,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              backgroundColor: context.color.primary,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/dashboard.svg',
                    width: 24,
                    height: 24,
                  ),
                  label: "Dashboard",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/tips.svg',
                    width: 24,
                    height: 24,
                  ),
                  label: "Tips",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/settings.svg',
                    width: 24,
                    height: 24,
                  ),
                  label: "Settings",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
