import 'dart:developer';
import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/modules/Calendar_module/calendar_screen.dart';
import 'package:todo_app/modules/focus_module/focus_screen.dart';
import 'package:todo_app/modules/home_module/components/local_buttom_navigation_bar.dart'
    as local;
import 'package:todo_app/modules/home_module/home_screen.dart';
import 'package:todo_app/modules/profile_mudule/profile_screen.dart';
import 'package:todo_app/data/Constants/colors.dart';
import 'package:todo_app/data/helpers/helper_functions.dart';

// int? indexGolobal;

class HomeBottomNavbarWidget extends StatefulWidget {
  const HomeBottomNavbarWidget(
      {super.key,
      required this.onPressed,
      required this.index,
      required this.onAddPressed});
  final Function(int index) onPressed;
  final Function() onAddPressed;

  final int index;

  @override
  State<HomeBottomNavbarWidget> createState() => _HomeBottomNavbarWidgetState();
}

class _HomeBottomNavbarWidgetState extends State<HomeBottomNavbarWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // indexGolobal = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return local.AnimatedBottomNavigationBar(
      onPressedCenterBtn: widget.onAddPressed,
      barColor: Color(0xFF363636),
      controller: FloatingBottomBarController(initialIndex: 0),
      // Icons Decided
      bottomBar: [
        BottomBarItem(
          icon:
              const Icon(Icons.home_rounded, size: 24, color: KColors.txtColor),
          iconSelected:
              const Icon(Icons.home_rounded, color: Colors.amber, size: 24),
          title: 'Index',
          titleStyle: const TextStyle(color: KColors.txtColor),
          dotColor: Colors.amber,
          onTap: (value) {
            setState(() {
              // indexGolobal = value;
              widget.onPressed(value);
            });
            // HelperFunctions.navigateToScreen(
            //     context: context, screen: const HomeScreen());

            log('Index $value');
          },
        ),
        //
        BottomBarItem(
          icon: const Icon(
            Icons.calendar_month,
            size: 24,
            color: KColors.txtColor,
          ),
          iconSelected:
              const Icon(Icons.calendar_month, color: Colors.amber, size: 24),
          title: "Calender",
          titleStyle: const TextStyle(color: KColors.txtColor),
          dotColor: Colors.amber,
          onTap: (value) {
            setState(() {
              // indexGolobal = value;
              widget.onPressed(value);
            });
            // HelperFunctions.navigateToScreen(
            //     context: context, screen: const CalendarScreen());
            log('Calender $value');
          },
        ),
        BottomBarItem(
          icon: const Icon(
            Icons.access_time,
            size: 24,
            color: KColors.txtColor,
          ),
          iconSelected:
              const Icon(Icons.access_time, color: Colors.amber, size: 24),
          title: 'Focus',
          titleStyle: const TextStyle(color: KColors.txtColor),
          dotColor: Colors.amber,
          onTap: (value) {
            setState(() {
              // indexGolobal = value;
              widget.onPressed(value);
            });
            // HelperFunctions.navigateToScreen(
            //     context: context, screen: const FocusScreen());

            log('Focus $value');
          },
        ),
        BottomBarItem(
          icon: const Icon(
            Icons.person_2_outlined,
            size: 24,
            color: KColors.txtColor,
          ),
          iconSelected: const Icon(Icons.person_2_outlined,
              color: Colors.amber, size: 24),
          title: 'Profile',
          titleStyle: const TextStyle(color: KColors.txtColor),
          dotColor: Colors.amber,
          onTap: (value) {
            setState(() {
              // index = value;
              widget.onPressed(value);
            });
            // HelperFunctions.navigateToScreen(
            //     context: context, screen: const ProfileScreen());

            log('Profile $value');
          },
        ),
      ],
      // bottomBarCenterModel: BottomBarCenterModel(
      //   centerBackgroundColor: Colors.amber,
      //   centerIcon: const FloatingCenterButton(
      //     child: Icon(
      //       Icons.add,
      //       color: AppColors.white,
      //     ),
      //   ),
      //   centerIconChild: [
      //     FloatingCenterButtonChild(
      //       child: const Icon(
      //         Icons.home,
      //         color: AppColors.white,
      //       ),
      //       onTap: () => log('Item1'),
      //     ),
      //     FloatingCenterButtonChild(
      //       child: const Icon(
      //         Icons.access_alarm,
      //         color: AppColors.white,
      //       ),
      //       onTap: () => log('Item2'),
      //     ),
      //     FloatingCenterButtonChild(
      //       child: const Icon(
      //         Icons.ac_unit_outlined,
      //         color: AppColors.white,
      //       ),
      //       onTap: () => log('Item3'),
      //     ),
      //   ],
      // ),
    );
  }
}
