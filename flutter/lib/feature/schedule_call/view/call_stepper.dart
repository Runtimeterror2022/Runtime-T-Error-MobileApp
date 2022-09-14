import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:mvc_bolierplate_getx/core/constants/app_text_style.dart';
import 'package:mvc_bolierplate_getx/core/constants/color_palette.dart';
import 'package:mvc_bolierplate_getx/core/constants/image_path.dart';
import 'package:mvc_bolierplate_getx/core/reponsive/SizeConfig.dart';
import 'package:mvc_bolierplate_getx/core/universal_widgets/custom-button.dart';
import 'package:mvc_bolierplate_getx/feature/bottom_navigation_bar/view/bottom_navigation_bar_screen.dart';

class CallStepper extends StatefulWidget {
  const CallStepper({Key? key}) : super(key: key);

  @override
  State<CallStepper> createState() => _CallStepperState();
}

class _CallStepperState extends State<CallStepper> {
  final TextEditingController _meetingTitleCtrl = TextEditingController();
  final TextEditingController _meetingNotesCtrl = TextEditingController();

  int _step = 0;
  String selectedDate = '';
  String selectedTime = '';
  String procedure = 'Choose a Client';
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
                        'Client Name',
                        style: AppTextStyle.blackRegular16,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Project Name',
                        style: AppTextStyle.greyRegular13,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Developer Assigned',
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
                },
                text: 'Schedule Meeting')
          ],
        ),
      ),
    );
  }

  // Widget _chooseDate() {
  //   return Padding(
  //     padding: const EdgeInsets.all(8),
  //     child: Container(
  //       width: double.infinity,
  //       height: MediaQuery.of(context).size.height * .8,
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         children: [
  //           Container(
  //             margin: const EdgeInsets.all(10),
  //             child: TextField(
  //               controller: _clientEmailCtrl,
  //               decoration: InputDecoration(
  //                   suffixIcon: IconButton(
  //                       onPressed: () {
  //                         setState(() {
  //                           isEmailAdded = true;
  //                           FocusScope.of(context).requestFocus(FocusNode());
  //                         });
  //                       },
  //                       icon: const Icon(
  //                         Icons.add_box,
  //                         color: Colors.grey,
  //                       )),
  //                   labelText: 'Enter Client Email',
  //                   prefixIcon: const Icon(Icons.email_sharp)),
  //             ),
  //           ),
  //           SizedBox(height: MediaQuery.of(context).size.height * .05),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //             children: [
  //               Container(
  //                 alignment: Alignment.center,
  //                 width: MediaQuery.of(context).size.width * .3,
  //                 child: CustomButton(
  //                   onPressed: () {
  //                     DatePicker.showDatePicker(context,
  //                         showTitleActions: true,
  //                         minTime: DateTime.now(),
  //                         maxTime: DateTime(2050, 6, 7),
  //                         onChanged: (date) {}, onConfirm: (date) {
  //                       setState(() {
  //                         selectedDate = date.toString().substring(0, 10);
  //                       });
  //                     }, currentTime: DateTime.now(), locale: LocaleType.en);
  //                   },
  //                   text: 'Choose Date',
  //                   textStyle: AppTextStyle.whiteRegular10,
  //                 ),
  //               ),
  //               Container(
  //                 alignment: Alignment.center,
  //                 width: MediaQuery.of(context).size.width * .3,
  //                 child: CustomButton(
  //                   onPressed: () {
  //                     DatePicker.showTime12hPicker(context,
  //                         showTitleActions: true, onChanged: (date) {
  //                       // print('change $date in time zone ' +
  //                       //     date.timeZoneOffset.inHours.toString());
  //                     }, onConfirm: (time) {
  //                       setState(() {
  //                         selectedTime = formatTimeOfDay(time);
  //                       });
  //                     }, currentTime: DateTime.now());
  //                   },
  //                   text: 'Choose Time',
  //                   textStyle: AppTextStyle.whiteRegular10,
  //                 ),
  //               ),
  //             ],
  //           ),
  //           SizedBox(height: MediaQuery.of(context).size.height * .05),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               SizedBox(
  //                 width: MediaQuery.of(context).size.width * .95,
  //                 child: const Divider(
  //                   thickness: 1,
  //                   height: 1,
  //                   color: Colors.black,
  //                 ),
  //               ),
  //             ],
  //           ),
  //           SizedBox(height: MediaQuery.of(context).size.height * .02),
  //           SizedBox(
  //             width: MediaQuery.of(context).size.width * .95,
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Text(
  //                   'Selected Client :',
  //                   style: AppTextStyle.grey300Regular13,
  //                 ),
  //                 Text(
  //                   'Client Name',
  //                   style: AppTextStyle.blackRegular16,
  //                 )
  //               ],
  //             ),
  //           ),
  //           SizedBox(height: MediaQuery.of(context).size.height * .02),
  //           SizedBox(
  //             width: MediaQuery.of(context).size.width * .95,
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Text(
  //                   'Selected Developer :',
  //                   style: AppTextStyle.grey300Regular13,
  //                 ),
  //                 Text(
  //                   'Developer Name',
  //                   style: AppTextStyle.blackRegular16,
  //                 )
  //               ],
  //             ),
  //           ),
  //           SizedBox(height: MediaQuery.of(context).size.height * .02),
  //           (selectedDate != '' && selectedTime != '')
  //               ? SizedBox(
  //                   width: MediaQuery.of(context).size.width * .95,
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       Text(
  //                         'Selected Meeting Time :',
  //                         style: AppTextStyle.grey300Regular13,
  //                       ),
  //                       Row(
  //                         children: [
  //                           Text(
  //                             '$selectedDate',
  //                             style: AppTextStyle.blackRegular16,
  //                           ),
  //                           Text(
  //                             ' at $selectedTime',
  //                             style: AppTextStyle.blackRegular16,
  //                           ),
  //                         ],
  //                       )
  //                     ],
  //                   ),
  //                 )
  //               : Container(),
  //           SizedBox(height: MediaQuery.of(context).size.height * .02),
  //           (isEmailAdded)
  //               ? SizedBox(
  //                   width: MediaQuery.of(context).size.width * .95,
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       Text(
  //                         'Selected Email :',
  //                         style: AppTextStyle.grey300Regular13,
  //                       ),
  //                       Row(
  //                         children: [
  //                           Text(
  //                             '${_clientEmailCtrl.text}',
  //                             style: AppTextStyle.blackRegular16,
  //                           ),
  //                         ],
  //                       )
  //                     ],
  //                   ),
  //                 )
  //               : Container(),
  //           const Spacer(),
  //           CustomButton(
  //               onPressed: () {
  //                 setState(() {
  //                   _step = 3;
  //                 });
  //               },
  //               text: 'Schedule'),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget clientTileList() {
    return Expanded(
      child: ListView.builder(
          itemCount: 5,
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
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  height: MediaQuery.of(context).size.height * .14,
                  decoration: const BoxDecoration(
                      color: AppColors.kPureWhite,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Client Name',
                                    style: AppTextStyle.blackBold14),
                                const SizedBox(width: 8),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Company Name',
                              style: AppTextStyle.grey300Regular12,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Project',
                              style: AppTextStyle.grey300Regular10,
                            )
                          ],
                        ),
                      ]),
                ),
              ),
            );
          }),
    );
  }

  Widget developerTileList() {
    return Expanded(
      child: ListView.builder(
          itemCount: 5,
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
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  height: MediaQuery.of(context).size.height * .14,
                  decoration: const BoxDecoration(
                      color: AppColors.kPureWhite,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Developer Name',
                                    style: AppTextStyle.blackBold14),
                                const SizedBox(width: 8),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Company Name',
                              style: AppTextStyle.grey300Regular12,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Project',
                              style: AppTextStyle.grey300Regular10,
                            )
                          ],
                        ),
                      ]),
                ),
              ),
            );
          }),
    );
  }

  String formatTimeOfDay(DateTime tod) {
    final now = new DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm(); //"6:00 AM"
    return format.format(dt);
  }
}
