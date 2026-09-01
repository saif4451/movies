import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_routs.dart';
import 'package:movies_app/core/utils/app_text_styels.dart';
import 'package:movies_app/screens/home/tabs/profileTab/watchList/watch_list.dart';
import 'package:movies_app/screens/widgets/custom_elevated_button.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/mob_size.dart';
import 'history/history.dart';



class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    return DefaultTabController(
      length: 2,

      child: Column(
        children: [
          Container(
            color: AppColors.darkGrey,

            padding: EdgeInsetsGeometry.symmetric(horizontal: width*0.04),
            child: Column(
              spacing: height*0.015,
              children: [
                SizedBox(
                  height: height*0.06,
                ),
                Row(
                  spacing: width*0.03,
                  children: [
                    Expanded(
                      child: Column(
                        spacing: height*0.01,
                        children: [
                          Image.asset(AppAssets.gamer1),
                          Text('John Safwat', style: AppTextStyels.white20bold,)

                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        spacing: height*0.01,
                        children: [
                          Text('10', style: AppTextStyels.white36bold,),
                          Text('Watch List', style: AppTextStyels.white24bold,)

                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        spacing: height*0.01,
                        children: [
                          Text('10', style: AppTextStyels.white36bold,),
                          Text('History', style: AppTextStyels.white24bold,)

                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  spacing: width*0.02,
                  children: [
                    Expanded(
                      flex:2,
                        child: CustomElevatedButton(text: 'Edit profile', func: () => Navigator.pushNamed(context, AppRouts.updateProf), color: AppColors.primaryColor, textStyle: AppTextStyels.black20regular)),
                    Expanded(
                      flex:1,
                        child: CustomElevatedButton(text: 'Exit', func: () => (){}, color: AppColors.redColor, textStyle: AppTextStyels.White20regular)),

                  ],
                ),
                TabBar(
                  dividerColor: AppColors.transparentColor,
                  indicatorColor: AppColors.primaryColor,
                  indicatorSize: TabBarIndicatorSize.tab
                  ,tabs:<Widget>[
                  Tab(icon:Icon(Icons.menu, color: AppColors.primaryColor,)),
                  Tab(icon: Icon(Icons.folder, color: AppColors.primaryColor,)),
                ],),


              ],
            ),
          ),
          Expanded(
            child: TabBarView(children: [

              WatchList(),
              FavoriteList()
            ]),
          )
        ],
      ),
    );
  }
}
