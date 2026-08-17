import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_text_styels.dart';
import 'package:movies_app/core/utils/mob_size.dart';

class OnBoarding1 extends StatelessWidget {
  const OnBoarding1({super.key});

  @override
  Widget build(BuildContext context) {
    double width = context.width;
    double height = context.height;
    return Scaffold(
      backgroundColor: AppColors.blackColor,

      body: Stack(

        children: [
          Image.asset(AppAssets.onBoarding1, width: width,fit: BoxFit.fill,height: height,),
          Padding(
            padding:  EdgeInsets.symmetric(vertical:height*0.02 ,horizontal:width*0.04 ),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              spacing: height*0.025,
              children: [
                Spacer(),
                Text(context.tr('on_boarding1_title'), style: AppTextStyels.white36medium, textAlign: TextAlign.center,),
                Text(context.tr('on_boarding1_body'), style: AppTextStyels.lightWhite20regular),
                ElevatedButton(onPressed: (){},
                    child:Text(context.tr('explore_now'), style: AppTextStyels.black20semi,),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(width, height*0.06),
                    backgroundColor:AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(15),
                    )
                  ),
                ),



              ],
            ),
          )
        ],
      ),

    );
  }
}