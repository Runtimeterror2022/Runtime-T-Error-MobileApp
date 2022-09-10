//widget of checkbox
import 'package:flutter/material.dart';
import '../constants/app_text_style.dart';
import '../constants/color_palette.dart';
import '../reponsive/SizeConfig.dart';


Widget buildCheckbox(
    {required String checkbox,
      required bool selectedIndex,
      required VoidCallback? onChanged}) => Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Checkbox(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4.0))),
          side:  const BorderSide(
              color: grey128
          ),
          checkColor: whiteFF,
          activeColor: grey62,
          value: selectedIndex,
          onChanged:
              (value) {
            onChanged!();
          }
      ),
      Text(
       checkbox,
        style: AppTextStyle1.normalGreyTTCommon400.copyWith(
          fontSize: 16 * SizeConfig.textMultiplier!,
          fontWeight: FontWeight.w400,
          color: grey62,
        ),
      )
    ],
  );
