import 'dart:developer';

import 'package:carousel_indicator/carousel_indicator.dart';
// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:todo_app/getx/onboarding_controler/pageIndex_for_scroll_controler.dart';
import 'package:todo_app/models/onboading_model.dart';
import 'package:todo_app/modules/start_screen.dart';
import 'package:todo_app/utiles/Constants/size.dart';
import 'package:todo_app/utiles/helpers/helper_functions.dart';

import '../../widgets/Buttons/trigar_btn.dart';
import '../../widgets/Buttons/topBackBtn.dart';
import 'components/carousel_slider_image.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final OnBoadingPageIndexController pageIndexController =
      Get.put(OnBoadingPageIndexController());

  // late CarouselController carouselTextController;
  late CarouselController carouselImageController;
  late PageController textPageControler;
  int pageIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // carouselTextController = CarouselController();
    carouselImageController = CarouselController();
    textPageControler = PageController(initialPage: 0, keepPage: true);
  }

  @override
  Widget build(BuildContext context) {
    log('Rebuild');
    return Scaffold(
      // backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _topLeftButton(context),
          SizedBox(
            height: 10.h,
          ),
          // carouselSliderImages(),
          _carouselIndicator(),
          SizedBox(
            height: 50.h,
          ),
          _txtPageBuilder(),
          _buttons(context)
        ],
      ),
    );
  }

  CarouselImageWidget carouselSliderImages() {
    return CarouselImageWidget(
      carouselController: carouselImageController,
      onselect: (selectedPageIndex) {
        setState(() {
          pageIndex = selectedPageIndex;
        });
      },
    );
  }

  Obx _carouselIndicator() {
    return Obx(() {
      return CarouselIndicator(
        index: pageIndexController.pageIndex.value,
        count: OnboadingModel.listOfOnboarding.length,
      );
    });
  }

  Expanded _buttons(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 100.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () {
                  if (pageIndexController.pageIndex.value != 0) {
                    // carouselImageController.previousPage();
                    textPageControler.previousPage(
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.linear);
                  }
                },
                child: Text(
                  'Back',
                  style: TextStyle(fontSize: 16.sp),
                )),
            TrigareBtn(
              heightOfBtn: 48.h,
              btnName: 'Next',
              onPressed: () {
                if (pageIndexController.pageIndex.value ==
                    OnboadingModel.listOfOnboarding.length - 1) {
                  // Get.to(const StartScreen());
                  Get.toNamed('/start');
                }
                // carouselTextController.nextPage();
                // carouselImageController.nextPage();
                //

                textPageControler.nextPage(
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.linear);
                // carouselImageController.jumpToPage()
              },
            ),
          ],
        ),
      ),
    );
  }

  Expanded _txtPageBuilder() {
    return Expanded(
      child: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: OnboadingModel.listOfOnboarding.length,
        controller: textPageControler,
        onPageChanged: (value) {
          // carouselImageController
          // setState(() {
          //   pageIndex = value;

          // });

          pageIndexController.updatePageIndex(value);
        },
        itemBuilder: (context, index) {
          return Column(children: [
            Text(OnboadingModel.listOfOnboarding[index].title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: KAppTypoGraphy.onBoadingTitleSize,
                    fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                OnboadingModel.listOfOnboarding[index].discription,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: KAppTypoGraphy.onBoadingDescriptionSize,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ]);
        },
      ),
    );
  }

  Expanded _topLeftButton(BuildContext context) {
    return Expanded(
      flex: 1,
      child: TopLeftBtn(
        isText: true,
        onPressed: () {
          // HelperFunctions.navigateToScreen(
          //     context: context, screen: const StartScreen());
          Get.toNamed('/start');
        },
      ),
    );
  }
}
