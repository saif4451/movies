import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_routs.dart';
import 'package:movies_app/screens/authntication/register.dart';
import 'package:movies_app/screens/home/home_screen.dart';
import 'package:movies_app/screens/onboarding/on_boarding1.dart';
import 'package:movies_app/screens/onboarding/on_boarding2.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: [
        Locale('en'),Locale('ar')
      ], path: 'assets/translations',
      fallbackLocale: Locale('en'),
  child: MyApp())
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        AppRouts.onBoarding1 :(context) => OnBoarding1(),
        AppRouts.onBoarding2 :(context) => OnBoarding2(),
        AppRouts.register :(context) => Register(),
        AppRouts.homeRouteName :(context) => HomeScreen(),
      },
      initialRoute: AppRouts.homeRouteName,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,

    );
  }
}