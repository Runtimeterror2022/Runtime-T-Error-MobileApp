import 'package:flutter/material.dart';

import '../constants/app_text_style.dart';
import '../constants/color_palette.dart';
import '../reponsive/SizeConfig.dart';


class AppBarWithoutButton extends StatelessWidget with PreferredSizeWidget {
  AppBarWithoutButton({Key? key, required this.title,}) : super(key: key);
  final String title;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) => AppBar(
      backgroundColor: whiteFF,
      elevation: 1,
      automaticallyImplyLeading: false,
      //centerTitle: true,
      title: Text(
        title,
        style: AppTextStyle1.normalGreyTTCommon400.copyWith(
          fontSize: 18 * SizeConfig.textMultiplier!,
          fontWeight: FontWeight.w600,
          color: grey62,
        ),
      ),
    );

  @override
  Size get preferredSize => Size.fromHeight(57 * SizeConfig.heightMultiplier!);
}
