// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
//
// import '../Responsive/SizeConfig.dart';
// import '../constants/app-text-style.dart';
//
// class LoadingWidget extends StatelessWidget {
//   final String? loadingMessage;
//   const LoadingWidget({Key? key, this.loadingMessage}) : super(key: key);
//
//   get grey128 => null;
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             width: 160 * SizeConfig.widthMultiplier!,
//             height: 160 * SizeConfig.heightMultiplier!,
//             padding: EdgeInsets.all(32 * SizeConfig.widthMultiplier!),
//             child: Center(
//               child: Lottie.asset(
//                 'assets/images/loading-lottie.json',
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 16 * SizeConfig.heightMultiplier!,
//           ),
//           Text(
//             loadingMessage ?? "Loading modules...",
//             style: AppTextStyle.normalGreyTTCommon400.copyWith(
//               fontSize: 16 * SizeConfig.textMultiplier!,
//               fontWeight: FontWeight.w400,
//               color: grey128,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
