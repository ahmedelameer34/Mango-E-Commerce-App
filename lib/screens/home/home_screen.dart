import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';
import 'package:shop_app/screens/home/home_cubit/home_cubit.dart';
import 'package:shop_app/screens/home/home_cubit/home_states.dart';
import 'package:shop_app/shared/components/function.dart';

import '../../shared/style/colors.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          key: formKey,
          appBar: AppBar(
            title: Image.asset(
              'assets/image/75x.png',
              scale: 3.2,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    navigateTo(context, CartScreen());
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                ),
              )
            ],
          ),
          body: cubit.bottomScreens[cubit.currentIndex],
          bottomNavigationBar: CurvedNavigationBar(
              color: mainColor,
              animationDuration: const Duration(milliseconds: 700),
              buttonBackgroundColor: mainColor,
              backgroundColor: Colors.white.withOpacity(0),
              animationCurve: Curves.easeInOutBack,
              onTap: (index) {
                cubit.changeBottomNav(index);
              },
              index: cubit.currentIndex,
              items: const [
                Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                Icon(Icons.category, color: Colors.white),
                Icon(Icons.favorite, color: Colors.white),
                Icon(Icons.menu_rounded, color: Colors.white),
              ]),
        );
      },
    );
  }
}
