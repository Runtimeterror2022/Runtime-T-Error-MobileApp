import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvc_bolierplate_getx/core/constants/app_text_style.dart';
import 'package:mvc_bolierplate_getx/core/constants/color_palette.dart';
import 'package:mvc_bolierplate_getx/core/constants/image_path.dart';
import 'package:mvc_bolierplate_getx/core/routes/app_routes.dart';
import 'package:mvc_bolierplate_getx/feature/developer_profile/view/developer_profile.dart';

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
      'experience': '3',
      'tech_stack': 'Flutter Developer',
      'isAvailable': true,
    },
    {
      'name': 'Divya Gupta',
      'experience': '2',
      'tech_stack': 'Python Developer',
      'isAvailable': false,
    },
    {
      'name': 'Kashif Ahmad',
      'experience': '2.5',
      'tech_stack': 'Flutter Developer',
      'isAvailable': false,
    },
    {
      'name': 'Rana Atul',
      'experience': '4',
      'tech_stack': 'Python Developer',
      'isAvailable': true,
    },
    {
      'name': 'Aditya Arya',
      'experience': '6',
      'tech_stack': 'Software Developer',
      'isAvailable': false,
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Dashboard',
            style: AppTextStyle.titleBlackMedium18,
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: TextField(
                controller: _searchCtrl,
                decoration: const InputDecoration(
                    labelText: 'Search', prefixIcon: Icon(Icons.search)),
              ),
            ),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: _employee.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DeveloperProfileScreen(
                                  _employee[index]['name'],
                                  _employee[index]['tech_stack'],
                                  _employee[index]['experience'],
                                )),
                      );
                    },
                    child: employeeCard(
                      _employee[index]['name'],
                      _employee[index]['experience'],
                      _employee[index]['tech_stack'],
                      _employee[index]['isAvailable'],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ignore: prefer_expression_function_bodies
  Widget employeeCard(
      String name, String experience, String techStack, bool isAvailable) {
    return Container(
      height: MediaQuery.of(context).size.height * .14,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
          color: Colors.white,
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
                    (isAvailable)
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
