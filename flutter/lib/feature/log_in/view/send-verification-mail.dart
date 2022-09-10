import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_bolierplate_getx/feature/log_in/view/link-send-screen.dart';

import '../../../core/constants/app_text_style.dart';
import '../../../core/constants/color_palette.dart';
import '../../../core/reponsive/SizeConfig.dart';
import '../../../core/universal_widgets/custom-button.dart';
import '../../../core/universal_widgets/custom-text-field.dart';
import '../controller/login_controller.dart';


class SendVerificationMailScreen extends StatelessWidget {
  SendVerificationMailScreen({Key? key}) : super(key: key);
  final obSecurePassword = true.obs;
  final LoginController logInController = Get.find();

  @override
  Widget build(BuildContext context) => SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
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
                          child: const Icon(Icons.chevron_left)),
                    ),
                  ),
                  Text(
                    "Find your account",
                    style: AppTextStyle1.largeBlackMontserrat500,
                  ),
                  SizedBox(
                    height: 16 * SizeConfig.heightMultiplier!,
                  ),
                  Text(
                    "Enter the email address associated\nwith your account.",
                    style: AppTextStyle1.normalGreyTTCommon400.copyWith(
                        height: 1.7 * SizeConfig.heightMultiplier!,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 74 * SizeConfig.heightMultiplier!,
                  ),
                  GetBuilder<LoginController>(
                    id: "validate-forgot-password-email-text",
                    builder: (logInController) => CustomTextField(
                          textEditingController:
                              logInController.emailResetController,
                          onChanged: (value) {
                             logInController.checkForgotEmailValidation();
                          },
                          textInputType: TextInputType.emailAddress,
                          isObsecure: false,
                          hint: "Enter your email",
                          errorText: logInController.validateForgotPasswordText,
                          label: 'Email address'),
                  ),
                  SizedBox(
                    height: 32 * SizeConfig.heightMultiplier!,
                  ),
                  // Obx(
                  //   () => logInController.isSendingMail.value
                  //       ?
                  //   Center(
                  //           child: SizedBox(
                  //             height: 70 * SizeConfig.heightMultiplier!,
                  //             width: 70 * SizeConfig.widthMultiplier!,
                  //             child: Center(
                  //                 child: Lottie.asset(
                  //                     'assets/images/loading-lottie.json')),
                  //           ),
                  //         )
                  //       :
                    CustomButton(
                            onPressed: () async {
                              // logInController.formKey1.currentState
                              //     ?.validate();
                                    if(logInController.validateForgotPasswordText == null){
                                      logInController.checkPasswordValidation();
                                      FocusManager.instance.primaryFocus?.unfocus();
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (BuildContext context) => LinkSentScreen(),
                                      ));
                                      // await logInController.passwordResetLink(
                                      //     logInController.emailResetController.text,
                                      //     context);
                                    }

                            },
                            text: "Reset password".toUpperCase()),

                  SizedBox(
                    height: 188 * SizeConfig.heightMultiplier!,
                  ),
                  GestureDetector(
                    onTap: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      Navigator.pop(context);
                    },
                    child: Center(
                        child: Text(
                      "Sign in instead",
                      style: AppTextStyle1.normalGreyTTCommon400.copyWith(
                          fontSize: 14 * SizeConfig.textMultiplier!,
                          color: black3E,
                    )),
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
}
