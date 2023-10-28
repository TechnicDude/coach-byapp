import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/provider/profileprovider.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/utils/showExitPopup.dart';
import 'package:alpersonalcoachingapp/view/screen/CoachmanPlanScreens/coachmanscreenactivity.dart';
import 'package:alpersonalcoachingapp/view/screen/MealPlanScreens/MealPlanScreenActivity.dart';
import 'package:alpersonalcoachingapp/view/screen/ProfileScreens/profilescreenActivity.dart';
import 'package:alpersonalcoachingapp/view/screen/dashboard/homedashboard/homedashboard.dart';
import 'package:alpersonalcoachingapp/view/screen/drawer/menubar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DashBoardScreenActivity extends StatefulWidget {
  const DashBoardScreenActivity({super.key});

  @override
  State<DashBoardScreenActivity> createState() =>
      _DashBoardScreenActivityState();
}

class _DashBoardScreenActivityState extends State<DashBoardScreenActivity> {
  int _currentIndex = 0;

  bool isHomePageSelected = true;
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  List tabs = [];

  onBottomIconPressed(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    fetdata();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  fetdata() {
    tabs = [
      HomeDashboardScreenActivity(
        callback: (value) {
          if (value == "okopen") {
            _key.currentState!.openDrawer();
          }
        },
      ),
      MealPlanScreenActivity(),
      CoachmanScreenActivity(),
      ChangeNotifierProvider<ProfileUserProvider>(
          create: (BuildContext context) => ProfileUserProvider(),
          child: ProfileScreenActivity()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Scaffold(
        key: _key,
        drawer: MenuBarScreens(),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        body: SafeArea(child: tabs[_currentIndex]),
        bottomNavigationBar: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(3.h),
                  topRight: Radius.circular(3.h)),
              child: BottomNavigationBar(
                  currentIndex: _currentIndex,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Theme.of(context).cardTheme.color,
                  iconSize: 17.0,
                  selectedIconTheme: IconThemeData(size: 25.0),
                  selectedItemColor: AppColors.primarycolor,
                  unselectedItemColor: Theme.of(context).colorScheme.primary,
                  selectedFontSize: 14.sp,
                  unselectedFontSize: 13.sp,
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: Languages.of(context)!.home,
                        backgroundColor: Colors.white),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.local_dining_rounded),
                        label: Languages.of(context)!.mealplan,
                        backgroundColor: Colors.white),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.sticky_note_2),
                        label: Languages.of(context)!.exercise,
                        backgroundColor: Colors.white),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.account_circle_rounded),
                        label: Languages.of(context)!.profile,
                        backgroundColor: Colors.white),
                  ],
                  onTap: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
