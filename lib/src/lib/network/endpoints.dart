class Endpoints {
  // ignore: constant_identifier_names

  //BaseURLs
  // ignore: constant_identifier_names
  static const String BASE_URL = 'http://159.89.234.66:8912/api'; //DEV
  static const BANNER_IMAGE_BASE_URL =
      'http://159.89.234.66:8912/banner/'; //DEV IMAGE

  static const String LOGIN = BASE_URL + '/users/login?include=user';
  static const String SEND_OTP = BASE_URL + '/users/login-code';
  static const String RESEND_OTP = BASE_URL + '/users/resend-otp';
  static const String VERIFY_OTP = BASE_URL + '/users/mobile-login';
  static const String DELETE_ACCOUNT = BASE_URL + '/users';
  static const String RESET_USER_PASSWORD = BASE_URL + '/users/reset-password';
  static const String CHANGE_USER_PASSWORD = BASE_URL + '/users/change-password';
  static const String GET_USER = BASE_URL + '/users';
  static const String UPDATE_USER = BASE_URL + '/users';

  static const String FORGOT_PASSWORD = BASE_URL + '/users/forgot-password';
  static const String VERIFY_CODE = BASE_URL + '/users/email-otp-validation';
  static const String CONTACT_US = BASE_URL + '/users/contact-support';
  

  //DEV IMAGE

  static const String SIGNUP = BASE_URL + '/users';
  // static const String BASE_URL = ''; //QA
  // static const String MEDIA_BASE_URL = ''; //QA IMAGE

  // static const String BASE_URL = ''; //PROD
}
