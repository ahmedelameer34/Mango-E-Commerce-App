import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/screens/home/home_cubit/home_cubit.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/login/login_screen.dart';
import 'package:shop_app/screens/onboarding_screen/onboarding_screen.dart';
import 'package:shop_app/shared/style/themes.dart';

import 'helper/cashe_helper.dart';
import 'helper/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  await CacheHelper.init();
  bool onBoarding = CacheHelper.getData(key: 'onBoarding') ?? false;
  String? token = CacheHelper.getData(key: 'token');
  Widget startWidget = OnBoarding();
  if (onBoarding) {
    if (token != null) {
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
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: MaterialApp(
        theme: dark,
        debugShowCheckedModeBanner: false,
        home: startWidget,
      ),
    );
  }
}
