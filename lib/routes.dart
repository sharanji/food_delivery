import 'package:flutter/widgets.dart';
import 'package:food_delivery/screens/complete_profile/complete_profile_screen.dart';
import 'package:food_delivery/screens/dashboard/dashboard.dart';
import 'package:food_delivery/screens/dashboard/app_home_screen.dart';
import 'package:food_delivery/screens/forgot_password/forgot_password_screen.dart';
import 'package:food_delivery/screens/login_success/login_success_screen.dart';
import 'package:food_delivery/screens/otp/otp_screen.dart';
import 'package:food_delivery/screens/sign_in/sign_in_screen.dart';
import 'package:food_delivery/screens/splash_shop/splash_screen.dart';
import 'screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => const NavigationHomeScreen(),
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
};
