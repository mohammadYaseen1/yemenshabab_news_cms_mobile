import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import 'package:yemenshabab_news_cms_mobile/shared/constants/constants.dart';

toast({
  required String title,
  required BuildContext context,
  String? description,
  themeColor themeColor = themeColor.background,
  ToastificationType toastType = ToastificationType.success,
  textColor = Colors.white,
}) {
  toastification.show(
    context: context,
    type: toastType,
    style: ToastificationStyle.flat,
    autoCloseDuration: const Duration(seconds: 5),
    title: Text(title),
    description: description != null
        ? RichText(text: TextSpan(text: description))
        : null,
    alignment: Alignment.bottomCenter,
    direction: TextDirection.ltr,
    animationDuration: const Duration(milliseconds: 300),
    animationBuilder: (context, animation, alignment, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
    margin: const EdgeInsets.only(bottom: 65),
    showProgressBar: false,
    closeButtonShowType: CloseButtonShowType.onHover,
    // closeOnClick: true,
    // pauseOnHover: true,
    // dragToClose: true,
    applyBlurEffect: true,
    callbacks: ToastificationCallbacks(
      onTap: (toastItem) =>
          print('Toast ${toastItem.id} tapped'),
      onCloseButtonTap: (toastItem) =>
          print('Toast ${toastItem.id} close button tapped'),
      onAutoCompleteCompleted: (toastItem) =>
          print('Toast ${toastItem.id} auto complete completed'),
      onDismissed: (toastItem) => print('Toast ${toastItem.id} dismissed'),
    ),
  );
}
