import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mvc_bolierplate_getx/core/common_widgets/client_info_card.dart';
import 'package:mvc_bolierplate_getx/core/constants/app_text_style.dart';
import 'package:mvc_bolierplate_getx/core/constants/color_palette.dart';
import 'package:mvc_bolierplate_getx/core/constants/image_path.dart';
import 'package:mvc_bolierplate_getx/feature/client_screen/controller/client_list_controller.dart';
import 'package:mvc_bolierplate_getx/feature/developer_profile/view/developer_profile.dart';

class ClientsListScreen extends StatefulWidget {
  const ClientsListScreen({Key? key}) : super(key: key);

  @override
  State<ClientsListScreen> createState() => _ClientsListScreenState();
}

class _ClientsListScreenState extends State<ClientsListScreen> {
  final ClientController _clientController = Get.put(ClientController());

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
            Obx(
              () => _clientController.isAllClientListLoading.value
                  ? const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: _clientController.allClientList.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ClientInfoCard(
                            name: _clientController
                                .allClientList.data![index].cilentName!,
                            clientEmail: _clientController
                                .allClientList.data![index].projectId!,
                            companyName: _clientController
                                .allClientList.data![index].cilentEmail!,
                            hasDeveloper: false,
                            developerName: "Kashif",
                            developerTech: "Flutter Developer",
                            onPressed: () {},
                          );
                        },
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
