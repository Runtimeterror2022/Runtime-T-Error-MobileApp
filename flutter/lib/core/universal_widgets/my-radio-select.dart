import 'package:flutter/material.dart';

import '../constants/app_text_style.dart';
import '../constants/color_palette.dart';
import '../reponsive/SizeConfig.dart';

class MyRadioSelect extends StatelessWidget {
  MyRadioSelect({
    Key? key,
    required this.radiovalue,
    required this.groupValue,
    required this.onChanged,
    required this.radioTitle,
  }) : super(key: key);
  final String radioTitle;
  final String radiovalue;
  final String groupValue;
  Function(String? val) onChanged;

  @override
  Widget build(BuildContext context) => Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Transform.scale(
          scale: 1.5 * SizeConfig.textMultiplier!,
          child: Theme(
            data: ThemeData(
              unselectedWidgetColor: Theme.of(context).primaryColor,
            ),
            child: Radio(
              value: radiovalue,
              groupValue: groupValue,
              activeColor: grey,
              onChanged: (String? value) {
                onChanged(value);
              },
            ),
          )
        ),
        Text(
          radioTitle,
          style: AppTextStyle1.normalGreyTTCommon400.copyWith(
            fontSize: 18 * SizeConfig.textMultiplier!,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
}
