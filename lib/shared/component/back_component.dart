import 'package:flutter/material.dart';
import 'package:yemenshabab/shared/utils/utils.dart';

class BackComponent extends StatelessWidget {
  const BackComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Padding(
          padding:
              EdgeInsetsDirectional.only(start: isArabic(context) ? 30 : 0),
          child: Icon(
            isArabic(context)
                ? Icons.arrow_forward_ios_rounded
                : Icons.arrow_back_ios_new_rounded,
          ),
        ));
  }
}
