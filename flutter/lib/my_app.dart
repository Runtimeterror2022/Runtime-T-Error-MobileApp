import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mvc_bolierplate_getx/core/constants/color_palette.dart';
import 'package:mvc_bolierplate_getx/feature/log_in/view/login_screen.dart';

import 'core/constants/image_path.dart';
import 'core/reponsive/SizeConfig.dart';
import 'core/routes/app_routes.dart';

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
                  title: 'MyApp',
                  home: LoginScreen(),
                );
              })));
}
