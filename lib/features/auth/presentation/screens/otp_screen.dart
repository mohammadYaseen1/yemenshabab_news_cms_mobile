import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:yemenshabab/core/constants/app_defaults.dart';
import 'package:yemenshabab/core/strings/messages.dart';
import 'package:yemenshabab/features/auth/presentation/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:yemenshabab/features/auth/presentation/widgets/sign_widget.dart';
import 'package:yemenshabab/shared/component/custom_button.dart';
import 'package:yemenshabab/shared/component/custom_loading.dart';
import 'package:yemenshabab/shared/component/custom_snack_bar.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments as Map<String, dynamic>;

    final TextEditingController otpCode = TextEditingController();

    final fullName = arguments['fullName'] as String;
    final phoneNumber = arguments['phoneNumber'] as String;
    final password = arguments['password'] as String;
    final age = arguments['age'] as int;
    final gender = arguments['gender'] as int;

    return SignWidget(
      title: 'OTP',
      body: BlocConsumer<SignUpBloc, SignUpState>(
        listener: (context, state) async {
          if (state is VerifyOTPSuccessState) {
            context.read<SignUpBloc>().add(
                  SignUpSubmitEvent(
                    phoneNumber: phoneNumber,
                    password: password,
                    fullName: fullName,
                    gender: gender,
                    age: age,
                  ),
                );

            CustomSnackBar.success(
              title: 'Sign Up'.tr,
              message: AppMessages.createAccountMessage,
            );

            // await Future.delayed(
            //   const Duration(seconds: 1),
            //   () {
            //     Get.toNamed(AppRoutes.base);
            //   },
            // );
          } else if (state is SignUpErrorState) {
            CustomSnackBar.error(
                title: 'Sign Up'.tr, message: state.errorMessage);
          } else if (state is VerifyOTPErrorState) {
            CustomSnackBar.error(title: 'OTP'.tr, message: state.errorMessage);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(
              right: AppDefaults.defaultHorizontalSpaceBetweenWidget,
              left: AppDefaults.defaultHorizontalSpaceBetweenWidget,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: AppDefaults.defaultVerticalSpaceBetweenBigWidget,
                ),
                Text(
                  phoneNumber,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(
                  height: AppDefaults.defaultVerticalSpaceBetweenSmallWidget,
                ),
                Text(
                  'Enter the 6-digit OTP code sent through your SMS to verify your phone'
                      .tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 14,
                      ),
                ),
                const SizedBox(
                  height: AppDefaults.defaultVerticalSpaceBetweenBigWidget * 2,
                ),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: SizedBox(
                    height: 60,
                    child: OtpTextField(
                      numberOfFields: 6,
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.1),
                      keyboardType: TextInputType.number,
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      borderColor: Theme.of(context).primaryColor,
                      showFieldAsBox: true,
                      onCodeChanged: (String code) {
                        otpCode.text = code;
                      },
                      borderRadius:
                          BorderRadius.circular(AppDefaults.defaultRightRadius),
                      onSubmit: (String verificationCode) {
                        otpCode.text = verificationCode;
                        // SignInBloc.get(context)
                        //     .add(ChangeOTPCodeEvent(otpCode: verificationCode));
                      }, // end onSubmit
                    ),
                  ),
                ),
                const SizedBox(
                  height: AppDefaults.defaultVerticalSpaceBetweenBigWidget * 2,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal:
                        AppDefaults.defaultHorizontalSpaceBetweenWidget * 2,
                  ),
                  child: AnimatedSwitcher(
                    duration: const Duration(
                      milliseconds: 100,
                    ),
                    child: state is VerifyOTPLoadingState
                        ? const CustomLoading()
                        : CustomButton(
                            text: 'Confirmation'.tr,
                            textColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            background: Theme.of(context).primaryColor,
                            height: 45,
                            radius: 10,
                            onTap: () {
                              if (otpCode.text.isNotEmpty) {
                                context.read<SignUpBloc>().add(
                                    VerifyOTPCodeEvent(otpCode: otpCode.text));
                              }
                            },
                          ), // Duration of the transition
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
