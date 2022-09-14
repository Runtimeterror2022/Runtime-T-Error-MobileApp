import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_bolierplate_getx/core/common_widgets/scheduled_calls_screen.dart';
import 'package:mvc_bolierplate_getx/core/constants/app_text_style.dart';
import 'package:mvc_bolierplate_getx/feature/scheduled_call_screen/controller/scheduled_calls_controller.dart';

class ScheduledCallsListScreen extends StatelessWidget {
  ScheduledCallsListScreen({Key? key}) : super(key: key);

  final ScheduleCallController _scheduleCallController =
      Get.put(ScheduleCallController());

  @override
  Widget build(BuildContext context) {
    _scheduleCallController.getAllScheduledCalls();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(239, 239, 239, 1.0),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Text(
            'Scheduled calls',
            style: AppTextStyle.titleBlackMedium18,
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            Obx(
              () => _scheduleCallController.isScheduleCallLoading.value
                  ? const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: _scheduleCallController
                            .scheduledCallsModel.value.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ScheduledCallsUI(
                              clientName: _scheduleCallController
                                  .scheduledCallsModel
                                  .value
                                  .data![index]
                                  .developerId!
                                  .substring(0, 6),
                              ProjectName: _scheduleCallController
                                  .scheduledCallsModel
                                  .value
                                  .data![index]
                                  .startTime!,
                              developerName: _scheduleCallController
                                  .scheduledCallsModel.value.devList![0]
                                  .singleWhere((element) =>
                                      element.id ==
                                      _scheduleCallController
                                          .scheduledCallsModel
                                          .value
                                          .data![index]
                                          .developerId!)
                                  .developerName!,
                              techStack: _scheduleCallController
                                  .scheduledCallsModel.value.devList![0]
                                  .singleWhere((element) => element.id == _scheduleCallController.scheduledCallsModel.value.data![index].developerId!)
                                  .techStack
                                  .toString()
                                  .replaceAll('[', '')
                                  .replaceAll(']', ''),
                              callInitiated: _scheduleCallController.scheduledCallsModel.value.data![index].endDate == DateTime.now(),
                              isClient: true);
                        },
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
