import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mvc_bolierplate_getx/core/constants/color_palette.dart';
import 'package:mvc_bolierplate_getx/feature/bottom_navigation_bar/view/bottom_navigation_bar_screen.dart';
import 'package:mvc_bolierplate_getx/feature/log_in/view/login_screen.dart';

import 'core/reponsive/SizeConfig.dart';

class MyApp extends StatelessWidget {
  // final AppTranslations translations;
  const MyApp({
    Key? key,
  })
  // required this.translations,})
  : super(key: key);

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
      designSize: const Size(360, 728),
      minTextAdapt: true,
      builder: (_, __) => LayoutBuilder(
          builder: (context, constraints) =>
              OrientationBuilder(builder: (context, orientation) {
                SizeConfig().init(constraints, orientation);
                SystemChrome.setPreferredOrientations([
                  DeviceOrientation.portraitUp,
                ]);
                return GetMaterialApp(
                  theme: ThemeData(
                    primarySwatch: Colors.blue,
                    inputDecorationTheme: InputDecorationTheme(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: AppColors.kborder),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: AppColors.kborder),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        prefixIconColor: AppColors.kgrey,
                        labelStyle: const TextStyle(color: AppColors.kgrey),
                        focusColor: AppColors.kgrey),
                  ),
                  debugShowCheckedModeBanner: false,
                  title: 'MyApp',
                  home: LoginScreen(),
                );
              })));
}
