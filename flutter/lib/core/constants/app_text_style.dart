import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvc_bolierplate_getx/core/constants/color_palette.dart';
import 'package:mvc_bolierplate_getx/core/reponsive/SizeConfig.dart';

abstract class AppTextStyle {
  static TextStyle blackBold40 = GoogleFonts.montserrat(
    fontSize: 40 * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.bold,
  );

  static TextStyle greyMedium14 = GoogleFonts.montserrat(
    fontSize: 14 * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w500,
    color: Colors.grey.shade700,
  );

  static TextStyle blackBold14 = GoogleFonts.montserrat(
    fontSize: 14 * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  static TextStyle grey300Regular12 = GoogleFonts.montserrat(
    fontSize: 12 * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w400,
    color: AppColors.kgrey300,
  );

  static TextStyle grey300Regular10 = GoogleFonts.montserrat(
    fontSize: 10 * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w400,
    color: AppColors.kgrey300,
  );

  static TextStyle whiteMedium16 = GoogleFonts.montserrat(
    fontSize: 16 * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static TextStyle primaryMedium15 = GoogleFonts.montserrat(
    fontSize: 15 * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w500,
    color: Colors.blue,
  );

  static TextStyle titleBlackMedium18 = GoogleFonts.montserrat(
    fontSize: 18 * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static TextStyle activeregular10 = GoogleFonts.montserrat(
    fontSize: 10 * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w400,
    color: AppColors.kactiveText,
  );
}
