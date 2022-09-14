import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/universal_widgets/custom-toast.dart';
import '../../bottom_navigation_bar/view/bottom_navigation_bar_screen.dart';
import '../services/login_services.dart';
import '../view/send-verification-mail.dart';

class LoginController extends GetxController {
  RxBool isLoginLoading = false.obs;
  RxBool userClickedOnLoginButton = false.obs;
  RxBool isLoginClicked = false.obs;
  RxBool isSendingMail = false.obs;
  String? validateEmailText;
  String? validatePasswordText;
  String? validateForgotPasswordText;
  RxBool isCredentialsWrong = false.obs;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailLoginController = TextEditingController();
  final TextEditingController emailResetController = TextEditingController();

  Future<void> setData({required bool? token}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('token', token!);
  }

  Future<void> loginUser({required BuildContext context}) async {
    var data =  await LogInService().loginUser(
         email: emailLoginController.text,
        password: passwordController.text);
    print(data);
    if(data == true ){
      ShowCustomToast().showToast(message: "Successfully logged in");
      await setData(token: true);
      await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) =>
                CustomBottomNavigationBar(),
          ));
    //   Navigator.push(context, MaterialPageRoute(
    //       builder: (BuildContext context) => CustomBottomNavigationBar(),
    // ));
    } else if(data == false ){
      print("error1");
    } else {
      print("error");
    }

  }


  String? checkEmailValidation() {
    if (emailLoginController.text.isEmpty) {
      validateEmailText = "This field is required";
    } else if (!emailLoginController.text.isValidEmail()) {
      validateEmailText = 'Please enter a valid email';
    } else {
      validateEmailText = null;
    }
    update(["validate-email-text"]);
    return null;
  }

  String? checkForgotEmailValidation() {
    if (emailResetController.text.isEmpty) {
      validateForgotPasswordText = "This field is required";
    } else if (!emailResetController.text.isValidEmail()) {
      validateForgotPasswordText = 'Please enter a valid email';
    } else {
      validateForgotPasswordText = null;
    }
    update(["validate-forgot-password-email-text"]);
    return null;
  }

  String? checkPasswordValidation() {
    if (passwordController.text.isEmpty) {
      validatePasswordText = "This field is required";
    } else {
      validatePasswordText = null;
    }
    update(["validate-password-text"]);
    return null;
  }

  flushValues() {
    emailLoginController.clear();
    passwordController.clear();
    validateEmailText = null;
    validatePasswordText = null;
    validateForgotPasswordText = null;
    emailResetController.clear();
    update(["validate-email-text"]);
    update(["validate-password-text"]);
    update(["validate-forgot-password-email-text"]);
  }



  void deleteData({required BuildContext context}) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    Get.deleteAll();
    // await putController();
    // Navigator.of(context).pushAndRemoveUntil(
    //     CustomPageRoute(child: LogInScreen(), direction: AxisDirection.up),
    //         (Route<dynamic> route) => false);
    // final HomeController homeController = Get.find();
    // homeController.getProspectStagesEntitiesData.clear();
  }

  //
  // Future<void> userLogIn(
  //     String email, String password, BuildContext context) async {
  //   final result = await login(LoginParams(email: email, password: password));
  //   await result!.fold((l) => null, (r) async {
  //     if (r.status == "success") {
  //       isLoginClicked.value = true;
  //       logindata.value = r;
  //       isLoginLoading.value = true;
  //       await setdata(token: r.accountToken);
  //       await setUserId(id: r.id);
  //       final HomeController homeController = Get.find();
  //       await homeController.getProfileDataCall();
  //       Navigator.pushNamedAndRemoveUntil(
  //           context, RouteName.homeScreen, (Route<dynamic> route) => false);
  //       ShowCustomToast().showToast(message: "Successfully logged in");
  //     } else {
  //       //ShowCustomToast().showToast(errorMessage: true,message: r.message);
  //     }
  //   });
  // }
  //
  // Future<void> passwordResetLink(String email, BuildContext context) async {
  //   isSendingMail.value = true;
  //   final result = await passwordReset(email);
  //   result!.fold((l) => null, (r) async {
  //     if (r != null) {
  //       Navigator.pushNamed(context, RouteName.linkSendScreen);
  //     }
  //   });
  //   isSendingMail.value = false;
  // }


}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}