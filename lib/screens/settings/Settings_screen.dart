import 'package:flutter/material.dart';
import 'package:shop_app/shared/components/function.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: TextButton(
      onPressed: () {
        logOut(context);
      },
      child: const Text('Logout'),
    ));
  }
}
