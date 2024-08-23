import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
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

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String countryCode = '+962';

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    IconData getPasswordIcon(SignInState state) {
      return state is PasswordHiddenState
          ? Icons.visibility_outlined
          : Icons.visibility_off_outlined;
    }

    return BlocConsumer<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccessState) {
          // Get.offAllNamed(AppRoutes.base);
        } else if (state is SignInErrorState) {
          // CustomSnackBar.error(
          //   title: 'Sign In'.tr,
          //   message: state.errorMessage,
          // );
        } else if (state is CountryCodeSelectedState) {
          countryCode = state.countryCode;
        }
      },
      builder: (context, state) {
        return SignWidget(
          title: 'Sign In'.tr,
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
                          width: AppSizeConfig.screenWidth * 0.6,
                          height: AppSizeConfig.screenHeight * 0.25,
                          fit: BoxFit.fill,
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
                      focusBorderColor: Theme.of(context).primaryColor,
                      borderWidth: 1,
                      prefixIcon: InkWell(
                        onTap: () {
                          showCountryPicker(
                            context: context,
                            showPhoneCode: true,
                            onSelect: (Country country) {
                              context.read<SignInBloc>().add(
                                  SelectCountryCodeEvent(
                                      '+${country.phoneCode}'));
                            },
                            showSearch: true,
                            countryListTheme: CountryListThemeData(
                              bottomSheetHeight:
                                  AppSizeConfig.screenHeight * 0.6,
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
                              .read<SignInBloc>()
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
                      focusBorderColor: Theme.of(context).primaryColor,
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
                                  Get.offAllNamed(AppRoutes.main);
                                  // if (formKey.currentState!.validate()) {
                                  //   context.read<SignInBloc>().add(
                                  //       SignInSubmitEvent(
                                  //           phoneNumber:
                                  //               '$countryCode${phoneController.text}',
                                  //           password: passwordController.text));
                                  // }
                                },
                                text: 'Sign In'.tr,
                                textColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                                background: Theme.of(context).primaryColor,
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
                          'You don\'t have an account ,'.tr,
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
                            Get.toNamed(AppRoutes.signUp);
                          },
                          child: Text(
                            "Register now".tr,
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
