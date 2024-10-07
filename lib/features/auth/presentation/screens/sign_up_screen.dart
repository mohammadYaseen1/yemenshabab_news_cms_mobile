import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:toastification/toastification.dart';
import 'package:yemenshabab/core/constants/app_colors.dart';
import 'package:yemenshabab/core/constants/app_defaults.dart';
import 'package:yemenshabab/core/routes/app_routes.dart';
import 'package:yemenshabab/features/auth/presentation/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:yemenshabab/features/auth/presentation/widgets/sign_widget.dart';
import 'package:yemenshabab/shared/component/custom_button.dart';
import 'package:yemenshabab/shared/component/custom_form_filed.dart';
import 'package:yemenshabab/shared/component/custom_loading.dart';
import 'package:yemenshabab/shared/component/toast.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  IconData getPasswordIcon(SignUpState state) {
    return state is PasswordHiddenState
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
  }

  IconData getConfirmPasswordIcon(SignUpState state) {
    return state is ConfirmPasswordHiddenState
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController fullNameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();

    return BlocConsumer<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccessState) {
          Navigator.of(context).popAndPushNamed(AppRoutes.base);

          // Get.toNamed(
          //   AppRoutes.otp,
          //   arguments: {
          //     'phoneNumber': '$countryCode${emailController.text}',
          //     'fullName': fullNameController.text,
          //     'gender': gender,
          //     'password': passwordController.text,
          //     'age': age,
          //   },
          // );
        } else if (state is SignUpErrorState) {
          toast(
            title: AppLocalizations.of(context)!.register,
            context: context,
            description: AppLocalizations.of(context)!.userIsExist,
            toastType: ToastificationType.error,
          );
        }
      },
      builder: (context, state) {
        return SignWidget(
          title: 'Sign Up',
          withAppBar: true,
          body: Form(
            key: formKey,
            child: Center(
              child: Scrollbar(
                thumbVisibility: true,
                thickness: 2.0,
                child: ListView(
                  padding: const EdgeInsets.only(
                    top: AppDefaults.defaultTopPadding * 1.2,
                    right: AppDefaults.defaultMaxRightRadius,
                    left: AppDefaults.defaultMaxLeftRadius,
                    bottom: AppDefaults.defaultBottomPadding,
                  ),
                  children: [
                    CustomFormFiled(
                      validator: (fullName) {
                        if (fullName == null || fullName.isEmpty) {
                          return AppLocalizations.of(context)!.nameIsRequired;
                        }
                        return null;
                      },
                      controller: fullNameController,
                      cursorColor: Theme.of(context).colorScheme.primary,
                      keyboardType: TextInputType.visiblePassword,
                      isPassword: false,
                      enabled: true,
                      readOnly: false,
                      autofocus: false,
                      borderColors: AppColors.appBorderColor,
                      focusBorderColor: AppColors.appBorderColor,
                      borderWidth: 1,
                      prefixIcon: Icon(
                        Icons.person,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      textColor: Theme.of(context).colorScheme.primary,
                      filled: false,
                      label: AppLocalizations.of(context)!.username,
                      onChange: (value) {},
                      hintStyle: Theme.of(context).textTheme.labelMedium!,
                      labelStyle: Theme.of(context).textTheme.labelMedium!,
                      borderRadius: BorderRadius.circular(
                        AppDefaults.defaultRightRadius,
                      ),
                      pressablePrefix: false,
                    ),
                    const SizedBox(
                      height: AppDefaults.defaultVerticalSpaceBetweenWidget,
                    ),
                    CustomFormFiled(
                      validator: (phone) {
                        if (phone == null || phone.isEmpty) {
                          return AppLocalizations.of(context)!.emailIsRequired;
                        }
                        return null;
                      },
                      controller: emailController,
                      cursorColor: Theme.of(context).colorScheme.primary,
                      keyboardType: TextInputType.phone,
                      isPassword: false,
                      enabled: true,
                      readOnly: false,
                      autofocus: false,
                      borderColors: AppColors.appBorderColor,
                      focusBorderColor: AppColors.appBorderColor,
                      borderWidth: 1,
                      prefixIcon: Icon(
                        Icons.email_rounded,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      textColor: Theme.of(context).colorScheme.primary,
                      filled: false,
                      label: AppLocalizations.of(context)!.email,
                      hintStyle: Theme.of(context).textTheme.labelMedium!,
                      labelStyle: Theme.of(context).textTheme.labelMedium!,
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
                        } else if (password != confirmPasswordController.text) {
                          return AppLocalizations.of(context)!.notMatchPassword;
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
                              .read<SignUpBloc>()
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
                      focusBorderColor: AppColors.appBorderColor,
                      borderWidth: 1,
                      minLines: 1,
                      maxLines: 1,
                      textColor: Theme.of(context).colorScheme.primary,
                      filled: false,
                      label: AppLocalizations.of(context)!.password,
                      hintStyle: Theme.of(context).textTheme.labelMedium!,
                      labelStyle: Theme.of(context).textTheme.labelMedium!,
                      borderRadius: BorderRadius.circular(
                        AppDefaults.defaultRightRadius,
                      ),
                      pressablePrefix: false,
                    ),
                    const SizedBox(
                      height: AppDefaults.defaultVerticalSpaceBetweenWidget,
                    ),
                    CustomFormFiled(
                      controller: confirmPasswordController,
                      validator: (cPassword) {
                        if (cPassword == null || cPassword.isEmpty) {
                          return AppLocalizations.of(context)!
                              .confirmPasswordIsRequired;
                        } else if (cPassword != passwordController.text) {
                          return AppLocalizations.of(context)!.notMatchPassword;
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
                              .read<SignUpBloc>()
                              .add(ToggleConfirmPasswordVisibilityEvent());
                        },
                        icon: Icon(
                          getConfirmPasswordIcon(state),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      isPassword: state is ConfirmPasswordHiddenState,
                      enabled: true,
                      readOnly: false,
                      autofocus: false,
                      borderColors: AppColors.appBorderColor,
                      focusBorderColor: AppColors.appBorderColor,
                      borderWidth: 1,
                      minLines: 1,
                      maxLines: 1,
                      textColor: Theme.of(context).colorScheme.primary,
                      filled: false,
                      label: AppLocalizations.of(context)!.confirmPassword,
                      hintStyle: Theme.of(context).textTheme.labelMedium!,
                      labelStyle: Theme.of(context).textTheme.labelMedium!,
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
                      child: state is SignUpLoadingState
                          ? const CustomLoading()
                          : CustomButton(
                              onTap: () async {
                                if (formKey.currentState!.validate()) {
                                  context.read<SignUpBloc>().add(
                                        SignUpSubmitEvent(
                                          uuid: "",
                                          name: fullNameController.text,
                                          password: passwordController.text,
                                          email: emailController.text,
                                        ),
                                      );
                                }
                              },
                              text: AppLocalizations.of(context)!.register,
                              textColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              background: Theme.of(context).colorScheme.primary,
                              height: 47,
                              radius: 10,
                            ),
                    ),
                    const SizedBox(
                      height: AppDefaults.defaultVerticalSpaceBetweenWidget,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.haveAccount,
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
                            Navigator.of(context)
                                .pushReplacementNamed(AppRoutes.signIn);
                          },
                          child: Text(
                            AppLocalizations.of(context)!.login,
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
