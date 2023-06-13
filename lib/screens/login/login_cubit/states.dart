import 'package:shop_app/models/login_model.dart';

abstract class ShopLoginStates {}

class IntialState extends ShopLoginStates {}

class LoginLoadingState extends ShopLoginStates {}

class LoginSuccessState extends ShopLoginStates {
  final LoginModel loginModel;
  LoginSuccessState(this.loginModel);
}

class LoginErrorState extends ShopLoginStates {
  final String error;
  LoginErrorState(this.error);
}

class SeePasswordState extends ShopLoginStates {}
