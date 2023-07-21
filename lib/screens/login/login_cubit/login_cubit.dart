import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/helper/dio_helper.dart';
import 'package:shop_app/helper/end_points.dart';
import 'package:shop_app/models/login_model.dart';
import 'package:shop_app/screens/login/login_cubit/states.dart';

class LoginCubit extends Cubit<ShopLoginStates> {
  LoginCubit() : super(IntialState());
  static LoginCubit get(context) => BlocProvider.of(context);
  LoginModel? loginModel;
  //user Login
  void userLogin({required String email, required String password}) {
    emit(LoginLoadingState());

    DioHelper.postData(
            data: {'email': email, 'password': password},
            url: login,
            lang: 'en')
        .then((value) {
      loginModel = LoginModel.fromJson(value.data);

      emit(LoginSuccessState(loginModel!));
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }

  // See password icon
  IconData suffix = Icons.visibility_outlined;
  bool seePasword = true;
  void seePassword() {
    seePasword = !seePasword;
    suffix =
        seePasword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(SeePasswordState());
  }
}
