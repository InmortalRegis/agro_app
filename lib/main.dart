import 'package:agro_app/app/core/utils/dependency_injection.dart';
import 'package:agro_app/app/core/values/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  DependencyInjection.init();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        fontFamily: 'BrandonText',
        scaffoldBackgroundColor: AppColors.seashell,
        primarySwatch: AppColors.kprimarycolor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: AppColors.seashell,
        appBarTheme: AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 21,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ),
  );
}
