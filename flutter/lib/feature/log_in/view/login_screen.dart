import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../core/constants/app_text_style.dart';
import '../../../core/constants/color_palette.dart';
import '../../../core/constants/image_path.dart';
import '../../../core/reponsive/SizeConfig.dart';
import '../../../core/universal_widgets/custom-button.dart';
import '../../../core/universal_widgets/custom-text-field.dart';
import '../controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final LoginController logInController = Get.put(LoginController());
  final obSecurePassword = true.obs;
  @override
  Widget build(BuildContext context) => SafeArea(
          child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: whiteFF,
          body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 24 * SizeConfig.widthMultiplier!),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 80 * SizeConfig.heightMultiplier!,
                          bottom: 32 * SizeConfig.heightMultiplier!),
                      child: SvgPicture.asset(
                        ImagePath.appLogo,
                        width: 150 * SizeConfig.widthMultiplier!,
                        height: 150 * SizeConfig.heightMultiplier!,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20 * SizeConfig.heightMultiplier!,
                  ),
                  Text(
                    'Welcome',
                    style: AppTextStyle1.largeBlackMontserrat500,
                  ),
                  SizedBox(
                    height: 48 * SizeConfig.heightMultiplier!,
                  ),
                  GetBuilder<LoginController>(
                      id: 'validate-email-text',
                      builder: (logInController) => CustomTextField(
                            textEditingController:
                                logInController.emailLoginController,
                            onChanged: (value) {
                              logInController.checkEmailValidation();
                            },
                            errorText: logInController.validateEmailText,
                            // validator: (value) => value!.isEmpty? "This field is Required":null,
                            textInputType: TextInputType.emailAddress,
                            isObsecure: false,
                            hint: 'Enter your email', label: 'Email address',
                          )),
                  SizedBox(
                    height: 24 * SizeConfig.heightMultiplier!,
                  ),
                  GetBuilder<LoginController>(
                      id: 'validate-password-text',
                      builder: (logInController) => CustomTextField(
                          textEditingController:
                              logInController.passwordController,
                          onChanged: (value) {
                            logInController.checkPasswordValidation();
                          },
                          errorText: logInController.validatePasswordText,
                          textInputType: TextInputType.visiblePassword,
                          isObsecure: obSecurePassword.value,
                          hint: 'Enter your password',
                          onSuffixTap: () {
                            obSecurePassword.value = !obSecurePassword.value;
                            logInController.update(['validate-password-text']);
                          },
                          suffixWidget: Icon(
                            obSecurePassword.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: grey80,
                            size: 20 * SizeConfig.widthMultiplier!,
                          ),
                          label: 'Password')),
                  SizedBox(
                    height: 48 * SizeConfig.heightMultiplier!,
                  ),
                  Obx(() => !logInController.userClickedOnLoginButton.value
                      ? CustomButton(
                          onPressed: () async {
                            logInController
                              ..checkEmailValidation()
                              ..checkPasswordValidation();
                            print(logInController.validatePasswordText);
                            print(logInController.validateEmailText);
                            if (logInController.validatePasswordText == null &&
                                logInController.validateEmailText == null) {
                              if (!logInController
                                  .userClickedOnLoginButton.value) {
                                logInController.userClickedOnLoginButton.value =
                                    true;
                                logInController
                                  ..checkEmailValidation()
                                  ..checkPasswordValidation();
                                FocusManager.instance.primaryFocus?.unfocus();
                                await logInController.loginUser(
                                    context: context);
                                logInController.userClickedOnLoginButton.value =
                                    false;
                              }
                            }
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) =>
                            //           CustomBottomNavigationBar()),
                            // );
                          },
                          text: 'Login to your account'.toUpperCase())
                      : Center(
                          child: SizedBox(
                            height: 50 * SizeConfig.heightMultiplier!,
                            width: 50 * SizeConfig.widthMultiplier!,
                            child: Center(
                                child: Lottie.asset('assets/circular.json')),
                          ),
                        )),
                  SizedBox(
                    height: 24 * SizeConfig.heightMultiplier!,
                  ),
                  // GestureDetector(
                  //     onTap: () {
                  //       // logInController
                  //       //   ..validateEmailText = null
                  //       //   ..update(['validate-email-text'])
                  //       //   ..validatePasswordText = null
                  //       //   ..update(['validate-password-text']);
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //             builder: (BuildContext context) =>
                  //                 SendVerificationMailScreen(),
                  //           ));
                  //     },
                  //     child: Center(
                  //         child: Text(
                  //       'Forgot your password?',
                  //       style: AppTextStyle1.normalGreyTTCommon400.copyWith(
                  //         fontSize: 14 * SizeConfig.textMultiplier!,
                  //         color: black3E,
                  //       ),
                  //     ))),
                ],
              ),
            ),
          ),
        ),
      ));
}
