import 'package:alpersonalcoachingapp/model/profilemodel.dart';
import 'package:alpersonalcoachingapp/utils/app_string.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppHelper {
  String greeting() {
    var hour = DateTime.now().hour;

    if (hour >= 12 && hour < 17) {
      return 'Afternoon🌞';
    } else if (hour >= 17 && hour < 21) {
      return "Evening🌙";
    } else if (hour >= 21 && hour < 3) {
      return "Night🌜";
    } else {
      return 'Morning☀️';
    }
  }

  static String? userid;
  static String? AUTH_TOKEN_VALUE;
  static String? email_VALUE;
  static String? language;
  static String? role;
  static String? _url;
  static String? image;
  static ProfileUserData? person;
  static String? firstName;
  static String? lastName;
  //static String? emailAddress;
  static String? phoneNumber;
  static String? userAvatar;
  static bool themelight = true;

  static logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    sharedPreferences.setString(AppStringFile.onboardingScreen, "0");
    userid = null;
  }

  Future<void> dialogBuilder(
      BuildContext context, String title, String message) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Ok'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> dialogBuilderforget(
      BuildContext context, String title, String message) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(
            message,
            style: AppStyle.cardtitle.copyWith(fontSize: 16.sp),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: Text(
                'Ok',
                style: AppStyle.onbaordtitle.copyWith(fontSize: 17.sp),
              ),
              onPressed: () {
                Navigator.pop(context);
                //Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
