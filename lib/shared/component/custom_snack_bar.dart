import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  CustomSnackBar._();

  static void requiredField(
    context, {
    required final String title,
    required final String message,
  }) {
    Get.snackbar(
      title,
      message,
      icon: const Icon(
        Icons.error,
        color: Colors.white,
      ),
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red.withOpacity(0.8),
      borderRadius: 5,
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }

  static void backWarning({
    required final String title,
    required String message,
  }) {
    Get.snackbar(
      title,
      message,
      icon: const Icon(
        Icons.error,
        color: Colors.black,
      ),
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.yellow.withOpacity(0.8),
      borderRadius: 5,
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      colorText: Colors.black,
      duration: const Duration(seconds: 2),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }

  static void error({
    required final String title,
    required String message,
  }) {
    Get.snackbar(
      title,
      message,
      icon: const Icon(
        Icons.error,
        color: Colors.white,
      ),
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red.withOpacity(0.8),
      borderRadius: 5,
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }

  static void somethingWent(
    context, {
    required final String title,
    required final String message,
  }) {
    Get.snackbar(
      title,
      message,
      icon: const Icon(
        Icons.error,
        color: Colors.white,
      ),
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red.withOpacity(0.8),
      borderRadius: 5,
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }

  static void success({
    required final String title,
    required final String message,
  }) {
    Get.snackbar(
      title,
      message,
      icon: const Icon(
        Icons.done_outline,
        color: Colors.white,
      ),
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green.withOpacity(0.8),
      borderRadius: 5,
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }

  static void unAuthorized(
    context, {
    required final String title,
    required final String message,
  }) {
    Get.snackbar(
      title,
      message,
      icon: const Icon(
        Icons.error,
        color: Colors.white,
      ),
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red.withOpacity(0.8),
      borderRadius: 5,
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }

  static void internetDisconnected({
    required final String title,
    required final String message,
  }) {
    Get.snackbar(
      title,
      message,
      icon: const Icon(
        Icons.wifi_off,
        color: Colors.white,
      ),
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red.withOpacity(0.8),
      borderRadius: 5,
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }

  static void openExternalUrlError({
    required final String title,
    required final String message,
  }) {
    Get.snackbar(
      title,
      message,
      icon: const Icon(
        Icons.error,
        color: Colors.white,
      ),
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red.withOpacity(0.8),
      borderRadius: 5,
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }

  static void permissionPermanentDeniedError({
    required final String title,
    required final String message,
  }) {
    Get.snackbar(
      title,
      message,
      icon: const Icon(
        Icons.error,
        color: Colors.white,
      ),
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red.withOpacity(0.8),
      borderRadius: 5,
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }
}
