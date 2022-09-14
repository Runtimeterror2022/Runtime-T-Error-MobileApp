
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/image_path.dart';
import '../../../core/reponsive/SizeConfig.dart';
import '../../bottom_navigation_bar/view/bottom_navigation_bar_screen.dart';
import '../../home/view/home.dart';
import 'login_screen.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({Key? key}) : super(key: key);

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {


  Future<bool> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final jwt =  prefs.containsKey("token");
    return jwt;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 500), () async{
        final userAlreadyLoggedIn = await checkLoginStatus();
        if(!userAlreadyLoggedIn){
          await Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
              LoginScreen()), (Route<dynamic> route) => false);
        } else{
          await Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
              const CustomBottomNavigationBar()), (Route<dynamic> route) => false);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              child: SvgPicture.asset(
                ImagePath.appLogo,
                width: 150 * SizeConfig.widthMultiplier!,
                height: 150 * SizeConfig.heightMultiplier!,
              ),
            ),
          ),
        ],
      ),
    );
  }
}