import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';
import 'package:yemenshabab/gen/assets.gen.dart';
import 'package:yemenshabab/layout/app_layout.dart';
import 'package:yemenshabab/services/auth/controllers/auth_controller.dart';
import 'package:yemenshabab/services/auth/cubits/auth_cubit.dart';
import 'package:yemenshabab/shared/component/outlined_button.dart';
import 'package:yemenshabab/shared/component/text_field.dart';
import 'package:yemenshabab/shared/style/icon_broken.dart';
import 'package:yemenshabab/shared/style/style.dart';
import 'package:yemenshabab/shared/utils.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthController authController = AuthController();

  final bool withBackButton;

  RegisterScreen({super.key, this.withBackButton = false});

  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  void _doSomething() async {
    Timer(Duration(seconds: 3), () {
      _btnController.error();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (_) => authController.authCubit,
        child: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthLoaded) {
              Navigator.pushReplacementNamed(context, '/');
            } else if (state is AuthError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              var width = (MediaQuery.of(context).size.width - 60.0) / 2.0;
              return Padding(
                padding: const EdgeInsets.all(25.0),
                child: Center(
                  child: Form(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Assets.images.logo.image(width: 150),
                          SizedBox(height: 15.0),
                          Text(
                            AppLocalizations.of(context)!.createAccount,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 15.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: width,
                                child: DefaultFormField(
                                  controller: firstNameController,
                                  label: AppLocalizations.of(context)!.username,
                                  labelStyle: TextStyle(color: Colors.grey),
                                  focusBorderColor: Colors.grey,
                                  keyboardType: TextInputType.text,
                                  prefixIcon: IconBroken.Profile,
                                  validator: (String? value) => value!.isEmpty
                                      ? AppLocalizations.of(context)!
                                          .usernameErrorMessage
                                      : null,
                                  radius: Style.textFieldRadius,
                                ),
                              ),
                              SizedBox(width: 10),
                              SizedBox(
                                width: width,
                                child: DefaultFormField(
                                  controller: usernameController,
                                  label: AppLocalizations.of(context)!.username,
                                  labelStyle: TextStyle(color: Colors.grey),
                                  focusBorderColor: Colors.grey,
                                  keyboardType: TextInputType.text,
                                  prefixIcon: IconBroken.Profile,
                                  validator: (String? value) => value!.isEmpty
                                      ? AppLocalizations.of(context)!
                                          .usernameErrorMessage
                                      : null,
                                  radius: Style.textFieldRadius,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          DefaultFormField(
                            controller: usernameController,
                            label: AppLocalizations.of(context)!.username,
                            labelStyle: TextStyle(color: Colors.grey),
                            focusBorderColor: Colors.grey,
                            keyboardType: TextInputType.text,
                            prefixIcon: IconBroken.Profile,
                            validator: (String? value) => value!.isEmpty
                                ? AppLocalizations.of(context)!
                                    .usernameErrorMessage
                                : null,
                            radius: Style.textFieldRadius,
                          ),
                          const SizedBox(height: 10.0),
                          DefaultFormField(
                            controller: usernameController,
                            label: AppLocalizations.of(context)!.username,
                            labelStyle: TextStyle(color: Colors.grey),
                            focusBorderColor: Colors.grey,
                            keyboardType: TextInputType.text,
                            prefixIcon: IconBroken.Profile,
                            validator: (String? value) => value!.isEmpty
                                ? AppLocalizations.of(context)!
                                    .usernameErrorMessage
                                : null,
                            radius: Style.textFieldRadius,
                          ),
                          const SizedBox(height: 10.0),
                          DefaultFormField(
                            controller: usernameController,
                            label: AppLocalizations.of(context)!.username,
                            labelStyle: TextStyle(color: Colors.grey),
                            focusBorderColor: Colors.grey,
                            keyboardType: TextInputType.text,
                            prefixIcon: IconBroken.Profile,
                            validator: (String? value) => value!.isEmpty
                                ? AppLocalizations.of(context)!
                                    .usernameErrorMessage
                                : null,
                            radius: Style.textFieldRadius,
                          ),
                          const SizedBox(height: 10.0),
                          DefaultFormField(
                            controller: usernameController,
                            label: AppLocalizations.of(context)!.username,
                            labelStyle: TextStyle(color: Colors.grey),
                            focusBorderColor: Colors.grey,
                            keyboardType: TextInputType.text,
                            prefixIcon: IconBroken.Profile,
                            validator: (String? value) => value!.isEmpty
                                ? AppLocalizations.of(context)!
                                    .usernameErrorMessage
                                : null,
                            radius: Style.textFieldRadius,
                          ),
                          const SizedBox(height: 10.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              DefaultFormField(
                                controller: passwordController,
                                label: AppLocalizations.of(context)!.password,
                                isPassword: true,
                                keyboardType: TextInputType.visiblePassword,
                                prefixIcon: IconBroken.Lock,
                                labelStyle: TextStyle(color: Colors.grey),
                                focusBorderColor: Colors.grey,
                                validator: (String? value) => value!.isEmpty
                                    ? AppLocalizations.of(context)!
                                        .passwordErrorMessage
                                    : null,
                                radius: Style.textFieldRadius,
                              ),
                              TextButton(
                                style: const ButtonStyle(
                                    alignment: AlignmentDirectional.centerEnd),
                                onPressed: () {},
                                child: Text(
                                  AppLocalizations.of(context)!.forgotPassword,
                                  style: TextStyle(
                                    color: Colors.black38,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20.0),
                          Container(
                            child: RoundedLoadingButton(
                              child: Text(AppLocalizations.of(context)!.login,
                                  style: TextStyle(color: Colors.white)),
                              controller: _btnController,
                              onPressed: () {
                                _btnController.success();
                                Navigator.of(context).push(
                                createRoute(
                                  () =>
                                      AppLayout(),
                                ),
                              );
                              },
                              borderRadius: Style.textFieldRadius,
                              color: Theme.of(context).colorScheme.primary,
                              width: 600,
                              height: 55,
                              successColor: Colors.green,
                              errorColor: Theme.of(context).colorScheme.error,
                            ),
                          ),
                          const SizedBox(height: 15.0),
                          DefaultOutlinedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed("/register");
                            },
                            width: 600,
                            radius: Style.textFieldRadius,
                            height: 55,
                            borderSide: BorderSide(
                                width: 1,
                                color: Theme.of(context).colorScheme.primary),
                            child: Text(
                              AppLocalizations.of(context)!.createAccount,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
