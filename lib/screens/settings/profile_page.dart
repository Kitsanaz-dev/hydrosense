import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hydrosense/screens/settings/log_out_dialog.dart';
import 'package:hydrosense/theme/theme_service.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
                "Profile",
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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 32,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header Row
            Row(
              children: [
                // Profile Avatar
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.purple[100],
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.purple[700],
                  ),
                ),
                const SizedBox(width: 16),

                // User Information
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Phonesavanh Sounaken",
                      style: context.typo.subtitle1.copyWith(
                        fontWeight: context.typo.bold,
                        color: context.color.text,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "+856 20 55555555",
                      style: context.typo.subtitle2.copyWith(
                        fontWeight: context.typo.regular,
                        color: context.color.text,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 4),

            // Logout Button
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 327,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    print("Logout Clicked");
                    showDialog(
                      context: context,
                      builder: (context) {
                        return LogOutDialog(
                          onLogOutPressed: () {},
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: context.color.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                  child: Text(
                    "Log Out",
                    style: context.typo.headline6.copyWith(
                      fontWeight: context.typo.bold,
                      color: context.color.onPrimary,
                    ),
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
