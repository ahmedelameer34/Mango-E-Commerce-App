import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';
import 'package:shop_app/screens/home/home_cubit/home_cubit.dart';
import 'package:shop_app/screens/home/home_cubit/home_states.dart';
import 'package:shop_app/shared/components/function.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()
        ..getHomeData()
        ..getCategroy()
        ..getFavorites(),
      child: BlocConsumer<HomeCubit, HomeStates>(
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
            bottomNavigationBar: BottomNavigationBar(
                onTap: (index) {
                  cubit.changeBottomNav(index);
                },
                currentIndex: cubit.currentIndex,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.category), label: 'Categories'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite), label: 'Favorites'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: 'Settings'),
                ]),
          );
        },
      ),
    );
  }
}
