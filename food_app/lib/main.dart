import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/route_managment.dart';
import 'routes/app_routes.dart';
import 'utils/app_strings.dart';

void main() {
  runApp(const FoodApp());
}

/// Root widget — StatelessWidget because it only configures the app,
/// it never rebuilds itself in response to state changes.
class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color.fromRGBO(108, 31, 4, 1),
        scaffoldBackgroundColor: const Color(0xFFF7F8FC),
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.black87,
          centerTitle: false,
        ),
      ),
      // Every page is registered in AppPages with a named route from
      // AppRoutes: login, signup, home, profile.
      initialRoute: AppRoutes.login,
      getPages: AppPages.pages,
    );
  }
}
