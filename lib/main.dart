import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_app/modules/Calendar_module/controller/calendar_controller.dart';
import 'package:todo_app/modules/auth_module/Login/login_screen.dart';
import 'package:todo_app/modules/auth_module/register/register_screnn.dart';
import 'package:todo_app/modules/category_add_module/controller/category_add_controler.dart';
import 'package:todo_app/modules/focus_module/focus_screen.dart';
import 'package:todo_app/modules/home_module/controller/task_controller.dart';
import 'package:todo_app/modules/home_module/home_screen.dart';
import 'package:todo_app/modules/category_add_module/Caetgory_screen.dart';
import 'package:todo_app/modules/onboading_module/onboarding_screen.dart';
import 'package:todo_app/modules/start_screen.dart';
import 'package:todo_app/utiles/Constants/colors.dart';

import 'firebase_options.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final TaskController taskController = Get.put(TaskController());
  final CategoryAddControler categoryAddControler =
      Get.put(CategoryAddControler());
  final CalendarController calendarController = Get.put(CalendarController());
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(360, 640),
        builder: (context, child) {
          return GetMaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                background: KColors.backGround,
                seedColor: Colors.deepPurple,
                onBackground: KColors.backGround,
              ),
              scaffoldBackgroundColor: KColors.backGround,
              // highlightColor: Colors.amber,
              useMaterial3: true,
            ),
            getPages: [
              // GetPage(name: '/', page: () => const SplashScreen()),
              GetPage(name: '/onboading', page: () => const OnBoardingScreen()),
              GetPage(name: '/start', page: () => const StartScreen()),
              GetPage(name: '/login', page: () => const LoginScreen()),
              GetPage(name: '/register', page: () => const RegisterScreen()),
              // GetPage(name: '/', page: () => const HomeScreen()),
              GetPage(name: '/Category', page: () => const CategoryScreen()),
              GetPage(name: '/', page: () => const FocusScreen())
            ],
          );
        });
  }
}
