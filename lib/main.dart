// main.dart
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_routs.dart';
import 'package:movies_app/core/utils/app_text_styels.dart';
import 'package:movies_app/screens/authntication/register.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTextStyels.getThemeData(),

      routes: {
        AppRouts.register :(context) => Register(),
      },
      initialRoute: AppRouts.register,

    );
  }
}