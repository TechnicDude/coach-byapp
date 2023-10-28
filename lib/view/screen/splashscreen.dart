import 'dart:async';

import 'package:alpersonalcoachingapp/api/locdb.dart';
import 'package:alpersonalcoachingapp/page_routes/routes.dart';
import 'package:alpersonalcoachingapp/utils/app_string.dart';
import 'package:alpersonalcoachingapp/utils/appimage.dart';
import 'package:alpersonalcoachingapp/utils/loaderscreennew.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, homePageRoute);
  }

  homePageRoute() async {
    String? onboardingScreen;
    await LocDb().isLoggedIn();
    bool check = LocDb().loginapp;

    SharedPreferences preferences = await SharedPreferences.getInstance();
    onboardingScreen =
        preferences.getString(AppStringFile.onboardingScreen).toString();

    if (check) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.dashBoardScreenActivity, (Route<dynamic> route) => false);
    } else {
      if (onboardingScreen != "0") {
        Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.changeLanguageScreen, (Route<dynamic> route) => false);
      } else {
        Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.changeLanguageScreen, (Route<dynamic> route) => false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            SizedBox(
              height: 100.h,
              width: 100.w,
              child: Image.asset(
                AppImages.splash,
                fit: BoxFit.fill,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Center(
                  child: LoaderScreennew(),
                ),
                SizedBox(
                  height: 12.h,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
