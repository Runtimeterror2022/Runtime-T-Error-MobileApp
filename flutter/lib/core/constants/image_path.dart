import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();

abstract class ImagePath {
  static const String googleIcon = 'assets/google-icon.svg';
  static const String scheduleLottieIcon = 'assets/lottie/video_call.json';
  static const String appLogo = 'assets/app-logo.svg';
  static const String userIcon = 'assets/profile.svg';
  static const String scheduleMeetingIcon =
      'assets/bottom_navigation_bar/schedule_meeting_icon.svg';
  static const String developerIcon =
      'assets/bottom_navigation_bar/developer_icon.svg';
  static const String clientIcon =
      'assets/bottom_navigation_bar/client_icon.svg';
  static const String dashBoardIcon =
      'assets/bottom_navigation_bar/Dashboard_icon.svg';
}
