import 'package:flutter/material.dart';
import 'package:mvc_bolierplate_getx/core/constants/app_text_style.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          'Settings',
          style: AppTextStyle.titleBlackMedium18,
        ),
      ),
      body: Container(
        child: const Center(child: Text('Coming Soon')),
      ),
    );
  }
}
