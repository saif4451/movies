import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_text_styels.dart';
import 'package:movies_app/core/utils/lists/lists.dart';
import 'package:movies_app/core/utils/mob_size.dart';
import 'package:movies_app/screens/authntication/_buildTextField.dart';
import 'package:movies_app/screens/widgets/custom_app_bar.dart';
import 'package:movies_app/screens/widgets/custom_elevated_button.dart';

class UpdateProfile extends StatefulWidget {

   UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  List<String> gamers = Lists.gamers;

  int selected_index = 0;

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    return Scaffold(
      backgroundColor: AppColors.blackColor,

      appBar: CustomAppBar.CustomApp(context.tr("pick_avatar"), context),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: height*0.02, horizontal: width*0.04),
        child: SingleChildScrollView(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            spacing: height*0.02,
            children: [

              GestureDetector(
                onTap: () {
                  showModalBottomSheet(context: context,
                      isScrollControlled: true,
                      builder: (context) {
                        return Padding(
                          padding:  EdgeInsets.symmetric(horizontal: width*0.04, vertical: height*0.02),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GridView.builder(
                                shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3, crossAxisSpacing: width*0.04,mainAxisSpacing: height*0.02
                                      ),
                                   itemBuilder:(context, index) {
                                     return Container(
                                       padding: EdgeInsetsGeometry.symmetric(vertical: height*0.01, horizontal: width*0.02),
                                       decoration: BoxDecoration(
                                         color: selected_index==index?AppColors.lightOrangeColor:AppColors.transparentColor,
                                         borderRadius: BorderRadiusGeometry.circular(20),
                                         border: BoxBorder.all(
                                           color: AppColors.primaryColor,
                                           width: 2
                                         )
                                       ),
                                       child: GestureDetector(
                                         onTap: () {
                                           selected_index = index;
                                           setState(() {
                                             Navigator.pop(context);
                                           });
                                         },

                                         child: ClipOval(
                                           child: Image.asset(
                                             gamers[index],
                                             fit: BoxFit.fill,



                                           ),
                                         ),
                                       ),
                                     );
                                   },
                                itemCount: gamers.length,
                              ),
                            ],
                          ),
                        ) ;
                      },
                    backgroundColor: AppColors.darkGrey
                  );

                },

                child: ClipOval(

                  child: Image.asset(
                    gamers[selected_index],
                    fit: BoxFit.fill,
                    //width: width *0.3,
                    height: height *0.15,

                    errorBuilder:
                        (context, error, stackTrace) {
                      return Icon(
                        Icons.error,
                        color: Colors.red,
                        size: width * 0.06,
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: height*0.005,
              ),
              CustomTextField(hintText: 'John Safwat', imagePath: AppAssets.userProf),
              CustomTextField(hintText: '01200000000', imagePath: AppAssets.phoneIcon),
              Container(
                width: width,
                  child: Text(context.tr('reset_password'), style: AppTextStyels.White20regular,textAlign: TextAlign.start,)),
              SizedBox(
                height: height*0.25,
              ),
              CustomElevatedButton(text: context.tr("delete_account"), func: (){}, color: AppColors.redColor, textStyle: AppTextStyels.White20regular),
              CustomElevatedButton(text: context.tr("update_data"), func: (){}, color: AppColors.primaryColor, textStyle: AppTextStyels.black20regular),
            ],
          ),
        ),
      ),
    );
  }
}
