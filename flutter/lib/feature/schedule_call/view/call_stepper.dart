import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvc_bolierplate_getx/core/constants/app_text_style.dart';
import 'package:mvc_bolierplate_getx/core/constants/color_palette.dart';
import 'package:mvc_bolierplate_getx/core/constants/image_path.dart';
import 'package:mvc_bolierplate_getx/core/reponsive/SizeConfig.dart';

class CallStepper extends StatefulWidget {
  const CallStepper({Key? key}) : super(key: key);

  @override
  State<CallStepper> createState() => _CallStepperState();
}

class _CallStepperState extends State<CallStepper> {
  int _step = 0;
  final List<String> _stepper = [
    'Developer',
    'Client',
    // 'Select Date',
    // 'Finish'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        title: Text(
          'Here we go',
          style: AppTextStyle.titleBlackMedium18,
        ),
      ),
      body: Column(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .03,
        ),
        Container(
          color: Colors.grey.shade100,
          height: MediaQuery.of(context).size.height * .1,
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: _stepper.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      _step = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: AppColors.kPureWhite,
                        border: Border.all(color: AppColors.ktransparent),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Center(
                          child: Text(
                        _stepper[index],
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      )),
                    ),
                  ),
                );
              }),
        ),
        customStepper()!
      ]),
    );
  }

  Widget? customStepper() {
    switch (_step) {
      case 0:
        return developerClientTileList('Client Name');
      case 1:
        return developerClientTileList('Developer Name');
      // case 2:
      //   // do something else
      //   break;
      // case 3:
      //   // do something else
      //   break;
      default:
        return const CupertinoActivityIndicator();
    }
  }

  Widget developerClientTileList(
    String name,
  ) {
    return Expanded(
      child: ListView.builder(itemBuilder: (BuildContext context, int index) {
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
            onPressed: () {},
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
                          ],
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Company Name',
                          style: AppTextStyle.grey300Regular12,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Project',
                          style: AppTextStyle.grey300Regular10,
                        )
                      ],
                    ),
                  ]),
            ),
          ),
        );
      }),
    );
  }
}
