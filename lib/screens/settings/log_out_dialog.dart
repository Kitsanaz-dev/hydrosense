import 'package:flutter/material.dart';
import 'package:hydrosense/screens/opening/opening_screen.dart';
import 'package:hydrosense/theme/component/base_dialog.dart';
import 'package:hydrosense/theme/theme_service.dart';

class LogOutDialog extends StatelessWidget {
  const LogOutDialog({
    super.key,
    required this.onLogOutPressed,
  });

  final void Function() onLogOutPressed;

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: "Log out",
      content: Text(
        "Are you sure you want to log out?",
        style: context.typo.body2.copyWith(
          fontWeight: context.typo.regular,
          color: context.color.text,
        ),
      ),
      actions: [
        //Confirm
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                context.color.primary,
              ),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => const OpeningScreen()),
                (Route<dynamic> route) => false,
              );

              onLogOutPressed();
            },
            child: Text(
              "Confirm",
              style: context.typo.body1.copyWith(
                fontWeight: context.typo.bold,
                color: context.color.onPrimary,
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        //Cancel
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  context.color.primary,
                ),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                )),
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Cancel",
              style: context.typo.body1.copyWith(
                fontWeight: context.typo.bold,
                color: context.color.text,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
