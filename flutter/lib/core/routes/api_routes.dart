class ApiUrl {
  static String liveBaseURL = 'http://e80b-122-161-92-249.ngrok.io/';
  static String signIn = '${liveBaseURL}accounts/login';

  static String getAllDevelopers = '${liveBaseURL}accounts/get/developer';
  static String scheduleCall = '${liveBaseURL}accounts/post/schedule/meeting';
  static String getAllClient = '${liveBaseURL}accounts/get/cilent';
  static String getAllScheduleCalls =
      '${liveBaseURL}accounts/get/schedule/meeting';
}
