import 'package:flutter/material.dart';

import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/login/login_screen.dart';
import 'package:shop_app/screens/onboarding_screen/onboarding_screen.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/style/themes.dart';

import 'helper/cashe_helper.dart';
import 'helper/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  await CacheHelper.init();
  bool onBoarding = CacheHelper.getData(key: 'onBoarding') ?? false;

  Widget startWidget = OnBoarding();
  if (onBoarding) {
    if (AppConstants.token != null) {
      startWidget = HomeScreen();
    } else {
      startWidget = LoginScreen();
    }
  }
  runApp(MyApp(startWidget));
}

class MyApp extends StatelessWidget {
  Widget startWidget;
  MyApp(this.startWidget, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: light,
      debugShowCheckedModeBanner: false,
      home: startWidget,
    );
  }
}
