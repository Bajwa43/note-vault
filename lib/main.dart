import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:todo_app/modules/Calendar_module/calendar_screen.dart';
import 'package:todo_app/modules/auth_module/Login/login_screen.dart';
import 'package:todo_app/modules/auth_module/register/register_screnn.dart';
import 'package:todo_app/modules/focus_module/focus_screen.dart';
import 'package:todo_app/modules/home_module/components/on_screen/on_screen.dart';
import 'package:todo_app/modules/home_module/home_screen.dart';
import 'package:todo_app/modules/home_module/pages/Caetgory_screen.dart';
import 'package:todo_app/modules/home_module/pages/edit_task_screen/edit_task_screen.dart';
import 'package:todo_app/modules/onboading_module/onboarding_screen.dart';
import 'package:todo_app/modules/profile_mudule/page/setting_screen.dart';
import 'package:todo_app/modules/profile_mudule/profile_screen.dart';
import 'package:todo_app/modules/splash_screen.dart';
import 'package:todo_app/modules/start_screen.dart';
import 'package:todo_app/utiles/Constants/colors.dart';

import 'colorPickerSecond.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'firebase_options.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  // initializeDateFormatting("ar_SA", null).then((_) {
  //   print(DateFormat('EEEE, h:mm a', 'ar_SA')
  //       .format(DateTime.parse("2022-10-02 23:59:59")));
  // });
  // print(DateFormat('EEEE, h:mm a', 'en_US')
  //     .format(DateTime.parse("2022-10-02 23:59:59")));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

            // home: SettingScreen(),
            // home: ProfileScreen(),
            // home: FocusScreen(),
            // home: CategoryScreen(),
            // home: const HomeScreen(),

            // home: CalendarScreen(),
            // home: const EditTaskScreen(indexOfSelectedTask: 0),
            // home: const LoginScreen(),
            // home: const SplashScreen(),

            getPages: [
              GetPage(name: '/', page: () => const SplashScreen()),
              GetPage(name: '/onboading', page: () => const OnBoardingScreen()),
              GetPage(name: '/start', page: () => const StartScreen()),
              GetPage(name: '/login', page: () => const LoginScreen()),
              GetPage(name: '/register', page: () => const RegisterScreen()),
              GetPage(name: '/home', page: () => const HomeScreen()),
              GetPage(name: '/category', page: () => const CategoryScreen()),
            ],
          );
        });
  }
}
