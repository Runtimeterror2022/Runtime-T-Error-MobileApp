import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvc_bolierplate_getx/core/common_widgets/client_info_card.dart';
import 'package:mvc_bolierplate_getx/core/constants/app_text_style.dart';
import 'package:mvc_bolierplate_getx/core/constants/color_palette.dart';
import 'package:mvc_bolierplate_getx/core/constants/image_path.dart';
import 'package:mvc_bolierplate_getx/feature/developer_profile/view/developer_profile.dart';

class ClientsListScreen extends StatefulWidget {
  const ClientsListScreen({Key? key}) : super(key: key);

  @override
  State<ClientsListScreen> createState() => _ClientsListScreenState();
}

class _ClientsListScreenState extends State<ClientsListScreen> {
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

  // Initial Selected Value
  String dropdownvalue = 'Previous Calls';

  // List of items in our dropdown menu
  var items = [
    'Previous Calls',
    'Upcoming Calls',
    'Item 3',
    'Item 4',
    'Item 5',
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
            'Clients',
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
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: _employee.length,
                itemBuilder: (BuildContext context, int index) {
                  return ClientInfoCard(
                    name: _employee[index]['name'],
                    projectName: _employee[index]['experience'],
                    companyName: _employee[index]['tech_stack'],
                    hasDeveloper: _employee[index]['isAvailable'],
                    developerName: "Himank bro",
                    developerTech: "flutter",
                    onPressed: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
