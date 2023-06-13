import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/screens/login/login_screen.dart';
import 'package:shop_app/screens/register/register_cubit/register_cubit.dart';
import 'package:shop_app/screens/register/register_cubit/register_states.dart';

import '../../shared/components/materials.dart';
import '../../shared/style/colors.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, ShopRegisterStates>(
        listener: (context, state) {},
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
                      Text(
                        'Register now',
                        style: TextStyle(color: mainColor, fontSize: 25),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      defTextFormField(
                          controller: nameController,
                          textType: TextInputType.text,
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                          label: 'Name',
                          prefix: Icons.person_2_outlined),
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
                          controller: phoneController,
                          textType: TextInputType.phone,
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            return null;
                          },
                          label: 'Phone number',
                          prefix: Icons.phone),
                      defTextFormField(
                        onPressedsuffix: () {
                          RegisterCubit.get(context).seePassword();
                        },
                        controller: passwordController,
                        isPassword: RegisterCubit.get(context).seePasword,
                        textType: TextInputType.visiblePassword,
                        onSubmit: (value) {
                          if (formKey.currentState!.validate()) {
                            RegisterCubit.get(context).userRegister(
                                phone: phoneController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                name: nameController.text);
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
                        suffix: RegisterCubit.get(context).suffix,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          defaultButton(
                              onPressed: (() {
                                if (formKey.currentState!.validate()) {
                                  RegisterCubit.get(context).userRegister(
                                      phone: phoneController.text,
                                      email: emailController.text,
                                      password: passwordController.text,
                                      name: nameController.text);
                                }
                              }),
                              text: 'REGISTER',
                              color: Colors.white),
                          SizedBox(
                            height: 20,
                          ),
                          loginAsk(
                              context: context,
                              color: mainColor,
                              widget: LoginScreen()), //wait for build
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
