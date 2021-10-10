import 'package:agro_app/app/core/values/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
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
            fontSize: 20,
          ),
        ),
      ),
    ),
  );
}
