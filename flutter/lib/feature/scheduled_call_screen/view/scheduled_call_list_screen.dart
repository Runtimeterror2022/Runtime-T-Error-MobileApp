import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_bolierplate_getx/core/common_widgets/scheduled_calls_screen.dart';
import 'package:mvc_bolierplate_getx/core/constants/app_text_style.dart';
import 'package:mvc_bolierplate_getx/feature/scheduled_call_screen/controller/scheduled_calls_controller.dart';

class ScheduledCallsListScreen extends StatelessWidget {
  ScheduledCallsListScreen({Key? key}) : super(key: key);

  final ScheduleCallController _scheduleCallController =
      Get.put(ScheduleCallController());
  final List<Map<String, dynamic>> _listOfCalls = [
    {
      "clientName": "Victor Lai",
      "ProjectName": "FitBasix",
      "developerName": "Sagar Singh",
      "techStack": "Flutter Developer",
      "callInitiated": true,
      'isClient': true
    },
    {
      "clientName": "Victor Lai",
      "ProjectName": "FitBasix",
      "developerName": "Pawan",
      "techStack": "Node JS Developer",
      "callInitiated": true,
      'isClient': true
    },
    {
      "clientName": "Caligomed inc",
      "ProjectName": "Caligomed",
      "developerName": "Aditya Arya",
      "techStack": "Flutter Developer",
      "callInitiated": false,
      'isClient': true
    },
    {
      "clientName": "Enercent inc",
      "ProjectName": "True Power",
      "developerName": "Kashif Ahmad",
      "techStack": "Flutter Developer",
      "callInitiated": false,
      'isClient': true
    },
    {
      "clientName": "Tranzact inc",
      "ProjectName": "Tranzact",
      "developerName": "Kashif Ahmad",
      "techStack": "Flutter Developer",
      "callInitiated": true,
      'isClient': true
    },
  ];

  @override
  Widget build(BuildContext context) {
    _scheduleCallController.getAllScheduledCalls();
    _listOfCalls.shuffle();
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
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: _listOfCalls.length,
                itemBuilder: (BuildContext context, int index) {
                  return ScheduledCallsUI(
                      clientName: _listOfCalls[index]['clientName'],
                      ProjectName: _listOfCalls[index]['ProjectName'],
                      developerName: _listOfCalls[index]['developerName'],
                      techStack: _listOfCalls[index]['techStack'],
                      callInitiated: _listOfCalls[index]['callInitiated'],
                      isClient: _listOfCalls[index]['isClient']);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
