import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/app_assets.dart';

class NoScreenWidget extends StatelessWidget {
  const NoScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
          width: 227.w, height: 301.h, child: Image.asset(KAppAssets.homeLogo)),
    );
  }
}
