import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hydrosense/screens/settings/member_card.dart';
import 'package:hydrosense/theme/theme_service.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

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
                "About us",
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
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Team : We are under the water',
                style: context.typo.headline6.copyWith(
                  fontWeight: context.typo.semiBold,
                  color: context.color.text,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 16),

            const MemberCard(
              name: 'Phaphon Phonboulom',
              role: 'Project Manager',
              avatarAsset: 'assets/images/member/jo.jpeg',
              phoneNumber: '+856 20 29 488 989',
              facebookHandle: 'Phaphon Phonboulom',
              emailAddress: 'phaphonpbl.jo@gmail.com',
            ),

            const SizedBox(height: 16),

            const MemberCard(
              name: 'Kitsana Chanthabandith',
              role: 'Developer',
              avatarAsset: 'assets/images/member/bob.png',
              phoneNumber: '+856 20 55 325 324',
              facebookHandle: 'Kitsana Chanthabandith',
              emailAddress: 'kitsanaz.ctbd@gmail.com',
            ),

            const SizedBox(height: 16),

            const MemberCard(
              name: 'Namfone Chanthanakhone',
              role: 'Designer',
              avatarAsset: 'assets/images/member/namfone.png',
              phoneNumber: '+856 20 29 182 055',
              facebookHandle: 'Namfone Chanthanakhone',
              emailAddress: 'namfone.chan@gmail.com',
            ),

            const SizedBox(height: 16),

          ],
        ),
      ),
    );
  }
}
