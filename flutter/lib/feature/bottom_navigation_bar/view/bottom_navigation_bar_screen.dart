import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mvc_bolierplate_getx/core/constants/image_path.dart';
import 'package:mvc_bolierplate_getx/core/reponsive/SizeConfig.dart';
import 'package:mvc_bolierplate_getx/feature/client_screen/view/clients_list_screen.dart';
import 'package:mvc_bolierplate_getx/feature/home/view/home.dart';
import 'package:mvc_bolierplate_getx/feature/log_in/view/login_screen.dart';

TabController? homeTabController;

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar();
  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar>
    with SingleTickerProviderStateMixin {
  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
        icon: SvgPicture.asset(ImagePath.dashBoardIcon,
            color: selectedPageIndex == 0
                ? const Color(0xff223DC1)
                : const Color(0xffD8D2E4)),
        label: "",
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(ImagePath.clientIcon,
            color: selectedPageIndex == 1
                ? const Color(0xff223DC1).withOpacity(1.0)
                : const Color(0xffD8D2E4)),
        label: "",
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(ImagePath.developerIcon,
            color: selectedPageIndex == 2
                ? const Color(0xff223DC1).withOpacity(1.0)
                : const Color(0xffD8D2E4)),
        label: "",
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          ImagePath.scheduleMeetingIcon,
          color: selectedPageIndex == 3
              ? const Color(0xff223DC1)
              : const Color(0xffD8D2E4),
        ),
        label: "",
      ),
    ];
  }

  final pageController = PageController(initialPage: 0, keepPage: true);
  int selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: WillPopScope(
            onWillPop: () async {
              return true;
            },
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              //list of pages to navigate through bottom navigation bar
              children: const [HomePage(), ClientsListScreen()],
            )),
        bottomNavigationBar: Container(
          height: 64 * SizeConfig.heightMultiplier!,
          child: Theme(
            data: ThemeData(
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent),
            child: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              backgroundColor: Colors.black,
              type: BottomNavigationBarType.fixed,
              currentIndex: selectedPageIndex,
              unselectedItemColor: Colors.white,
              items: buildBottomNavBarItems(),
              onTap: (index) {
                setState(() {
                  selectedPageIndex = index;
                });
                pageController.jumpToPage(index);
              },
              selectedIconTheme: const IconThemeData(
                color: Colors.blue,
              ),
              selectedLabelStyle: const TextStyle(color: Colors.blue),
              selectedItemColor: Colors.blue,
            ),
          ),
        ));
  }
}
