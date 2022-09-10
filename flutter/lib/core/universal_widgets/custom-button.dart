import 'package:flutter/material.dart';

import '../constants/app_text_style.dart';
import '../constants/color_palette.dart';
import '../reponsive/SizeConfig.dart';


class CustomButton extends StatelessWidget {
  CustomButton(
      {Key? key,
      this.buttonColor = cTA,
      this.borderRadius = 6,
      this.width,
      this.splashColor = Colors.teal,
      required this.text,
      this.onPressed,
      this.textStyle})
      : super(key: key);
  final Color buttonColor;
  final double borderRadius;
  final double? width;
  final Color splashColor;
  final String text;
  final TextStyle? textStyle;
  VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: TextButton(
            child: Text(
              text.toUpperCase(),
              style: textStyle ??
                  AppTextStyle1.normalGreyTTCommon400.copyWith(
                        fontSize: 12 * SizeConfig.textMultiplier!,
                        fontWeight: FontWeight.w700,
                        color: white238,
                      ),
            ),
            onPressed: onPressed,
            style: TextButton.styleFrom(
                animationDuration: const Duration(milliseconds: 300),
                primary: splashColor,
                textStyle: textStyle ??
                    AppTextStyle1.normalGreyTTCommon400.copyWith(
                      fontSize: 12 * SizeConfig.textMultiplier!,
                      fontWeight: FontWeight.w700,
                      color: black3E,
                    ),
                backgroundColor: buttonColor,
                fixedSize: Size(
                  width ?? double.infinity,
                  48 * SizeConfig.heightMultiplier!,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius))),
          ),
        ),
      ],
    );
  }
}
