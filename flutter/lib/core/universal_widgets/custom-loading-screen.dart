// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:pams_varification/core/Responsive/SizeConfig.dart';
// import 'package:pams_varification/core/constants/app-text-style.dart';
//
// import '../constants/app_color.dart';
//
// class CustomLoadingScreen extends StatelessWidget {
//   const CustomLoadingScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               width: 160 * SizeConfig.widthMultiplier!,
//               height: 160 * SizeConfig.heightMultiplier!,
//              padding: EdgeInsets.all(32* SizeConfig.widthMultiplier!),
//               child: Center(
//                 child: Lottie.asset(
//                   'assets/images/loading-lottie.json',
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 16 * SizeConfig.heightMultiplier!,
//             ),
//             Text("Loading modules...",
//               style: AppTextStyle.normalGreyTTCommon400.copyWith(
//               fontSize: 16 * SizeConfig.textMultiplier!,
//               fontWeight: FontWeight.w400,
//               color: grey128,
//             ),)
//           ],
//         ),
//       ),
//     );
//   }
// }
