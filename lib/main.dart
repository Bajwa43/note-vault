import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_app/controllers/profile_controller.dart';
import 'package:todo_app/modules/Calendar_module/controller/calendar_controller.dart';
import 'package:todo_app/modules/auth_module/Login/login_screen.dart';
import 'package:todo_app/modules/auth_module/auth_wrapper.dart';
import 'package:todo_app/modules/auth_module/register/register_screnn.dart';
import 'package:todo_app/modules/category_add_module/controller/category_add_controler.dart';
import 'package:todo_app/modules/focus_module/focus_screen.dart';
import 'package:todo_app/modules/home_module/controller/task_controller.dart';
import 'package:todo_app/modules/home_module/home_screen.dart';
import 'package:todo_app/modules/category_add_module/Caetgory_screen.dart';
import 'package:todo_app/modules/onboading_module/onboarding_screen.dart';
import 'package:todo_app/modules/splash_screen.dart';
import 'package:todo_app/modules/start_screen.dart';
import 'package:todo_app/data/Constants/colors.dart';
import 'package:workmanager/workmanager.dart';
import 'firebase_options.dart';

sendData() {
  log('HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH');
}

const task = 'TaskCompleted';

void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) {
    print(
        "Native called background task: $task"); //simpleTask will be emitted here.
    switch (taskName) {
      case 'TaskCompleted':
        sendData();
        break;
      default:
    }
    return Future.value(true);
  });
}

void main() async {
  await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // workmanager: runs on a separate isolate from the main flutter isolate
  // isINDebugMode: Show the Notification on complete Task
  // callbackDispatcher: needs to be either a static function or a top level function to be accessible as a Flutter entry point.
  await Workmanager().initialize(callbackDispatcher, isInDebugMode: true);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final TaskController taskController = Get.put(TaskController());
  final CategoryAddControler categoryAddControler =
      Get.put(CategoryAddControler());
  final CalendarController calendarController = Get.put(CalendarController());
  final _pc = Get.lazyPut(
    () => ProfileController(),
  );

  final ProfileController pc = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 640),
        builder: (context, child) {
          return GetMaterialApp(
            home: AuthWrapper(),
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

            // getPages: [
            //   // GetPage(name: '/', page: () => const SplashScreen()),
            //   GetPage(name: '/onboading', page: () => const OnBoardingScreen()),
            //   GetPage(name: '/start', page: () => const StartScreen()),
            //   GetPage(name: '/login', page: () => const LoginScreen()),
            //   GetPage(name: '/register', page: () => const RegisterScreen()),
            //   GetPage(name: '/', page: () => const HomeScreen()),
            //   GetPage(name: '/Category', page: () => const CategoryScreen()),
            //   // GetPage(name: '/', page: () => const FocusScreen())
            // ],
          );
        });
  }
}
