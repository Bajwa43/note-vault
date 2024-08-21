import 'dart:developer';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/data/app_assets.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/modules/focus_module/components/apllication_card_widget.dart';
import 'package:todo_app/modules/focus_module/components/bar_chart_widget.dart';
import 'package:todo_app/modules/home_module/components/home_bottom_navbar.dart';
import 'package:todo_app/data/Constants/size.dart';
import 'package:todo_app/widgets/Buttons/combine_button.dart';
import 'package:todo_app/widgets/Buttons/icon_btn.dart';
import 'package:todo_app/widgets/Buttons/trigar_btn.dart';
import 'package:todo_app/widgets/txtWidget.dart';
import 'package:workmanager/workmanager.dart';
import 'components/time_countdown_widget.dart';

class FocusScreen extends StatefulWidget {
  const FocusScreen({super.key});

  @override
  State<FocusScreen> createState() => _FocusScreenState();
}

class _FocusScreenState extends State<FocusScreen> {
  late CountDownController timeControler;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timeControler = CountDownController();
    timeControler.getTime();
  }

  bool hasStarted = false;
  bool hasPause = false;
  String btnName = 'Start Focusing';
  FlutterSound flutterSound = FlutterSound();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            children: [
              TextWidget(
                  padHori: 0,
                  text: 'Focus Mode',
                  textStyle: KAppTypoGraphy.displayTitleMedium),
// ......................Timer
              TimeCountdownWidget(
                timeControler: timeControler,
                onCompleted: () async {
//                   var path = await flutterSound.thePlayer.startPlayer();
// _playerSubscription = flutterSound.thePlayer.pl .listen((e) {
//   if (e != null) {
//   DateTime date = new DateTime.fromMillisecondsSinceEpoch(e.currentPosition.toInt());
//   String txt = DateFormat(‘mm:ss:SS’, ‘en_US’).format(date);
//   this.setState(() {
//     this.flutterSound.thePlayer = true;
//     this._playerTxt = txt.substring(0, 8);
//   });
//  }
// });

                  setState(() {
                    hasStarted = false;
                  });
                },
              ),

              TextWidget(
                  padVerti: 20.w,
                  padHori: 0,
                  textAlign: TextAlign.center,
                  text:
                      'While your focus mode is on, all of your notifications will be off',
                  textStyle: KAppTypoGraphy.descriptionMedium),
              TrigareBtn(
                  padVerti: 0,
                  widthOfBtn: 177.w,
                  heightOfBtn: 48.h,
                  btnName: hasStarted ? 'Stop Focusing' : btnName,
                  onLongPress: () {
                    timeControler.reset();
                    Workmanager().cancelAll();
                    setState(() {
                      hasPause = hasStarted = false;
                    });
                  },
                  onPressed: () {
                    // await Workmanager()
                    //     .registerOneOffTask(
                    //       DateTime.now().second.toString(),
                    //       task,
                    //       initialDelay: Duration(seconds: 10),
                    //       constraints:
                    //           Constraints(networkType: NetworkType.connected),
                    //     )
                    //     .then(
                    //       (value) => log(' after Countdown Started'),
                    //     );
                    if (hasPause) {
                      timeControler.resume();
                      hasPause = false;
                      hasStarted = true;
                    } else if (hasStarted) {
                      timeControler.pause();
                      hasPause = true;
                      hasStarted = false;
                    } else {
                      timeControler.start();
                      hasStarted = true;
                    }
                    setState(() {});
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                      padHori: 0,
                      text: 'OverView',
                      padVerti: 24.w,
                      textStyle: KAppTypoGraphy.descriptionMedium),
                  CombineButtonWidget(
                      widthOfBtn: 99.w,
                      heightOfBtn: 31.h,
                      btnText: 'This Week',
                      onTap: () {}),
                ],
              ),
              // ................

              // BarChartSample8(),

              TextWidget(
                  alignmentGeometry: Alignment.topLeft,
                  padHori: 0,
                  padVerti: 16.w,
                  text: 'Applications',
                  textStyle: KAppTypoGraphy.descriptionMedium),

              ApplicationCardWidget(
                  titile: 'Facebook',
                  description: 'You spent 1h on Facebook today',
                  image: SvgPicture.asset(KAppAssets.facebookImage)),
              ApplicationCardWidget(
                  titile: 'Instagram',
                  description: 'You spent 4h on Instagram today',
                  image: SvgPicture.asset(KAppAssets.instagramImage)),
              ApplicationCardWidget(
                  titile: 'Twitter',
                  description: 'You spent 3h on Twitter today',
                  image: SvgPicture.asset(KAppAssets.twiterImage)),

              ApplicationCardWidget(
                  titile: 'Telegram',
                  description: 'You spent 30m on Telegram today',
                  image: SvgPicture.asset(KAppAssets.telegramImage)),
              ApplicationCardWidget(
                  titile: 'Gmail',
                  description: 'You spent 45m on Gmail today',
                  image: SvgPicture.asset(KAppAssets.gmailImage))
            ],
          ),
        ),
      )),
      // bottomNavigationBar: HomeBottomNavbarWidget(onPressed: () {}, index: 2),
    );
  }
}
