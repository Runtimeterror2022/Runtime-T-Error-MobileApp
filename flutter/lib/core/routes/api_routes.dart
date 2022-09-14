class ApiUrl {
  static String liveBaseURL = 'http://c5b3-49-249-44-114.ngrok.io/';
  static String signIn = '${liveBaseURL}accounts/login';

  static String getAllDevelopers = '${liveBaseURL}accounts/get/developer';
  static String getAllClient = '${liveBaseURL}accounts/get/cilent';
  static String getAllScheduleCalls =
      '${liveBaseURL}accounts/get/schedule/meeting';
}
