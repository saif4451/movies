import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_text_styels.dart';

import '../../core/utils/mob_size.dart';

class MainErrorWidget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onPressed;
  const MainErrorWidget({super.key,
  required this.errorMessage
  ,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: context.height*0.02,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorMessage,
            style: AppTextStyels.White20regular,
          ),
           SizedBox(height: context.height*0.02),
          ElevatedButton(
            onPressed: onPressed,
            child: Text(
              "Try again",
              style: AppTextStyels.black20semi,
            ),
          ),
        ],
      ),
    );
  }
}
