class Constants {
  //Keys
  static const String googlePlacesAPIKEY =
      "AIzaSyAAvkknUZejCdl_Uq8wt_FjX0e3psEyTJs";

  //Splash
  static const String hello = "Welcome to GunLox";

  static const String welcomeText = "The World’s First Digital Safe";
  static const String createAccount = "Create Account";

  //Login
  static const String login = "Login";
  static const String logIn = "Log In";
  static const String logInvia = "Login Via Phone Number";
  static const String loginSuccess = "Login Successful";
  static const String registerSuccess = "User Register Successful";

  static const String OR = "OR";
  static const String rememberme = "Remember me";

  static const String enterEmail = "Enter your email";
  static const String enterPassword = "Enter your password";
  static const String emailError = "Please enter a valid email";
  static const String passwordError = "Please enter a valid password";
  static const String phoneNumberError = "Please enter a valid phone number";

  static const String passwordRegex =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  static const String passwordRegExError =
      "Password must be at least 8 characters that include\nat least 1 lowercase character, 1 uppercase\ncharacters, 1 number, and 1 special\ncharacter in (!@#596^&*)";
  static const String dontHaveAccount = "Don’t have an account? ";
  static const String signUp = "Sign up";
  static const String user = "User";

  static const String course = "Course";
  static const String courses = "Courses";
  static const String loginError = "Email or password is incorrect";
  static const String emailExistError =
      "Email already exists, Please try another.";

  static const String userError =
      "User not found. Please try with another user.";

  // ignore: prefer_adjacent_string_concatenation, prefer_interpolation_to_compose_strings, unnecessary_string_escapes
  static const String emailRegex = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
      "\\@" +
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
      "(" +
      "\\." +
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
      ")+";

  //ForgotPassword
  static const String retrievePassword = "Retrieve Password";
  static const String sendCode = "Send Code";

  static const String setPasswordText =
      "Set Password (Must be at least 8 characters)";
  static const String confirmPassword = "Confirm Password";
  static const String confirmYourPassword = "Confirm your password";
  static const String enterBio = "Enter Bio";

  //Verification Code Screen
  static const String enterVerificationCode =
      "Please enter the 6 digit code sent to\nyour phone number";
  static const String enterEmailVerificationCode =
      "Please enter the 6 digit code sent \nto your email";
  static const String resendCode = "Resend Code";
  static const String setPassword = "Set Password";
  static const String submit = "Submit";

  //Success Screen
  static const String passwordChangeSuccess =
      "Your password has been successfully updated!";
  static const String profileUpdateSuccess =
      "Your profile has been successfully updated!";

  static const String consultationFeeUpdateSuccess =
      "Your consultation fee has been successfully updated!";

  //Sign Up Screen
  static const String createAnAccount = "Create an account";
  static const String enterFirstName = "Enter First Name";
  static const String enterLastName = "Enter Last Name";
  static const String enterPhone = "Enter your Phone no.";
  static const String SignupSuccess = "Signup Successful";

  static const String already = "Already have an account?";
  static const String login1 = "Login!";
  static const String register = "Register";
  static const String username = "Enter your full name";
  static const String phonumber = "Enter your Phone no.";

  static const String tAndC = "Terms & Conditions";

  //Login with Phone
  static const String checkSms =
      "Check your SMS for verification code to confirm.";
  static const String next = "Next";
  static const String verificatioCode = "Enter Verification Code";
  static const String sendVerificationCode = "Send verification code";

  //Profile
  static const String deleteAccount = "Delete Account";
  static const String logout = "Logout";
  static const String yes = "Yes";
  static const String no = "No";
  static const String deleteAccountMsg =
      "Deleting your account will remove all of your information from our database. This cannot be undone.";
  static const String areYouSure = "Are you sure?";
  //Term and condition
  static const String termsNcon = "Terms and Condition";
  static const String conti = "Continue";
  static const String iAgree = "Agree to Terms and Condition";
  static const String pleaseAgree = " Please Agree to Terms and Condition";

  //verification
  static const String nex = "Next";
  static const String phoneverification = "Phone Verification";
  static const String pleaseenterphonecode = "Please enter code sent to your ";
  static const String phoneNo = "Phone No. ";
  static const String resend = "Resend Code";

//forgot password
  static const String sendcode = "Send Code";
  static const String save = "Save";
  static const String otpverified = "OTP Verified Successfully";
  static const String forgotPassword = "Forgot Password";
  static const String Resetpass = "Reset Password";
  static const String Resetpasstext =
      "Your password must be at least 8 characters";
  static const String forgotPasswordText =
      "Enter the email address associated with your account to receive verification code.";
static const String forgototptext = "Please enter the verification code received on your associated email.";
  static const String setnewOldPassword = "Enter Current Password";
  static const String setnewPassword = "Enter New Password";
  static const String setconfirmpassword = "Confirm New Password";

  //Home
  
  static const String Homeword = "You have no fire arms.";
  static const String addFirm = "Add a Fire Arm";

  //findlock
  static const String findword = "Looking for locks nearby";
  static const String findword3 = "initiate pairing";
  static const String findword2 = "Hold the lock button for 3 seconds to";

  //NoFind
  
  static const String noword = "No locks found!";

  //MyAcccount

  static const String MyAccount = "My Account";
  static const String personalinfo = "Personal Information";
  static const String shopNow= "Shop Now";
  static const String changePass = "Change Password";
  static const String contactUs = "Contact Us";
  static const String safety = "safety";
//Personal info
  static const String PersonalInformation = "Personal Information";
  static const String name = "Name";
  static const String email = "Email";
  static const String phone = "Phone no.";
//change password
  static const String oldPassword = "Enter your old password";
  static const String changePasswordText = "Your password must be at least 8 characters";
  
//contact us
  static const String contactUsText = "Please write any queries or concerns you may have";
  static const String subjectError = "Please enter a subject";
  static const String messageError = "Please enter a message";
  static const String entersub = "Enter Subject";
  static const String writemessage = "Write your message";
  static const String contactUsMessage = "Message sent successfully";


  //safety
  
  static const String safetyText = "Best practices for firearm safety";


}
