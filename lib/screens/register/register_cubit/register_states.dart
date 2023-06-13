import '../../../models/register_model.dart';

abstract class ShopRegisterStates {}

class IntialState extends ShopRegisterStates {}

class RegisterLoadingState extends ShopRegisterStates {}

class RegisterSuccessState extends ShopRegisterStates {
  final RegisterModel registerModel;
  RegisterSuccessState(this.registerModel);
}

class RegisterErrorState extends ShopRegisterStates {
  final String error;
  RegisterErrorState(this.error);
}

class SeePasswordState extends ShopRegisterStates {}
