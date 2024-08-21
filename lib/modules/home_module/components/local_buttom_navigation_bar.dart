library floating_bottom_bar;

import 'dart:math' as math;

import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart' as bnb;
import 'package:floating_bottom_bar/util/event_bus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/data/Constants/colors.dart';
import 'package:todo_app/widgets/Buttons/trigar_btn.dart';

class AnimatedBottomNavigationBar extends StatefulWidget {
  const AnimatedBottomNavigationBar({
    // required this.bottomBarCenterModel,
    required this.bottomBar,
    this.barColor = Colors.white,
    this.barGradient,
    this.controller,
    Key? key,
    required this.onPressedCenterBtn,
  }) : super(key: key);
  final List<bnb.BottomBarItem> bottomBar;
  // final bnb.BottomBarCenterModel bottomBarCenterModel;
  final Color barColor;
  final Gradient? barGradient;
  final bnb.FloatingBottomBarController? controller;
  final Function() onPressedCenterBtn;

  @override
  AnimatedBottomNavigationBarState createState() =>
      AnimatedBottomNavigationBarState();
}

class AnimatedBottomNavigationBarState
    extends State<AnimatedBottomNavigationBar> with TickerProviderStateMixin {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    _checkValidations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Stack(
        fit: StackFit.loose,
        alignment: Alignment.bottomCenter,
        children: [
          bnb.BottomBarItems(
            barColor: widget.barColor,
            bottomBarItemsList: widget.bottomBar,
            barGradient: widget.barGradient,
            controller: widget.controller,
          ),

          // ADD BUTTON
          Padding(
              padding: EdgeInsets.only(bottom: 30.w),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: TrigareBtn(
                    heightOfBtn: 64,
                    btnName: 'Add',
                    onPressed: widget.onPressedCenterBtn,
                    widthOfBtn: 64.w,
                    icon: Icon(Icons.add, size: 32.sp, color: KColors.txtColor),
                    showJustIcon: true,
                    showCircle: true,
                    inkWellEffectForCircleBtn: true,
                  ))),
        ],
      ),
    );
  }

  /// Check tab bat items count is even.
  bool isEvenCount(int length) => length % 2 == 0;

  /// Check validations like maximum items exceed and item count is even.
  void _checkValidations() {
    assert(widget.bottomBar.length <= bnb.Dimens.maximumItems,
        bnb.Strings.menuItemsMaximum);
    assert(
        isEvenCount(widget.bottomBar.length), bnb.Strings.menuItemsMustBeEven);
  }
}
