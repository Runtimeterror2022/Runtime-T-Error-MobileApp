import 'package:flutter/material.dart';


import 'package:get/get.dart';

import '../../../core/constants/app_text_style.dart';
import '../../../core/constants/color_palette.dart';
import '../../../core/reponsive/SizeConfig.dart';
import '../../../core/universal_widgets/custom-button.dart';

class LinkSentScreen extends StatelessWidget {
  LinkSentScreen({Key? key}) : super(key: key);
  var obSecurePassword = true.obs;
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) => SafeArea(
      child: Scaffold(
        backgroundColor: whiteFF,
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 24 * SizeConfig.widthMultiplier!),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Padding(
                        padding: EdgeInsets.only(
                            top: 43 * SizeConfig.heightMultiplier!,
                            bottom: 97 * SizeConfig.heightMultiplier!),
                        child: Icon(Icons.chevron_left)),
                  ),
                ),
                Text(
                  "Password reset\nlink has been sent \nto your mail",
                  style: AppTextStyle1.largeBlackMontserrat500,
                ),
                SizedBox(
                  height: 16 * SizeConfig.heightMultiplier!,
                ),
                Text(
                  "Please check your mail for a password\nreset link and follow the steps for\nresetting your PAMS password.",
                  style: AppTextStyle1.normalGreyTTCommon400.copyWith(
                      height: 1.7 * SizeConfig.heightMultiplier!, fontSize: 16),
                ),
                SizedBox(
                  height: 74 * SizeConfig.heightMultiplier!,
                ),
                CustomButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      // Navigator.pushNamed(context, RouteName.loginScreen);
                    },
                    text: "LOg into your account".toUpperCase()),
              ],
            ),
          ),
        ),
      ),
    );
}
