import 'package:get/get.dart';
import '../screens/login_page.dart';
import '../screens/signup_page.dart';
import '../screens/home_page.dart';
import '../screens/profile_page.dart';
import 'app_routes.dart';

/// The app only has 4 screens: Login, Signup, Home and Profile.
/// Each route name (from AppRoutes) is mapped to the widget that
/// should be shown for that route.
class AppPages {
  AppPages._();

  static final pages = <GetPage>[
    GetPage(name: AppRoutes.login, page: () => const LoginPage()),
    GetPage(name: AppRoutes.signup, page: () => const SignupPage()),
    GetPage(name: AppRoutes.home, page: () => const HomePage()),
    GetPage(name: AppRoutes.profile, page: () => const ProfilePage()),
  ];
}
