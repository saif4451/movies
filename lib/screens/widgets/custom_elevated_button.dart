import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/Model/on_boarding_model.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/lists/on_boarding_list.dart';

import '../../core/utils/app_text_styels.dart';
import '../../core/utils/mob_size.dart';
class CustomElevatedButton extends StatelessWidget {
  String text;
  void Function() func;
  Color color;
  TextStyle _textStyle;
   CustomElevatedButton({super.key, required this.text,  required this.func,
    required this.color, required this._textStyle});

  @override
  Widget build(BuildContext context) {
    double width = context.width;
    double height = context.height;
    return ElevatedButton(onPressed: func,
      child:Text(context.tr(text), style: _textStyle,),
      style: ElevatedButton.styleFrom(
          minimumSize: Size(width, height*0.06),
          backgroundColor:color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(width * 0.032),
            side: BorderSide(
              color: AppColors.primaryColor,
                  width: 2,
            )
          )
      ),
    );
  }
}
