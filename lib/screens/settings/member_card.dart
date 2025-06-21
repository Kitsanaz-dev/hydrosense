import 'package:flutter/material.dart';
import 'package:hydrosense/theme/theme_service.dart';

class MemberCard extends StatelessWidget {
  final String name;
  final String role;
  final String avatarAsset;
  final String phoneNumber;
  final String facebookHandle;
  final String emailAddress;

  const MemberCard({
    super.key,
    required this.name,
    required this.role,
    required this.avatarAsset,
    required this.phoneNumber,
    required this.facebookHandle,
    required this.emailAddress,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.color.background,
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: context.color.stroke,
          width: 2, // optional stroke
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Avatar
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(avatarAsset),
            ),
            const SizedBox(width: 16),

            // Info column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name
                  Text(
                    name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  // Role
                  Text(
                    role,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),

                  const SizedBox(height: 20),

                  // Contact icons + labels
                  Row(
                    children: [
                      Icon(
                        Icons.phone,
                        size: 16,
                        color: context.color.primary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        phoneNumber,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),

                  const SizedBox(height: 4),

                  Row(
                    children: [
                      Icon(
                        Icons.facebook_outlined,
                        size: 16,
                        color: context.color.primary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        facebookHandle,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  Row(
                    children: [
                      Icon(
                        Icons.mail_outline,
                        size: 16,
                        color: context.color.primary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        emailAddress,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
