import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/register_model.dart';
import 'package:shop_app/screens/register/register_cubit/register_states.dart';
import '../../../helper/end_points.dart';

class RegisterCubit extends Cubit<ShopRegisterStates> {
  RegisterCubit() : super(IntialState());
  static RegisterCubit get(context) => BlocProvider.of(context);
  RegisterModel? registerModel;

  //new register
  void userRegister(
      {required String email,
      required String password,
      required String name,
      required String phone}) {
    emit(RegisterLoadingState());
    Dio dio = Dio();

    dio.options.baseUrl = 'https://student.valuxapps.com/api/';

    dio.post(register, queryParameters: {
      'email': email,
      'password': password,
      'name': name,
      'phone': phone
    }).then((value) {
      registerModel = RegisterModel.fromJson(value.data);
      print(value.data);
      emit(RegisterSuccessState(registerModel!));
    }).catchError((error) {
      emit(RegisterErrorState(error.toString()));
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
