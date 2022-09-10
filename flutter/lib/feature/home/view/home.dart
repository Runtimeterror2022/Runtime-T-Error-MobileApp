import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvc_bolierplate_getx/core/common_widgets/info_card_ui.dart';
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
        backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
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
                  return DeveloperInfoCard(
                    name: _employee[index]['name'],
                    experience: _employee[index]['experience'],
                    techStack: _employee[index]['tech_stack'],
                    isAvailable: _employee[index]['isAvailable'],
                    isClient: false,
                    onPressed: () {
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
