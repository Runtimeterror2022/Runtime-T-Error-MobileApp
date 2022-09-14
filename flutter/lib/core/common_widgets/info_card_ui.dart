import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvc_bolierplate_getx/core/constants/app_text_style.dart';
import 'package:mvc_bolierplate_getx/core/constants/color_palette.dart';
import 'package:mvc_bolierplate_getx/core/constants/image_path.dart';
import 'package:mvc_bolierplate_getx/core/reponsive/SizeConfig.dart';

class DeveloperInfoCard extends StatelessWidget {
  const DeveloperInfoCard({
    required this.name,
    required this.experience,
    required this.techStack,
    required this.isAvailable,
    required this.isClient,
    this.alreadyInteracted,
    this.projectName,
    this.onPressed,
    Key? key,
  }) : super(key: key);
  final String name;
  final String? experience;
  final String techStack;
  final bool isAvailable;
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
                        Text(name, style: AppTextStyle.blackBold14),
                        const SizedBox(width: 8),
                        (isAvailable == true)
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
                                  isClient ? 'Enrolled' : 'Available',
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
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8))),
                            child: Text(
                              'Interacted',
                              style: AppTextStyle.activeregular10,
                            ),
                          )
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      techStack,
                      style: AppTextStyle.grey300Regular12,
                    ),
                    const SizedBox(height: 4),
                    isClient
                        ? Text(
                            'Email - $projectName',
                            style: AppTextStyle.grey300Regular10,
                          )
                        : Text(
                            'Experience - $experience Years',
                            style: AppTextStyle.grey300Regular10,
                          ),
                  ],
                ),
              ]),
        ),
      ),
    );
  }

  // Widget callTabView() {
  //   return SizedBox(
  //     height: 200,
  //     child: Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: const [
  //           Text('GeeksforGeeks'),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
