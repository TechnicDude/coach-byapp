import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/page_routes/routes.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/utils/appbarforall.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:alpersonalcoachingapp/view/screen/CoachmanPlanScreens/components/coackmanscreenUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CoachmanScreenActivity extends StatefulWidget {
  const CoachmanScreenActivity({super.key});

  @override
  State<CoachmanScreenActivity> createState() => _CoachmanScreenActivityState();
}

class _CoachmanScreenActivityState extends State<CoachmanScreenActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarScreens(
            title: "Coachman",
          )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                  itemCount: 1,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          top: 2.h, left: 2.h, right: 2.h, bottom: 0.2.h),
                      child: CoachmanUiScreenACtivity(
                        title: "Blanko",
                        icon: Icons.donut_large_sharp,
                        onTap: () {
                          Navigator.pushNamed(
                              context, Routes.coachmantwoScreenActivity);
                        },
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
