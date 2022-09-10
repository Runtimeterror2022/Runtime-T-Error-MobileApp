import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../constants/app_text_style.dart';
import '../constants/color_palette.dart';
import '../reponsive/SizeConfig.dart';

class ShowCustomToast {
  void showToast({
  bool errorMessage = false, String? message
}) {
    Get.showSnackbar(GetSnackBar(
      messageText:
      Text(
        message?? "",
        style: AppTextStyle1.normalGreyTTCommon400.copyWith(
          fontSize: 16 * SizeConfig.textMultiplier!,
          fontWeight: FontWeight.w500,
          color: grey62,
        ),
      ),
      duration: const Duration(seconds: 1),
      animationDuration: const Duration(
        seconds: 0
      ),
      icon: errorMessage == false?Icon(
        Icons.check,
  size: 24.sp,
      ):Icon(
        Icons.close,
        size: 24.sp,
      ),
      borderRadius: 4.0,
      padding: EdgeInsets.all(16 * SizeConfig.widthMultiplier!),
      margin: EdgeInsets.only(
          left: 16 * SizeConfig.widthMultiplier!,
          right: 16 * SizeConfig.widthMultiplier!,
          bottom: 48 * SizeConfig.heightMultiplier!),
      borderColor:
      errorMessage == false?
      green67:red212,
      borderWidth: 1 * SizeConfig.widthMultiplier!,
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.FLOATING,
      backgroundColor:Colors.white,

    ));
  }
}
