import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_text_styels.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/mob_size.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_elevated_button.dart';
import '_buildTextField.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    double width= context.width;
    double height= context.height;
    return Scaffold(
      backgroundColor: AppColors.blackColor,
        appBar: CustomAppBar.CustomApp(context.tr('forget_password_appBar'), context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ------image ----
            Image.asset(AppAssets.forgetPassword),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: width*0.04),
              child: Column(
                spacing: height*0.02,
                children: [
                  //--------- text field -----
                  CustomTextField(hintText: context.tr('email'), imagePath:AppAssets.emailIcon,),
                  // -----button Verify Email ----
                  CustomElevatedButton(
                    text:context.tr('verify_email') ,
                    func: () {
                      //todo verify Email action
                    },
                    color: AppColors.primaryColor,
                    textStyle:AppTextStyels.black20regular,
                  )
                ],
              ),
            ),
        
        
          ],
        ),
      ),

      
    );
  }
}
