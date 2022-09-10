import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvc_bolierplate_getx/core/constants/app_text_style.dart';
import 'package:mvc_bolierplate_getx/core/constants/color_palette.dart';
import 'package:mvc_bolierplate_getx/core/constants/image_path.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchCtrl = TextEditingController();
  final List<Map<String, dynamic>> _employee = [
    {
      'name': 'Himank Maheshwari',
      'experience': '3.0',
      'tech_stack': 'Flutter Developer',
      'isAvailable': 'true',
    },
    {
      'name': 'Divya Gupta',
      'experience': '2.0',
      'tech_stack': 'Python Developer',
      'isAvailable': 'false',
    },
    {
      'name': 'Kashif Ahmad',
      'experience': '2.5',
      'tech_stack': 'Flutter Developer',
      'isAvailable': 'false',
    },
    {
      'name': 'Rana Atul',
      'experience': '4.0',
      'tech_stack': 'Python Developer',
      'isAvailable': 'true',
    },
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          title: Text(
            'Employee',
            style: AppTextStyle.titleBlackMedium18,
          ),
          actions: const []),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .02,
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: TextField(
              controller: _searchCtrl,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.kborder),
                ),
                labelText: 'Search',
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: _employee.length,
              itemBuilder: (BuildContext context, int index) {
                return employeeCard(
                  _employee[index]['name'],
                  _employee[index]['experience'],
                  _employee[index]['tech_stack'],
                  _employee[index]['isAvailable'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // ignore: prefer_expression_function_bodies
  Widget employeeCard(
      String name, String experience, String techStack, String isAvailable) {
    return Container(
      height: MediaQuery.of(context).size.height * .14,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.kborder,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(8))),
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
                    (isAvailable == 'true')
                        ? Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: AppColors.kactiveBackground,
                                border: Border.all(
                                  color: AppColors.ktransparent,
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8))),
                            child: Text(
                              'Available',
                              style: AppTextStyle.activeregular10,
                            ),
                          )
                        : Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: AppColors.kinActiveBackground,
                                border: Border.all(
                                  color: AppColors.ktransparent,
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8))),
                            child: Text(
                              'Engaged',
                              style: AppTextStyle.inActiveregular10,
                            ),
                          ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  techStack,
                  style: AppTextStyle.grey300Regular12,
                ),
                const SizedBox(height: 4),
                Text(
                  'Experience - $experience Years',
                  style: AppTextStyle.grey300Regular10,
                ),
              ],
            ),
            const Spacer(),
            const Icon(
              Icons.more_vert,
              color: AppColors.kgrey50,
            )
          ]),
    );
  }
}
