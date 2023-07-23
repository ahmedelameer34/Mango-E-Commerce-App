import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/helper/cashe_helper.dart';
import 'package:shop_app/screens/home/home_screen.dart';

import 'package:shop_app/screens/login/login_cubit/login_cubit.dart';

import 'package:shop_app/screens/register/register_screen.dart';
import 'package:shop_app/shared/components/materials.dart';
import 'package:shop_app/shared/style/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/components/function.dart';
import 'login_cubit/states.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return BlocConsumer<LoginCubit, ShopLoginStates>(
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/image/login.png',
                        width: 350, height: 250),
                    const Text(
                      'Welcome back ,',
                      style: TextStyle(color: mainColor, fontSize: 25),
                    ),
                    const Text(
                      'Login to continue',
                      style: TextStyle(color: mainColor, fontSize: 25),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    defTextFormField(
                        controller: emailController,
                        textType: TextInputType.emailAddress,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                        label: 'Email',
                        prefix: Icons.email_outlined),
                    defTextFormField(
                      onPressedsuffix: () {
                        LoginCubit.get(context).seePassword();
                      },
                      controller: passwordController,
                      isPassword: LoginCubit.get(context).seePasword,
                      textType: TextInputType.visiblePassword,
                      onSubmit: (value) {
                        if (formKey.currentState!.validate()) {
                          LoginCubit.get(context).userLogin(
                              email: emailController.text,
                              password: passwordController.text);
                        }
                      },
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      label: 'Password',
                      prefix: Icons.lock_outline,
                      suffix: LoginCubit.get(context).suffix,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ConditionalBuilder(
                            condition: state is! LoginLoadingState,
                            fallback: (context) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                            builder: (context) {
                              return defaultButton(
                                  onPressed: (() {
                                    if (formKey.currentState!.validate()) {
                                      LoginCubit.get(context).userLogin(
                                          email: emailController.text,
                                          password: passwordController.text);
                                    }
                                  }),
                                  text: 'LOG IN',
                                  color: Colors.white);
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        registerAsk(
                            context: context,
                            color: mainColor,
                            widget: RegisterScreen()), //wait for build
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is LoginSuccessState) {
          //navigateAndFinish(context, const HomeScreen());
          if (state.loginModel.status) {
            CacheHelper.saveData(
                    key: 'token', value: state.loginModel.data!.token)
                .then((value) {
              return navigateAndFinish(context, HomeScreen());
            });
            print(state.loginModel.message);
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.loginModel.message)));
          } else {
            print(state.loginModel.message);
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.loginModel.message)));
          }
        }
      },
    );
  }
}
