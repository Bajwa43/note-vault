import 'package:flutter/material.dart';

import 'components/home_appbar.dart';
import 'components/on_screen/on_screen.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  late TextEditingController searchbarCtrl;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchbarCtrl = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(children: [
          const HomeAppBarWidget(),
          OnScreen(controller: searchbarCtrl)
        ]),
      ),
    );
  }
}
