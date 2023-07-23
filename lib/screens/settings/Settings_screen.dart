import 'package:flutter/material.dart';
import 'package:shop_app/shared/components/function.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

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
