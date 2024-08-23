import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:yemenshabab/core/constants/app_colors.dart';
import 'package:yemenshabab/core/constants/app_defaults.dart';
import 'package:yemenshabab/core/constants/app_sizes.dart';
import 'package:yemenshabab/features/auth/presentation/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:yemenshabab/shared/component/custom_button.dart';
import 'package:yemenshabab/shared/component/custom_form_filed.dart';
import 'package:yemenshabab/shared/component/custom_loading.dart';
import 'package:yemenshabab/shared/component/custom_snack_bar.dart';

import '../widgets/sign_widget.dart';

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
    String countryCode = '+962';

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    final TextEditingController fullNameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();

    return BlocConsumer<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is PhoneAuthSuccessState) {
          // Get.toNamed(
          //   AppRoutes.otp,
          //   arguments: {
          //     'phoneNumber': '$countryCode${phoneController.text}',
          //     'fullName': fullNameController.text,
          //     'gender': gender,
          //     'password': passwordController.text,
          //     'age': age,
          //   },
          // );
        } else if (state is PhoneAuthErrorState) {
          CustomSnackBar.error(
              title: 'Sign Up'.tr, message: state.errorMessage);
        } else if (state is CountryCodeSelectedState) {
          countryCode = state.countryCode;
        }
      },
      builder: (context, state) {
        return SignWidget(
          title: 'Sign Up'.tr,
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
                          return 'Full name is required'.tr;
                        }
                        return null;
                      },
                      controller: fullNameController,
                      cursorColor: Theme.of(context).primaryColor,
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
                        color: Theme.of(context).primaryColor,
                      ),
                      textColor: Theme.of(context).primaryColor,
                      filled: false,
                      label: 'Full Name'.tr,
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
                          return 'Phone Required'.tr;
                        }
                        return null;
                      },
                      controller: phoneController,
                      cursorColor: Theme.of(context).primaryColor,
                      keyboardType: TextInputType.phone,
                      isPassword: false,
                      enabled: true,
                      readOnly: false,
                      autofocus: false,
                      borderColors: AppColors.appBorderColor,
                      focusBorderColor: AppColors.appBorderColor,
                      borderWidth: 1,
                      prefixIcon: InkWell(
                        onTap: () {
                          showCountryPicker(
                            context: context,
                            // countryFilter: context
                            //     .read<SignUpBloc>()
                            //     .appRepository
                            //     .countries!
                            //     .countries,
                            showPhoneCode: true,
                            onSelect: (Country country) {
                              context.read<SignUpBloc>().add(
                                  SelectCountryCodeEvent(
                                      '+${country.phoneCode}'));
                            },
                            showSearch: true,
                            countryListTheme: CountryListThemeData(
                              bottomSheetHeight:
                                  AppSizeConfig.screenHeight * 0.4,
                              borderRadius: BorderRadius.circular(
                                  AppDefaults.defaultLeftRadius),
                              inputDecoration: InputDecoration(
                                labelText: 'Search'.tr,
                                hintText: 'Start typing to search'.tr,
                                prefixIcon: const Icon(Icons.search),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: AppDefaults
                                      .defaultHorizontalSpaceBetweenWidget,
                                  vertical: AppDefaults
                                      .defaultVerticalSpaceBetweenWidget,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: const Color(0xFF8C98A8)
                                        .withOpacity(0.2),
                                  ),
                                ),
                              ),
                              searchTextStyle:
                                  Theme.of(context).textTheme.bodyMedium,
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              flagSize: 25.0,
                            ),
                            useSafeArea: true,
                          );
                        },
                        child: SizedBox(
                          width: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.arrow_drop_down,
                                size: 20,
                                color: Theme.of(context).primaryColor,
                              ),
                              const SizedBox(
                                width: AppDefaults
                                        .defaultHorizontalSpaceBetweenSmallWidget -
                                    3,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: state is CountryCodeSelectedState
                                      ? state.countryCode
                                      : countryCode,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      textColor: Theme.of(context).primaryColor,
                      filled: false,
                      label: 'Phone Number'.tr,
                      hintStyle: Theme.of(context).textTheme.labelMedium!,
                      labelStyle: Theme.of(context).textTheme.labelMedium!,
                      borderRadius: BorderRadius.circular(
                        AppDefaults.defaultRightRadius,
                      ),
                      maxLength: 10,
                      pressablePrefix: false,
                    ),
                    const SizedBox(
                      height: AppDefaults.defaultVerticalSpaceBetweenWidget,
                    ),
                    CustomFormFiled(
                      controller: passwordController,
                      validator: (password) {
                        if (password == null || password.isEmpty) {
                          return 'Password Required'.tr;
                        } else if (password != confirmPasswordController.text) {
                          return 'Password and confirm password does not matches'
                              .tr;
                        }
                        return null;
                      },
                      cursorColor: Theme.of(context).primaryColor,
                      keyboardType: TextInputType.visiblePassword,
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Theme.of(context).primaryColor,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          context
                              .read<SignUpBloc>()
                              .add(TogglePasswordVisibilityEvent());
                        },
                        icon: Icon(
                          getPasswordIcon(state),
                          color: Theme.of(context).primaryColor,
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
                      textColor: Theme.of(context).primaryColor,
                      filled: false,
                      label: 'Password'.tr,
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
                          return 'Confirm Password Required'.tr;
                        } else if (cPassword != passwordController.text) {
                          return 'Confirm password and password does not matches'
                              .tr;
                        }
                        return null;
                      },
                      cursorColor: Theme.of(context).primaryColor,
                      keyboardType: TextInputType.visiblePassword,
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Theme.of(context).primaryColor,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          context
                              .read<SignUpBloc>()
                              .add(ToggleConfirmPasswordVisibilityEvent());
                        },
                        icon: Icon(
                          getConfirmPasswordIcon(state),
                          color: Theme.of(context).primaryColor,
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
                      textColor: Theme.of(context).primaryColor,
                      filled: false,
                      label: 'Confirm Password'.tr,
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
                      child: state is PhoneAuthLoadingState
                          ? const CustomLoading()
                          : CustomButton(
                              onTap: () async {
                                if (formKey.currentState!.validate()) {
                                  context.read<SignUpBloc>().add(
                                        PhoneNumberAuthEvent(
                                          phoneNumber:
                                              '$countryCode${phoneController.text}',
                                        ),
                                      );
                                }
                              },
                              text: 'Sign Up'.tr,
                              textColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              background: Theme.of(context).primaryColor,
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
                          'Do you have account ?'.tr,
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
                          onTap: () {},
                          child: Text(
                            "Sign in".tr,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 12,
                                  color: Theme.of(context).primaryColor,
                                  decoration: TextDecoration.underline,
                                  decorationColor:
                                      Theme.of(context).primaryColor,
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
