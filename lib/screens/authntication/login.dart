import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_routs.dart';
import 'package:movies_app/core/utils/app_text_styels.dart';
import 'package:movies_app/screens/widgets/custom_elevated_button.dart';

import '../../core/utils/mob_size.dart';
import '_buildTextField.dart';

class LoginScreen extends StatefulWidget{

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int selectedFlag = 0;
  @override
  Widget build(BuildContext context) {

    final size =MediaQuery.of(context).size;
    double width= context.width;
    double height= context.height;

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width*0.04, vertical: height*0.02),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          spacing: height*0.01,
          children: [

            SizedBox(
              height: height*0.05,
            ),
            Image.asset(AppAssets.logo,),
            SizedBox(
              height: height*0.05,
            ),
            CustomTextField(
              hintText: context.tr("email"),
              imagePath: AppAssets.emailIcon,
              keyboardType: TextInputType.emailAddress,
            ),

            CustomTextField(
              hintText: context.tr("password"),
              imagePath: AppAssets.passwordIcon,
              obscureText: true,
            ),


            InkWell(
              onTap:(){

                Navigator.pushNamed(context, AppRouts.forgetPasswordRouteName);
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(context.tr("forget_password"),style:AppTextStyels.orange14regular
                ),
              ),
            ),
            SizedBox(
              height: height*0.02,
            ),
            CustomElevatedButton(text: context.tr("login"), func: () => Navigator.pushReplacementNamed(context, AppRouts.homeRouteName)  , color: AppColors.primaryColor, textStyle: AppTextStyels.black20regular)
            , SizedBox(
              height: height*0.01,
            )
            ,Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: width*0.01,
              children: [
                Text(context.tr("login_account"),style: AppTextStyels.White14regular,),
                InkWell(
                 onTap: () => Navigator.pushNamed(context, AppRouts.register)
                ,child: Text(context.tr("create_one"),style: AppTextStyels.orange14black,)
                )
              ],
            ),

            SizedBox(
              height: height*0.01,
            ),
            Row(
              spacing: width*0.05,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Divider(color: AppColors.primaryColor, height: 2,indent: width*0.15,)),
                Text(context.tr("OR"),style: TextStyle(color: AppColors.primaryColor),),
                Expanded(child: Divider(color: AppColors.primaryColor, height: 2,endIndent: width*0.15,)),
              ],
            ),
            SizedBox(
              height: height*0.01,
            ),
            
            CustomElevatedButton(text: "login_with_google", func: (){},
                color: AppColors.primaryColor,
                textStyle: AppTextStyels.black16regular, icon: AppAssets.googleIcon,),
            SizedBox(
              height: height*0.02,
            ),
            Container(
              height: height * 0.050,

              padding: EdgeInsets.symmetric(
                horizontal: width * 0.010,
              ),

              decoration: BoxDecoration(
                color: AppColors.blackColor,
                border: Border.all(
                  color: AppColors.primaryColor,
                  width: 2,
                ),

                borderRadius: BorderRadius.circular(30),),

              child: Row(
                mainAxisSize: MainAxisSize.min,

                children: [

                  // ================= USA =================

                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFlag = 0;
                      });
                    },

                    child: Container(
                      width: width * 0.09,
                      height: width * 0.09,



                      decoration: BoxDecoration(
                        shape: BoxShape.circle,

                        border: Border.all(
                            color: selectedFlag == 0
                                ? AppColors.primaryColor
                                : Colors.transparent,

                            width:4
                        ),
                      ),

                      child: ClipOval(
                        child: SvgPicture.asset(
                          AppAssets.usaFlag,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    width: width * 0.03,
                  ),

                  // ================= EGYPT =================

                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFlag = 1;
                      });
                    },

                    child: Container(
                      width: width * 0.09,
                      height: width * 0.09,



                      decoration: BoxDecoration(
                        shape: BoxShape.circle,

                        border: Border.all(
                          color: selectedFlag == 1
                              ? AppColors.primaryColor
                              : Colors.transparent,

                          width: 4,
                        ),
                      ),

                      child: ClipOval(
                        child: SvgPicture.asset(
                          AppAssets.egyptFlag,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
