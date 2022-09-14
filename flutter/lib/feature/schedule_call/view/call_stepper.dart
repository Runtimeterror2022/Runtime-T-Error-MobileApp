import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:mvc_bolierplate_getx/core/constants/app_text_style.dart';
import 'package:mvc_bolierplate_getx/core/constants/color_palette.dart';
import 'package:mvc_bolierplate_getx/core/constants/image_path.dart';
import 'package:mvc_bolierplate_getx/core/reponsive/SizeConfig.dart';
import 'package:mvc_bolierplate_getx/core/universal_widgets/custom-button.dart';
import 'package:mvc_bolierplate_getx/feature/bottom_navigation_bar/view/bottom_navigation_bar_screen.dart';
import 'package:mvc_bolierplate_getx/feature/client_screen/controller/client_list_controller.dart';
import 'package:mvc_bolierplate_getx/feature/home/controller/home_controller.dart';
import 'package:mvc_bolierplate_getx/feature/scheduled_call_screen/services/scheduled_call_services.dart';

class CallStepper extends StatefulWidget {
  const CallStepper({Key? key}) : super(key: key);

  @override
  State<CallStepper> createState() => _CallStepperState();
}

class _CallStepperState extends State<CallStepper> {
  final TextEditingController _meetingTitleCtrl = TextEditingController();
  final TextEditingController _meetingNotesCtrl = TextEditingController();
  final HomeController _homeController = Get.put(HomeController());
  final ClientController _clientController = Get.put(ClientController());

  int _step = 0;
  String selectedDate = '';
  String selectedTime = '';
  String procedure = 'Choose a Client';
  String developerName = '';
  String projectName = '';
  String clientName = '';
  String clientId = '';
  String developerId = '';

