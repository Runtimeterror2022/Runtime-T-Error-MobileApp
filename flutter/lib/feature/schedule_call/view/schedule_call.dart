import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mvc_bolierplate_getx/core/constants/app_text_style.dart';
import 'package:mvc_bolierplate_getx/core/constants/color_palette.dart';
import 'package:mvc_bolierplate_getx/core/constants/image_path.dart';
import 'package:mvc_bolierplate_getx/feature/schedule_call/view/call_stepper.dart';

class ScheduleCall extends StatefulWidget {
  const ScheduleCall({Key? key}) : super(key: key);

  @override
  State<ScheduleCall> createState() => _ScheduleCallState();
}

class _ScheduleCallState extends State<ScheduleCall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          'Schedule Call',
          style: AppTextStyle.titleBlackMedium18,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: 250,
                  child: Lottie.asset(ImagePath.scheduleLottieIcon)),
            ],
          ),
          Container(
            child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.kButtonColor,
                  primary: AppColors.kPureWhite,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CallStepper()),
                  );
                },
                child: const Text('Click here to schedule call')),
          ),
        ],
      ),
    );
  }
}
