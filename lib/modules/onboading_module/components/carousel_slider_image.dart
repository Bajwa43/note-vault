import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/models/onboading_model.dart';
import 'package:todo_app/modules/onboading_module/onboarding_screen.dart';

class CarouselImageWidget extends StatelessWidget {
  const CarouselImageWidget(
      {super.key, required this.onselect, required this.carouselController});

  final Function(int selectedPageIndex) onselect;

  final CarouselController carouselController;

  @override
  Widget build(BuildContext context) {
    return CarouselView(
        itemExtent: 10,
        controller: carouselController,
        children: [
          ...List.generate(
            OnboadingModel.listOfOnboarding.length,
            (index) =>
                Image.asset(OnboadingModel.listOfOnboarding[index].imagePath),
          )
        ]);

    // return CarouselSlider.builder(
    //     carouselController: carouselController,
    //     itemCount: OnboadingModel.listOfOnboarding.length,
    //     itemBuilder: (context, index, realIndex) =>
    //         Image.asset(OnboadingModel.listOfOnboarding[index].imagePath),
    //     options: CarouselOptions(
    //         scrollPhysics: const NeverScrollableScrollPhysics(),
    //         height: 200.h,
    //         onPageChanged: (index, reason) {
    //           onselect.call(index);
    //         },
    //         initialPage: 0,
    //         // pauseAutoPlayOnTouch: false,
    //         enableInfiniteScroll: false));
  }
}
