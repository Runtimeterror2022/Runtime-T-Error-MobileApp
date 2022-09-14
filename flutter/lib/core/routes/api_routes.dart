class ApiUrl {
  static String liveBaseURL = 'http://e31f-103-119-165-26.ngrok.io/';
  static String signIn = '${liveBaseURL}accounts/login';

  static String getAllDevelopers = '${liveBaseURL}accounts/get/developer';
  static String getAllScheduleCalls =
      '${liveBaseURL}accounts/get/schedule/meeting';
}
