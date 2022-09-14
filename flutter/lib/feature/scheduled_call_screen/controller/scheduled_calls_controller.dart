import 'package:get/get.dart';
import 'package:mvc_bolierplate_getx/feature/scheduled_call_screen/model/scheduled_calls_model.dart';
import 'package:mvc_bolierplate_getx/feature/scheduled_call_screen/services/scheduled_call_services.dart';

class ScheduleCallController extends GetxController {
  RxBool isScheduleCallLoading = true.obs;
  Rx<ScheduledCallsModel> scheduledCallsModel = ScheduledCallsModel().obs;

  Future<void> getAllScheduledCalls({String? developerId}) async {
    isScheduleCallLoading.value = true;
    final resopnse =
        await ScheduledCallService.getAllScheduledCalls(developerId);
    if (resopnse != null) {
      scheduledCallsModel.value = ScheduledCallsModel.fromJson(resopnse);
      print(scheduledCallsModel.value.data![0].developerId);
      isScheduleCallLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
