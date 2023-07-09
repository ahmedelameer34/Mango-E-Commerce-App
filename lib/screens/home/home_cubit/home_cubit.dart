import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/helper/dio_helper.dart';
import 'package:shop_app/helper/end_points.dart';
import 'package:shop_app/models/categories_model.dart';
import 'package:shop_app/models/favorites_model.dart';
import 'package:shop_app/models/home_model.dart';
import 'package:shop_app/screens/categories/categories_screen.dart';
import 'package:shop_app/screens/favorites/favorites_screen.dart';
import 'package:shop_app/screens/products/products_screen.dart';
import 'package:shop_app/screens/settings/Settings_screen.dart';

import '../../../models/change_favorites.dart';
import '../../../shared/components/constants.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(InitialState());

  static HomeCubit get(context) => BlocProvider.of(context);
  HomeModel? homeModel;
  int currentIndex = 0;
  List<Widget> bottomScreens = [
    ProductScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingsScreen()
  ];
  void changeBottomNav(int index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }

  Map<int, bool> favorites = {};
  void getHomeData() {
    emit(HomeLoadingState());
    DioHelper.getData(url: homeData, lang: 'en', token: AppConstants.token)
        .then((value) {
      homeModel = HomeModel.fromJson(value.data);
      homeModel!.data!.products.forEach((element) {
        favorites.addAll({element.id: element.inFavorites});
      });

      emit(SuccessGetHomeState());
    }).catchError((error) {
      emit(ErorrGetHomeState(error.toString()));
    });
  }

  // get category
  CategoriesModel? categoriesModel;
  void getCategroy() {
    emit(GetCategroyLoadingState());
    DioHelper.getData(url: getCategories, lang: 'en').then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      emit(SuccessGetCategroyeState());
    }).catchError((error) {
      emit(ErorrGetCategroyState(error.toString()));
    });
  }

  // change favorites
  ChangeFavoritesModel? changeFavoritesModel;

  changeFavorites(int productId) {
    favorites[productId] = !favorites[productId]!;
    emit(ChangeFavoritesState());
    DioHelper.postData(
        url: addFavorite,
        lang: 'en',
        token: AppConstants.token,
        data: {'product_id': productId}).then((value) {
      changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
      if (!changeFavoritesModel!.status!) {
        favorites[productId] = !favorites[productId]!;
      } else {
        getFavorites();
      }
      emit(SuccessChangeFavoritesState(changeFavoritesModel!));
    }).catchError((error) {
      favorites[productId] = !favorites[productId]!;

      emit(ErorrChangeFavoritesState(error.toString()));
    });
  }

  // get Favaorites
  FavoritesModel? favoritesModel;
  void getFavorites() {
    emit(GetFavoritesLoadingState());
    DioHelper.getData(url: addFavorite, lang: 'en', token: AppConstants.token)
        .then((value) {
      favoritesModel = FavoritesModel.fromJson(value.data);
      emit(SuccessGetFavoriteseState());
    }).catchError((error) {
      print(error.toString());
      emit(ErorrGetFavoritesState(error.toString()));
    });
  }
}
