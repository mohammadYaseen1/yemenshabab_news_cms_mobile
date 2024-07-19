import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';
import 'package:yemenshabab_news_cms_mobile/gen/assets.gen.dart';
import 'package:yemenshabab_news_cms_mobile/services/auth/controllers/auth_controller.dart';
import 'package:yemenshabab_news_cms_mobile/services/auth/cubits/auth_cubit.dart';
import 'package:yemenshabab_news_cms_mobile/shared/component/outlined_button.dart';
import 'package:yemenshabab_news_cms_mobile/shared/component/text_field.dart';
import 'package:yemenshabab_news_cms_mobile/shared/style/icon_broken.dart';
import 'package:yemenshabab_news_cms_mobile/shared/style/style.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthController authController = AuthController();

  final bool withBackButton;

  LoginScreen({super.key, this.withBackButton = false});

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
      appBar: withBackButton ? AppBar(title: Text('Login')) : null,
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
              return Padding(
                padding: const EdgeInsets.all(25.0),
                child: Center(
                  child: Form(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Hero(
                            tag: "logo",
                            child: Assets.images.logo.image(width: 250),
                          ),
                          SizedBox(height: 15.0),
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
                          const SizedBox(height: 15.0),
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
                              onPressed: _doSomething,
                              borderRadius: Style.textFieldRadius,
                              color: Theme.of(context).colorScheme.primary,
                              width: 600,
                              height: 55,
                              successColor: Colors.green,
                              errorColor: Theme.of(context).colorScheme.error,
                              resetDuration: Duration(milliseconds: 100),
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
