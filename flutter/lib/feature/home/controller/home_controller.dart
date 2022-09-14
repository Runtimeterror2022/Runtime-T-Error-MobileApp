import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mvc_bolierplate_getx/feature/home/models/developer_list_models.dart';
import 'package:mvc_bolierplate_getx/feature/home/services/home_services.dart';

class HomeController extends GetxController {
  List<ADeveloperModel> allDevelopers = [];
  RxBool isAllDeveloperLoading = true.obs;
  Future<void> getAllDevelopersList() async {
    isAllDeveloperLoading.value = true;
    final response = await HomeService.getAllDevelopers();
    if (response != null) {
      allDevelopers = List<ADeveloperModel>.from(
          response['data'].map((x) => ADeveloperModel.fromJson(x)));
      isAllDeveloperLoading.value = false;
    }
  }

  @override
  void onInit() {
    getAllDevelopersList();
    super.onInit();
  }
}
