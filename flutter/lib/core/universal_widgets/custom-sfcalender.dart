// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:table_calendar/table_calendar.dart';
// import '../../features/prospect-Information/presentation/controller/prospect_controller.dart';
// import '../Responsive/SizeConfig.dart';
// import '../constants/app-text-style.dart';
// import '../constants/app_color.dart';
//
// class SfCalender extends StatefulWidget {
//    const SfCalender({Key? key}) : super(key: key);
//
//   @override
//   State<SfCalender> createState() => _SfCalenderState();
// }
//
// class _SfCalenderState extends State<SfCalender> {
//   final ProspectController prospectController=Get.find();
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           children: [
//             Text(
//               'Date',
//               style: AppTextStyle.normalGreyTTCommon400.copyWith(
//                 fontSize: 18 * SizeConfig.textMultiplier!,
//                 fontWeight: FontWeight.w400,
//                 color: grey128,
//               ),
//             ),
//             const Spacer(),
//             Text(
//             DateFormat("EEE").format(DateTime.parse(prospectController.scheduledDate.toString()))+", "+ DateFormat("dd MMM yyyy").format(DateTime.parse(prospectController.scheduledDate.toString())) ,
//               style: AppTextStyle.normalGreyTTCommon400.copyWith(
//                 fontSize: 18 * SizeConfig.textMultiplier!,
//                 fontWeight: FontWeight.w400,
//                 color: grey62,
//               ),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: 10 * SizeConfig.heightMultiplier!,
//         ),
//             TableCalendar(
//               firstDay: DateTime.now(),
//               lastDay: DateTime.now().add(const Duration(days: 31)),
//               focusedDay: prospectController.scheduledDate.value,
//               currentDay: prospectController.scheduledDate.value,
//               calendarFormat: CalendarFormat.month,
//               startingDayOfWeek: StartingDayOfWeek.monday,
//               daysOfWeekHeight: 40.0,
//               weekendDays: const [DateTime.sunday,7],
//               onDaySelected: (_selectedDay, _focusedDay) {
//                 if(_selectedDay.weekday!=DateTime.sunday ){
//                   setState(() {
//                     prospectController.scheduledDate.value=  _selectedDay ;
//                     prospectController.scheduledDate.value = _focusedDay; // update `_focusedDay` here as well
//                   });
//                 }
//               },
//               // Calendar Dates styling
//               calendarStyle:  CalendarStyle(
//                 outsideTextStyle: AppTextStyle.normalGreyTTCommon400.copyWith(
//                   fontSize: 16 * SizeConfig.textMultiplier!,
//                   fontWeight: FontWeight.w400,
//                   color: white238,
//                 ),
//                 weekendTextStyle: AppTextStyle.normalGreyTTCommon400.copyWith(
//                   fontSize: 16 * SizeConfig.textMultiplier!,
//                   fontWeight: FontWeight.w400,
//                   color: grey,
//                 ),
//                 todayDecoration: const BoxDecoration(
//                   color: yellow252,
//                   shape: BoxShape.circle,
//                 ),
//               ),
//               headerStyle:  HeaderStyle(
//                 leftChevronPadding: EdgeInsets.only(left: 5* SizeConfig.widthMultiplier!),
//                 rightChevronPadding: EdgeInsets.only(left: 5* SizeConfig.widthMultiplier!),
//                 leftChevronMargin: EdgeInsets.zero,
//                 rightChevronMargin: EdgeInsets.zero,
//                 formatButtonVisible: false,
//                 titleCentered: true,
//                 titleTextStyle:
//                 AppTextStyle.normalGreyTTCommon400.copyWith(
//                   fontSize: 16 * SizeConfig.textMultiplier!,
//                   fontWeight: FontWeight.w400,
//                   color: grey62,
//                 ),
//                 leftChevronIcon: Icon(
//                   Icons.chevron_left,
//                   color: grey128,
//                   size: 32 * SizeConfig.imageSizeMultiplier!,
//                 ),
//                 rightChevronIcon: Icon(
//                   Icons.chevron_right,
//                   color: grey128,
//                   size: 32 * SizeConfig.imageSizeMultiplier!,
//                 ),
//               ),
//             ),
//         Divider(
//           thickness: 1 * SizeConfig.heightMultiplier!,
//           color: white238,
//         )
//       ],
//     );
//
//   }
// }
