import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/utiles/Constants/colors.dart';
import 'package:todo_app/utiles/Constants/size.dart';

class TimeCountdownWidget extends StatelessWidget {
  const TimeCountdownWidget({super.key, required this.timeControler});

  final CountDownController timeControler;

  @override
  Widget build(BuildContext context) {
    return CircularCountDownTimer(
      duration: 60 * 60,
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
      textStyle: KAppTypoGraphy.TimerTextStyle,
      //  textAlign: TextAlign.center,
      textFormat: CountdownTextFormat.MM_SS,
      isReverse: false,
      isReverseAnimation: false,
      isTimerTextShown: true,
      autoStart: false,
      onStart: () {
        // timeControler.start;
        debugPrint('Countdown Started');
      },
      onComplete: () {
        debugPrint('Countdown Ended');
      },
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
