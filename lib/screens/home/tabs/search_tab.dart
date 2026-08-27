import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_routs.dart';
import 'package:movies_app/core/utils/app_text_styels.dart';
import 'package:movies_app/screens/widgets/custom_elevated_button.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Center(child: CustomElevatedButton(text: 'MovieDetails', func: () => Navigator.pushNamed(context, AppRouts.MovieDetailsscreen), color: AppColors.primaryColor, textStyle: AppTextStyels.black20semi)),
    );
  }
}
