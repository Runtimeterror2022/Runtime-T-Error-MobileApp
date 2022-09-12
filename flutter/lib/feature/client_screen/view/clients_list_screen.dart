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
  final List<Map<String, dynamic>> _developer = [
    {'developer': 'Aditya Arya ', 'tech_stack': 'Flutter Developer'},
    {'developer': 'Kashif Ahmad ', 'tech_stack': 'Flutter Developer'},
    {'developer': 'Himank Maheshwari', 'tech_stack': 'Flutter Developer'},
    {'developer': 'Sagar Singh ', 'tech_stack': 'Django Developer'},
    {'developer': 'Kashif Ahmad ', 'tech_stack': 'Flutter Developer'},
  ];

  final List<Map<String, dynamic>> _employee = [
    {
      'name': 'Cristian Bodonarasec',
      'experience': 'Coligomed ',
      'tech_stack': 'Coligomed Co. Ltd',
      'isAvailable': true,
    },
    {
      'name': 'Rajiv Dalal',
      'experience': 'Virality',
      'tech_stack': 'Virality Co Ltd.',
      'isAvailable': false,
    },
    {
      'name': 'Raja Jain',
      'experience': 'Transact Co Ltd.',
      'tech_stack': 'Transact',
      'isAvailable': false,
    },
    {
      'name': 'Victor Lai',
      'experience': 'Fitbasix Co Ltd.',
      'tech_stack': 'Fitbasix',
      'isAvailable': true,
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
          automaticallyImplyLeading: false,
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
                    developerName: _developer[index]['developer'],
                    developerTech: _developer[index]['tech_stack'],
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
