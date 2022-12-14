import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:mvc_bolierplate_getx/core/common_widgets/info_card_ui.dart';
import 'package:mvc_bolierplate_getx/core/constants/app_text_style.dart';
import 'package:mvc_bolierplate_getx/feature/developer_profile/view/developer_profile.dart';
import 'package:mvc_bolierplate_getx/feature/home/controller/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchCtrl = TextEditingController();
  final HomeController _homeController = Get.put(HomeController());
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
        backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
            Obx(
              () => _homeController.isAllDeveloperLoading.value
                  ? const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  // : Expanded(
                  //     child: ListView.builder(
                  //       physics: const BouncingScrollPhysics(),
                  //       itemCount: _employee.length,
                  //       itemBuilder: (BuildContext context, int index) {
                  //         return DeveloperInfoCard(
                  //           name: _employee[index]['name'],
                  //           experience: _employee[index]['experience'],
                  //           techStack: _employee[index]['tech_stack'],
                  //           isAvailable: _employee[index]['isAvailable'],
                  //           isClient: false,
                  //           onPressed: () {
                  //             Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                   builder: (context) =>
                  //                       DeveloperProfileScreen(
                  //                         _employee[index]['name'],
                  //                         _employee[index]['tech_stack'],
                  //                         _employee[index]['experience'],
                  //                       )),
                  //             );
                  //           },
                  //         );
                  //       },
                  //     ),
                  //   ),
                  : Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: _homeController.allDevelopers.length,
                        itemBuilder: (BuildContext context, int index) {
                          return DeveloperInfoCard(
                            name: _homeController
                                .allDevelopers[index].developerName!,
                            experience: _homeController
                                .allDevelopers[index].yearOfExperience!
                                .toString(),
                            techStack: _homeController
                                .allDevelopers[index].techStack
                                .toString()
                                .replaceAll('[', '')
                                .replaceAll(']', ''),
                            isAvailable:
                                _homeController.allDevelopers[index].isEngaged!,
                            isClient: false,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DeveloperProfileScreen(
                                          name: _homeController
                                              .allDevelopers[index]
                                              .developerName!,
                                          experience: _homeController
                                              .allDevelopers[index]
                                              .yearOfExperience!
                                              .toString(),
                                          techStack: _homeController
                                              .allDevelopers[index].techStack
                                              .toString()
                                              .replaceAll('[', '')
                                              .replaceAll(']', ''),
                                          joiningDate: _homeController
                                                  .allDevelopers[index]
                                                  .dateJoined ??
                                              DateTime.now(),
                                          companyId: _homeController
                                                  .allDevelopers[index]
                                                  .companyId ??
                                              '',
                                          inductionComment: _homeController
                                                  .allDevelopers[index]
                                                  .inductionComment ??
                                              '',
                                          developerId: _homeController
                                                  .allDevelopers[index].id ??
                                              '',
                                        )),
                              );
                            },
                          );
                        },
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
