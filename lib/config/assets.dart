import 'package:flutter/material.dart';

class Assets {

  static String googleLogo = 'images/Google_Logo.svg';
  static String appleLogoLight = 'images/Apple_logo_white.svg';
  static String appleLogoDark = 'images/Apple_logo_black.svg';
  static String facebookLogo = 'images/Facebook_Logo.svg';
  static String profilePlaceHolderDark = 'images/profile_dark.jpg';
  static String profilePlaceHolderLight = 'images/profile_light.jpg';
  static String forgotPassword = 'images/Forgot_password.svg';
  static String allSet = 'images/all_set.svg';
  static String mail = 'images/mail.svg';
  static String mobile = 'images/mobile.svg';

  static String mailDone = 'images/mail_done.svg';
  static String mailInbox = 'images/mail_inbox.svg';




  static String appleLogo(context) {
    if(Theme.of(context).brightness == Brightness.light) return appleLogoDark;
    return appleLogoLight;
  }

  static String defaultProfilePic(context) {
    if(Theme.of(context).brightness == Brightness.light) return profilePlaceHolderLight;
    return profilePlaceHolderDark;
  }

  static String forgotPasswordIL(context) {
    if(Theme.of(context).brightness == Brightness.light) return forgotPassword;
    return forgotPassword;
  }

}