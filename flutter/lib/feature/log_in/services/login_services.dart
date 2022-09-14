import 'dart:developer';

import 'package:get/get.dart';

import '../../../core/api_service/dio_service.dart';
import '../../../core/routes/api_routes.dart';
import '../controller/login_controller.dart';

class LogInService {
  static LoginController loginController = Get.put(LoginController());
  static var dio = DioUtil().getInstance();

  Future<bool> loginUser(
      {required String email, required String password}) async {
    final response = await dio?.post(ApiUrl.signIn,
        data: {'email': email,
          'sale_password': password,
          'is_superadmin':false
        });
    log(response!.statusCode.toString());
    log(response.data.toString());
    log(response.statusMessage.toString());
    if (response.statusCode == 200) {
      log(response.statusCode.toString());
      log(response.data.toString());
      log(response.statusMessage.toString());
      return true;
    }
    log(response.statusCode.toString());
    log(response.data.toString());
    log(response.statusMessage.toString());
    return false;
  }
}
