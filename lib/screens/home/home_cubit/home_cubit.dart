import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/helper/dio_helper.dart';
import 'package:shop_app/helper/end_points.dart';
import 'package:shop_app/models/cart_model.dart';
import 'package:shop_app/models/categories_model.dart';
import 'package:shop_app/models/favorites_model.dart';
import 'package:shop_app/models/home_model.dart';
import 'package:shop_app/models/product_details_model.dart';
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
    const ProductScreen(),
    const CategoriesScreen(),
    const FavoritesScreen(),
    const SettingsScreen()
  ];
  void changeBottomNav(int index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }

  Map<int, bool> favourites = {};
  Map<int, bool> cart = {};
  void getHomeData() {
    emit(HomeLoadingState());
    DioHelper.getData(url: homeData, lang: 'en', token: AppConstants.token)
        .then((value) async {
      homeModel = HomeModel.fromJson(value.data);
      for (var element in homeModel!.data!.products!) {
        favourites.addAll({
          element.id!: element.inFavorites!,
        });
        for (var element in homeModel!.data!.products!) {
          cart.addAll({
            element.id!: element.inCart!,
          });
        }
      }

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

  changeFavorites(int? productId) {
    print(favourites[productId].toString());

    favourites[productId!] = !favourites[productId]!;
    emit(ChangeFavoritesState());
    DioHelper.postData(
        url: addFavorite,
        lang: 'en',
        token: AppConstants.token,
        data: {'product_id': productId}).then((value) {
      changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
      if (!changeFavoritesModel!.status!) {
        favourites[productId] = !favourites[productId]!;
      } else {
        getFavorites();
      }
      emit(SuccessChangeFavoritesState(changeFavoritesModel!));
    }).catchError((error) {
      favourites[productId] = !favourites[productId]!;
      print(error.toString());
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
      emit(SuccessGetFavoritesState());
    }).catchError((error) {
      print(error.toString());
      emit(ErorrGetFavoritesState(error.toString()));
    });
  }

  // get product data
  ProductDetails? productDetails;

  getProductData(int productId) {
    emit(GetProductDataLoadingState());

    DioHelper.getData(
      url: getProducts,
      lang: 'en',
      token: AppConstants.token,
    ).then((value) {
      productDetails = ProductDetails.fromJson(value.data);
      print(productDetails!.data.name);
      emit(SuccessGetProductDataState(productDetails!));
    }).catchError((error) {
      print(error.toString());
      emit(ErorrGetProductDataState(error.toString()));
    });
  }

  // change cart
  ChangeCartModel? changeCartModel;

  changeCart(int? productId) {
    print(cart[productId].toString());

    cart[productId!] = !cart[productId]!;
    emit(ChangeCartState());
    DioHelper.postData(
        url: addToCart,
        lang: 'en',
        token: AppConstants.token,
        data: {'product_id': productId}).then((value) {
      changeCartModel = ChangeCartModel.fromJson(value.data);
      if (!changeCartModel!.status!) {
        cart[productId] = !cart[productId]!;
      } else {
        getCart();
      }
      emit(SuccessChangeCartState(changeCartModel!));
    }).catchError((error) {
      cart[productId] = !cart[productId]!;
      print(error.toString());
      emit(ErorrChangeCartState(error.toString()));
    });
  }

  // get Favaorites
  CartModel? cartModel;
  void getCart() {
    emit(GetCartLoadingState());
    DioHelper.getData(url: addToCart, lang: 'en', token: AppConstants.token)
        .then((value) {
      cartModel = CartModel.fromJson(value.data);
      emit(SuccessGetCartState());
    }).catchError((error) {
      print(error.toString());
      emit(ErorrGetCartState(error.toString()));
    });
  }
}
