import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvc_bolierplate_getx/core/constants/app_text_style.dart';
import 'package:mvc_bolierplate_getx/core/constants/color_palette.dart';
import 'package:mvc_bolierplate_getx/core/constants/image_path.dart';
import 'package:mvc_bolierplate_getx/core/reponsive/SizeConfig.dart';

class ScheduledCallsUI extends StatelessWidget {
  const ScheduledCallsUI({
    required this.clientName,
    required this.techStack,
    required this.developerName,
    required this.ProjectName,
    required this.callInitiated,
    required this.isClient,
    this.alreadyInteracted,
    this.projectName,
    this.onPressed,
    Key? key,
  }) : super(key: key);
  final String clientName;
  final String techStack;
  final String developerName;
  final String ProjectName;
  final bool callInitiated;
  final bool? alreadyInteracted;
  final bool isClient;
  final String? projectName;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: 10 * SizeConfig.widthMultiplier!,
          vertical: 5 * SizeConfig.heightMultiplier!),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))))),
        onPressed: onPressed,
        child: Container(
          padding: const EdgeInsets.all(16),
          height: MediaQuery.of(context).size.height * .17,
          decoration: const BoxDecoration(
              color: AppColors.kPureWhite,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(ImagePath.userIcon),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(clientName, style: AppTextStyle.blackBold14),
                          const SizedBox(width: 8),
                          (callInitiated == true)
                              ? Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: AppColors.kactiveBackground,
                                      border: Border.all(
                                        color: AppColors.ktransparent,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8))),
                                  child: Text(
                                    isClient ? 'Initiated' : 'Available',
                                    style: AppTextStyle.activeregular10,
                                  ),
                                )
                              : Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: isClient
                                          ? AppColors.kYellow.withOpacity(0.2)
                                          : AppColors.kinActiveBackground,
                                      border: Border.all(
                                        color: AppColors.ktransparent,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8))),
                                  child: Text(
                                    isClient ? 'Pending' : 'Engaged',
                                    style: AppTextStyle.inActiveregular10
                                        .copyWith(
                                            color: isClient
                                                ? AppColors.kYellow
                                                : null),
                                  ),
                                ),
                          if (alreadyInteracted == true)
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: AppColors.kYellow,
                                  border: Border.all(
                                    color: AppColors.ktransparent,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8))),
                              child: Text(
                                'Interacted',
                                style: AppTextStyle.activeregular10,
                              ),
                            )
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        ProjectName,
                        style: AppTextStyle.grey300Regular12
                            .copyWith(fontSize: 12),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5 * SizeConfig.heightMultiplier!),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(color: Colors.grey.shade50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(developerName,
                                style: AppTextStyle.blackBold14
                                    .copyWith(fontSize: 14)),
                            const SizedBox(height: 4),
                            Text(
                              'Tech Stack - $techStack',
                              style: AppTextStyle.grey300Regular10
                                  .copyWith(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
