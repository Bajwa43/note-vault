import 'dart:developer';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/data/Constants/colors.dart';
import 'package:todo_app/data/Constants/size.dart';
// import 'package:workmanager/workmanager.dart';

class TimeCountdownWidget extends StatelessWidget {
  const TimeCountdownWidget(
      {super.key, required this.timeControler, this.onCompleted});

  final CountDownController timeControler;
  final VoidCallback? onCompleted;
  final int durTime = 5;

  @override
  Widget build(BuildContext context) {
    return CircularCountDownTimer(
      duration: 5,
      initialDuration: 0,
      controller: timeControler,
      width: 213.w,
      height: 213.h,
      ringColor: KColors.hintTxtColor,
      ringGradient: null,
      fillColor: KColors.timerFillRingColor,
      fillGradient: null,
      backgroundColor: Colors.transparent,
      backgroundGradient: null,
      strokeWidth: 11.7,
      strokeCap: StrokeCap.square,
      textStyle: KAppTypoGraphy.timerTextStyle,
      //  textAlign: TextAlign.center,
      textFormat: CountdownTextFormat.MM_SS,
      isReverse: true,
      isReverseAnimation: true,
      isTimerTextShown: true,
      autoStart: false,
      onStart: () async {
        // timeControler.start;
        debugPrint('Countdown Started');
        log('Countdown Started');
        // await Workmanager().registerOneOffTask(
        //   DateTime.now().second.toString(),
        //   task,
        //   initialDelay: Duration(seconds: 5),
        //   constraints: Constraints(networkType: NetworkType.connected),
        // );
        // log(' after Countdown Started');

        // await Workmanager().registerPeriodicTask("5", task,
        //     existingWorkPolicy: ExistingWorkPolicy.replace,
        //     frequency: Duration(seconds: 2), //when should it check the link
        //     initialDelay:
        //         Duration(seconds: 5), //duration before showing the notification
        //     constraints: Constraints(
        //       networkType: NetworkType.connected,
        //     ));
      },
      onComplete: onCompleted,
      onChange: (String timeStamp) {
        debugPrint('Countdown Changed $timeStamp');
      },
      timeFormatterFunction: (defaultFormatterFunction, duration) {
        if (duration.inSeconds == 0) {
          return "Start";
        } else {
          return Function.apply(defaultFormatterFunction, [duration]);
        }
      },
    );
  }
}
