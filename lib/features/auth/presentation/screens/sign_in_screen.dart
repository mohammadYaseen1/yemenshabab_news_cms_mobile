import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:toastification/toastification.dart';
import 'package:yemenshabab/core/constants/app_colors.dart';
import 'package:yemenshabab/core/constants/app_defaults.dart';
import 'package:yemenshabab/core/constants/app_images.dart';
import 'package:yemenshabab/core/constants/app_sizes.dart';
import 'package:yemenshabab/core/routes/app_routes.dart';
import 'package:yemenshabab/features/auth/presentation/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:yemenshabab/features/auth/presentation/widgets/sign_widget.dart';
import 'package:yemenshabab/shared/component/custom_button.dart';
import 'package:yemenshabab/shared/component/custom_form_filed.dart';
import 'package:yemenshabab/shared/component/custom_loading.dart';
import 'package:yemenshabab/shared/component/toast.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    IconData getPasswordIcon(SignInState state) {
      return state is PasswordHiddenState
          ? Icons.visibility_outlined
          : Icons.visibility_off_outlined;
    }

    return BlocConsumer<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccessState) {
          Navigator.of(context).popAndPushNamed(AppRoutes.base);
        } else if (state is SignInErrorState) {
          toast(
            title: AppLocalizations.of(context)!.login,
            context: context,
            description: AppLocalizations.of(context)!.incorrectEmailOrPassword,
            toastType: ToastificationType.error,
          );
        } else if(state is SignOutState) {
        }
      },
      builder: (context, state) {
        return SignWidget(
          withAppBar: true,
          title: "",
          body: Form(
            key: formKey,
            child: Center(
              child: Scrollbar(
                thumbVisibility: true,
                thickness: 2.0,
                child: ListView(
                  padding: const EdgeInsets.only(
                    top: AppDefaults.defaultTopPadding * 4,
                    right: AppDefaults.defaultMaxRightRadius,
                    left: AppDefaults.defaultMaxLeftRadius,
                    bottom: AppDefaults.defaultBottomPadding,
                  ),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          width: AppSizeConfig.screenWidth * 0.45,
                          fit: BoxFit.cover,
                          image: const AssetImage(
                            AppImages.appLogo,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height:
                          AppDefaults.defaultVerticalSpaceBetweenBigWidget * 2,
                    ),
                    CustomFormFiled(
                      validator: (email) {
                        if (email == null || email.isEmpty) {
                          return AppLocalizations.of(context)!.emailIsRequired;
                        }
                        return null;
                      },
                      controller: emailController,
                      cursorColor: Theme.of(context).colorScheme.primary,
                      keyboardType: TextInputType.emailAddress,
                      isPassword: false,
                      enabled: true,
                      readOnly: false,
                      autofocus: false,
                      borderColors: AppColors.appBorderColor,
                      focusBorderColor: Theme.of(context).colorScheme.primary,
                      borderWidth: 1,
                      prefixIcon: Icon(
                        Icons.email_rounded,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      textColor: Theme.of(context).colorScheme.primary,
                      filled: false,
                      label: AppLocalizations.of(context)!.email,
                      hintStyle:
                          Theme.of(context).textTheme.labelMedium!.copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                      labelStyle:
                      Theme.of(context).textTheme.labelMedium!.copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                      borderRadius: BorderRadius.circular(
                        AppDefaults.defaultRightRadius,
                      ),
                      pressablePrefix: false,
                    ),
                    const SizedBox(
                      height: AppDefaults.defaultVerticalSpaceBetweenWidget,
                    ),
                    CustomFormFiled(
                      controller: passwordController,
                      validator: (password) {
                        if (password == null || password.isEmpty) {
                          return AppLocalizations.of(context)!
                              .passwordIsRequired;
                        }
                        return null;
                      },
                      cursorColor: Theme.of(context).colorScheme.primary,
                      keyboardType: TextInputType.visiblePassword,
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          context
                              .read<SignInBloc>()
                              .add(TogglePasswordVisibilityEvent());
                        },
                        icon: Icon(
                          getPasswordIcon(state),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      isPassword: state is PasswordHiddenState,
                      enabled: true,
                      readOnly: false,
                      autofocus: false,
                      borderColors: AppColors.appBorderColor,
                      focusBorderColor: Theme.of(context).colorScheme.primary,
                      borderWidth: 1,
                      minLines: 1,
                      maxLines: 1,
                      textColor: Theme.of(context).colorScheme.primary,
                      filled: false,
                      label: AppLocalizations.of(context)!.password,
                      hintStyle: Theme.of(context).textTheme.labelMedium!,
                      labelStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.secondary
                      ),
                      borderRadius: BorderRadius.circular(
                        AppDefaults.defaultRightRadius,
                      ),
                      pressablePrefix: false,
                    ),
                    const SizedBox(
                      height: AppDefaults.defaultVerticalSpaceBetweenBigWidget,
                    ),
                    AnimatedSwitcher(
                        duration: const Duration(
                          milliseconds: 100,
                        ),
                        child: state is SignInLoadingState
                            ? const CustomLoading()
                            : CustomButton(
                                onTap: () {
                                  // Get.offAllNamed(AppRoutes.main);
                                  if (formKey.currentState!.validate()) {
                                    context.read<SignInBloc>().add(
                                        SignInSubmitEvent(
                                            email: emailController.text,
                                            password: passwordController.text));
                                  }
                                },
                                text: AppLocalizations.of(context)!.login,
                                textColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                                background: Theme.of(context).colorScheme.primary,
                                height: 47,
                                radius: 10,
                              )),
                    const SizedBox(
                      height: AppDefaults.defaultVerticalSpaceBetweenWidget,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.dontHaveAccount,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 12,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(
                          width: AppDefaults
                              .defaultHorizontalSpaceBetweenSmallWidget,
                        ),
                        InkWell(
                          onTap: () {
                            // Navigator.of(context).push(createRoute(() => SignUpScreen(),));
                            Navigator.of(context)
                                .pushReplacementNamed(AppRoutes.signUp);
                            // Get.toNamed(AppRoutes.signUp);
                          },
                          child: Text(
                            AppLocalizations.of(context)!.registerNow,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 12,
                                  color: Theme.of(context).colorScheme.primary,
                                  decoration: TextDecoration.underline,
                                  decorationColor:
                                      Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
