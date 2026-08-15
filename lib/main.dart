import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_routs.dart';
import 'package:movies_app/screens/onboarding/on_boarding1.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        AppRouts.onBoarding1 :(context) => OnBoarding1(),
      },
      initialRoute: AppRouts.onBoarding1,

    );
  }
}