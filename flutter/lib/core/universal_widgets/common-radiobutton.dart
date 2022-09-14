import 'package:flutter/material.dart';

import '../constants/app_text_style.dart';
import '../constants/color_palette.dart';
import '../reponsive/SizeConfig.dart';


class RadioButton extends StatelessWidget {
  final String? groupValue;
  final String? radioTitle;
  final String value;
  final void Function(String?)? onChanged;
  const RadioButton({Key? key,
 required this.groupValue,
 required this.onChanged,
  required this.value,
  required this.radioTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        radioTitle.toString(),
        style: AppTextStyle1.normalGreyTTCommon400.copyWith(
          fontSize: 18 * SizeConfig.textMultiplier!,
          fontWeight: FontWeight.w500,
          color: grey62,
        ),
      ),
      horizontalTitleGap: 0 * SizeConfig.widthMultiplier!,
      leading: Transform.scale(
        scale: 1.2,
        child: Radio<String>(
            activeColor: grey62,
            value: value,
            groupValue: groupValue,
            onChanged: (v){
              onChanged!(v);
            }),
      ),
    );
  }
}
