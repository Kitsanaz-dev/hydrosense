import 'package:flutter/material.dart';
import 'package:hydrosense/screens/settings/about_us_page.dart';
import 'package:hydrosense/screens/settings/profile_page.dart';
import 'package:hydrosense/screens/this_app_bar.dart';
import 'package:hydrosense/theme/theme_service.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.background,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: ThisAppBar(
          appbartitle: 'App Settings',
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 18,
        ),
        child: Column(
          //set widget to start
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              child: ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ProfilePage(),
                    ),
                  );
                },
                contentPadding: const EdgeInsets.all(0),
                leading: Icon(
                  Icons.person,
                  color: context.color.text,
                ),
                title: Text(
                  "Account",
                  style: context.typo.headline6.copyWith(
                    fontWeight: context.typo.semiBold,
                    color: context.color.text,
                  ),
                ),
              ),
            ),
            const Divider(),
            GestureDetector(
              child: ListTile(
                onTap: () {
                  print("Notifications Clicked");
                },
                contentPadding: const EdgeInsets.all(0),
                leading: Icon(
                  Icons.notifications,
                  color: context.color.text,
                ),
                title: Text(
                  "Notification",
                  style: context.typo.headline6.copyWith(
                    fontWeight: context.typo.semiBold,
                    color: context.color.text,
                  ),
                ),
              ),
            ),
            const Divider(),
            GestureDetector(
              child: ListTile(
                onTap: () {
                  print("Appearance Clicked");
                  context.read<ThemeService>().toggleTheme();
                },
                contentPadding: const EdgeInsets.all(0),
                leading: Icon(
                  Icons.dark_mode_outlined,
                  color: context.color.text,
                ),
                title: Text("Appearance",
                    style: context.typo.headline6.copyWith(
                      fontWeight: context.typo.semiBold,
                      color: context.color.text,
                    )),
              ),
            ),
            const Divider(),
            GestureDetector(
              child: ListTile(
                onTap: () {
                  print("Help & Support Clicked");
                },
                contentPadding: const EdgeInsets.all(0),
                leading: Icon(
                  Icons.help_outline_outlined,
                  color: context.color.text,
                ),
                title: Text("Help & Support",
                    style: context.typo.headline6.copyWith(
                      fontWeight: context.typo.semiBold,
                      color: context.color.text,
                    )),
              ),
            ),
            const Divider(),
            GestureDetector(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AboutUsPage(),
                    ),
                  );
                },
                contentPadding: const EdgeInsets.all(0),
                leading: Icon(
                  Icons.groups,
                  color: context.color.text,
                ),
                title: Text(
                  "About us",
                  style: context.typo.headline6.copyWith(
                    fontWeight: context.typo.semiBold,
                    color: context.color.text,
                  ),
                ),
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
