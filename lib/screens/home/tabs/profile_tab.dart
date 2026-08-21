import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_routs.dart';
import 'package:movies_app/core/utils/app_text_styels.dart';
import 'package:movies_app/screens/widgets/custom_elevated_button.dart';

import '../../../core/utils/app_colors.dart';


class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(child: CustomElevatedButton(text: "Edit profile", func: () => Navigator.pushNamed(context, AppRouts.updateProf)  , color: AppColors.primaryColor, textStyle: AppTextStyels.black20semi));
  }
}
