import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemenshabab/shared/component/custom_first_page_exception_indicator.dart';

class CustomNoItemsFoundIndicator extends StatelessWidget {
  const CustomNoItemsFoundIndicator({super.key});

  @override
  Widget build(BuildContext context) => CustomFirstPageExceptionIndicator(
        title: 'noItemsFound'.tr,
        buttonTitle: '',
      );
}
