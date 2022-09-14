import 'package:get/get.dart';
import 'package:mvc_bolierplate_getx/feature/client_screen/models/client_list_data_model.dart';
import 'package:mvc_bolierplate_getx/feature/home/services/home_services.dart';

class ClientController extends GetxController {
  ClientListModel allClientList = ClientListModel();
  RxBool isAllClientListLoading = true.obs;
  Future<void> getAllClientsList() async {
    isAllClientListLoading.value = true;
    final response = await HomeService.getAllClients();
    if (response != null) {
      allClientList = ClientListModel.fromJson(response);
      isAllClientListLoading.value = false;
    }
  }

  @override
  void onInit() {
    getAllClientsList();
    super.onInit();
  }
}