  bool isEmailAdded = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.kPureWhite,
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          title: Text(
            procedure,
            style: AppTextStyle.titleBlackMedium18,
          ),
        ),
        body: Column(children: [
          (_step < 2)
              ? SizedBox(
                  height: MediaQuery.of(context).size.height * .03,
                )
              : Container(),
          customStepper()!
        ]),
      ),
    );
  }

  Widget? customStepper() {
    switch (_step) {
      case 0:
        return clientTileList();
      case 1:
        return developerTileList();
      case 2:
        return _scheduleMeeting();
      case 3:
        return meetingScheduled();
      default:
        return const CupertinoActivityIndicator();
    }
  }

  Widget meetingScheduled() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(child: Lottie.asset('assets/lottie/scheduled.json')),
        SizedBox(
          height: MediaQuery.of(context).size.height * .1,
        ),
        Text(
          'Your meeting is scheduled',
          style: AppTextStyle.titleBlackMedium18,
        ),
        Text(
          'Hoorayyyyy',
          style: AppTextStyle.titleBlackMedium18,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .04,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * .4,
          child: CustomButton(
            text: 'Done',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CustomBottomNavigationBar()),
              );
            },
          ),
        )
      ],
    );
  }

  Widget _scheduleMeeting() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                  shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))))),
              onPressed: () {},
              child: Container(
                height: 104,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.kPureWhite,
                    border: Border.all(
                      color: const Color(0xffE6F1F8),
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        clientName,
                        style: AppTextStyle.blackRegular16,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        projectName,
                        style: AppTextStyle.greyRegular13,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        developerName,
                        style: AppTextStyle.greyRegular13,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .3,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(AppColors.kPureWhite),
                          // padding: MaterialStateProperty.all(EdgeInsets.zero),
                          shape: MaterialStateProperty.all(
                              const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))))),
                      onPressed: () {
                        DatePicker.showDatePicker(context,
                            showTitleActions: true,
                            minTime: DateTime.now(),
                            maxTime: DateTime(2050, 6, 7),
                            onChanged: (date) {}, onConfirm: (date) {
                          setState(() {
                            selectedDate = date.toString().substring(0, 10);
                          });
                        }, currentTime: DateTime.now(), locale: LocaleType.en);
                      },
                      child: Container(
                        color: AppColors.kPureWhite,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.calendar_today,
                              color: Color(0xff0076BC),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Set Date',
                              style: AppTextStyle.blueRegular12,
                            )
                          ],
                        ),
                      )),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .3,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(AppColors.kPureWhite),
                          // padding: MaterialStateProperty.all(EdgeInsets.zero),
                          shape: MaterialStateProperty.all(
                              const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))))),
                      onPressed: () {
                        DatePicker.showTime12hPicker(context,
                            showTitleActions: true, onChanged: (date) {
                          // print('change $date in time zone ' +
                          //     date.timeZoneOffset.inHours.toString());
                        }, onConfirm: (time) {
                          setState(() {
                            selectedTime = formatTimeOfDay(time);
                          });
                        }, currentTime: DateTime.now());
                      },
                      child: Container(
                        color: AppColors.kPureWhite,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.timer,
                              color: Color(0xff0076BC),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Set Time',
                              style: AppTextStyle.blueRegular12,
                            )
                          ],
                        ),
                      )),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Container(
              child: TextField(
                controller: _meetingTitleCtrl,
                decoration: InputDecoration(
                    labelStyle: AppTextStyle.grey300Regular13,
                    labelText: 'Meeting Title'),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Container(
              child: TextField(
                controller: _meetingNotesCtrl,
                decoration: InputDecoration(
                    labelStyle: AppTextStyle.grey300Regular13,
                    labelText: 'Notes'),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            CustomButton(
                onPressed: () {
                  setState(() {
                    _step = 3;
                  });
                  ScheduledCallService.scheduleACall(developerId, clientId);
                },
                text: 'Schedule Meeting')
          ],
        ),
      ),
    );
  }

  Widget clientTileList() {
    return Obx(
      () => _clientController.isAllClientListLoading.value
          ? const Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Expanded(
              child: ListView.builder(
                  itemCount: _clientController.allClientList.data!.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 10 * SizeConfig.widthMultiplier!,
                          vertical: 7 * SizeConfig.heightMultiplier!),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.transparent),
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                            shape: MaterialStateProperty.all(
                                const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))))),
                        onPressed: () {
                          setState(() {
                            _step = 1;
                            procedure = 'Choose a Developer';
                            clientName = _clientController
                                .allClientList.data![index].cilentCompanyName!;
                            clientId = _clientController
                                .allClientList.data![index].id!;
                            projectName = _clientController
                                .allClientList.data![index].cilentCompanyName!;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          height: MediaQuery.of(context).size.height * .14,
                          decoration: const BoxDecoration(
                              color: AppColors.kPureWhite,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(ImagePath.userIcon),
                                const SizedBox(width: 14),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                            _clientController.allClientList
                                                .data![index].cilentName!,
                                            style: AppTextStyle.blackBold14),
                                        const SizedBox(width: 8),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      _clientController.allClientList
                                          .data![index].cilentCompanyName!,
                                      style: AppTextStyle.grey300Regular12,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      _clientController.allClientList
                                          .data![index].cilentEmail!,
                                      style: AppTextStyle.grey300Regular10,
                                    )
                                  ],
                                ),
                              ]),
                        ),
                      ),
                    );
                  }),
            ),
    );
  }

  Widget developerTileList() {
    return Obx(
      () => _homeController.isAllDeveloperLoading.value
          ? const Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Expanded(
              child: ListView.builder(
                  itemCount: _homeController.allDevelopers.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 10 * SizeConfig.widthMultiplier!,
                          vertical: 7 * SizeConfig.heightMultiplier!),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.transparent),
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                            shape: MaterialStateProperty.all(
                                const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))))),
                        onPressed: () {
                          setState(() {
                            _step = 2;
                            procedure = 'Schedule meeting';
                            developerName = _homeController
                                .allDevelopers[index].developerName!;
                            developerId =
                                _homeController.allDevelopers[index].id!;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          height: MediaQuery.of(context).size.height * .14,
                          decoration: const BoxDecoration(
                              color: AppColors.kPureWhite,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(ImagePath.userIcon),
                                const SizedBox(width: 14),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                            _homeController.allDevelopers[index]
                                                .developerName!,
                                            style: AppTextStyle.blackBold14),
                                        const SizedBox(width: 8),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      _homeController
                                          .allDevelopers[index].email!,
                                      style: AppTextStyle.grey300Regular12,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      _homeController
                                          .allDevelopers[index].techStack
                                          .toString()
                                          .replaceAll('[', '')
                                          .replaceAll(']', ''),
                                      style: AppTextStyle.grey300Regular10,
                                    )
                                  ],
                                ),
                              ]),
                        ),
                      ),
                    );
                  }),
            ),
    );
  }

  String formatTimeOfDay(DateTime tod) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm(); //"6:00 AM"
    return format.format(dt);
  }
}
