import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_bolierplate_getx/core/common_widgets/info_card_ui.dart';
import 'package:mvc_bolierplate_getx/core/constants/app_text_style.dart';
import 'package:mvc_bolierplate_getx/core/constants/color_palette.dart';
import 'package:mvc_bolierplate_getx/core/reponsive/SizeConfig.dart';
import 'package:mvc_bolierplate_getx/feature/bottom_navigation_bar/view/bottom_navigation_bar_screen.dart';

class ClientInfoCard extends StatelessWidget {
  const ClientInfoCard(
      {required this.name,
      required this.projectName,
      required this.companyName,
      required this.hasDeveloper,
      this.alreadyInteracted,
      this.onPressed,
      this.developerTech,
      this.developerName,
      Key? key})
      : super(key: key);

  final String name;
  final String projectName;
  final String companyName;
  final String? developerTech;
  final String? developerName;
  final bool hasDeveloper;
  final bool? alreadyInteracted;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10 * SizeConfig.heightMultiplier!),
      child: Stack(
        children: [
          if (hasDeveloper)
            Padding(
              padding: EdgeInsets.only(top: 100 * SizeConfig.heightMultiplier!),
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 10 * SizeConfig.widthMultiplier!,
                ),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: AppColors.kgrey50.withOpacity(0.1),
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10 * SizeConfig.heightMultiplier!,
                    ),
                    Text('Developer',
                        style: AppTextStyle.blackBold14.copyWith(
                            fontSize: 12 * SizeConfig.textMultiplier!)),
                    SizedBox(
                      height: 5 * SizeConfig.heightMultiplier!,
                    ),
                    Row(
                      children: [
                        Text(developerName ?? '',
                            style: AppTextStyle.blackBold14.copyWith(
                                fontSize: 11 * SizeConfig.textMultiplier!)),
                        Spacer(),
                        Text(
                          developerTech ?? '',
                          style: AppTextStyle.grey300Regular10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          DeveloperInfoCard(
            name: name,
            experience: null,
            projectName: projectName,
            techStack: companyName,
            isAvailable: hasDeveloper,
            isClient: true,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
