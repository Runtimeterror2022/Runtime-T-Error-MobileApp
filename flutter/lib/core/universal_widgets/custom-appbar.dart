import 'package:flutter/material.dart';
import '../constants/app_text_style.dart';
import '../constants/color_palette.dart';
import '../reponsive/SizeConfig.dart';

class MyCustomAppbar extends StatelessWidget with PreferredSizeWidget {
  MyCustomAppbar({Key? key, required this.title,required this.onPressed}) : super(key: key);
  final String title;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    var normalGreyTTCommon400;
    return AppBar(
      backgroundColor: whiteFF,
      elevation: 1,
      leading: IconButton(
        onPressed: onPressed,
        icon: Icon(
          Icons.arrow_back,
          size: 28 * SizeConfig.heightMultiplier!,
        ),
      ),
      title: Text(
        title,
        style: AppTextStyle1.normalGreyTTCommon400.copyWith(
          fontSize: 18 * SizeConfig.textMultiplier!,
          fontWeight: FontWeight.w600,
          color: grey62,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(57 * SizeConfig.heightMultiplier!);
}
