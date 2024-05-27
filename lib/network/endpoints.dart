// ignore_for_file: constant_identifier_names, prefer_interpolation_to_compose_strings
class Endpoints {
  //BaseURLs
  // static const String BASE_URL = 'http://159.89.234.66:8916/api'; //DEV
  static const String BASE_URL = 'http://159.89.234.66:8919/api'; //qa
 
  static const String TANDC_URL =
      'http://159.89.234.66:8913/terms-and-conditions';
  static const String SAFETY_URL = 'http://159.89.234.66:8913/safety';
  static const String MEDIA_BASE_URL =
      BASE_URL+'/uploads/avatar.png'; //DEV IMAGE

 
  static const String UPLOAD_IMAGE = BASE_URL;

  static const String LOGIN = BASE_URL + '/users/login?include=user';
  static const String SEND_OTP = BASE_URL + '/v1/user/number-verification';
  static const String RESEND_OTP = BASE_URL + '/v1/user/otp-resend';
  static const String VERIFY_OTP = BASE_URL + '/v1/user/otp-verification';
  static const String SELECT_DONOR_TYPE = BASE_URL + '/v1/user/select-donor-type';
  
  static const String DELETE_ACCOUNT = BASE_URL + '/v1/user/delete-account';
  static const String DELETE_ACCOUNT_VERIFY = BASE_URL + '/v1/user/confirm-delete-account';
  static const String GET_USER = BASE_URL + '/v1/user/get-profile';
  static const String UPDATE_USER = BASE_URL + '/v1/user/edit-profile';
  static const String CONTACT_US = BASE_URL + '/v1/user/add-support-issue';
  static const String SIGNUP = BASE_URL + '/users';
  static const String CHANGE_PHONE_NUMBER = BASE_URL + '/users/change-phone';
  static const String GET_CENTERS =
      BASE_URL + '/v1/user/transplant-centers-list';
  static const String LOGOUT = BASE_URL + '/v1/user/logout';
  static const String ABOUTUS = BASE_URL + '/webview/about-us';
  static const String PRIVACYPOLICY = BASE_URL + '/webview/privacy-policy';
  static const String SAVE_PATIENT_APPLICATION = BASE_URL + '/v1/user/add-patient-application';
  static const String GET_PATIENT_APPLICATION = BASE_URL + '/v1/user/patient-details';
  
  
}
