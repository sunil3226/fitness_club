import 'package:fitness_club/routes/app_pages.dart';
import 'package:fitness_club/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'localization/LanguageTranslation.dart';
import 'themes/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: LanguageTranslation(),
      locale: LanguageTranslation.local,
      debugShowCheckedModeBanner: false,
      theme: myLightTheme(),
      darkTheme: myDarkTheme(),
      initialRoute: Routes.HOME,
      getPages: AppPages.pages,
    );
  }
}