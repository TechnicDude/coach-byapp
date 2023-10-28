import 'package:alpersonalcoachingapp/page_routes/routes.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/utils/appbarforall.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:alpersonalcoachingapp/view/screen/CoachmanPlanScreens/components/coachmanfourscreenUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CoachmanfourScreenActivity extends StatefulWidget {
  const CoachmanfourScreenActivity({super.key});

  @override
  State<CoachmanfourScreenActivity> createState() =>
      _CoachmanfourScreenActivityState();
}

class _CoachmanfourScreenActivityState
    extends State<CoachmanfourScreenActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarScreens(
            title: "Maltid 1",
          )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          top: 2.h, left: 2.h, right: 2.h, bottom: 0.2.h),
                      child: CoachmanfourUiScreenACtivity(
                        title: "Maltid 1",
                        subtitle: "0 g",
                        kclamount: "0 kcal",
                        onTap: () {
                          // Navigator.pushNamed(
                          //     context, Routes.subscriptionScreenActivity);
                        },
                      ),
                    );
                  }),
              SizedBox(
                height: 2.h,
              ),
              Center(
                child: Text(
                  "${0} g  Kolhydrater . ${0} g Fett . ${0} g Protein",
                  style: AppHelper.themelight
                      ? AppStyle.cardsubtitledark
                          .copyWith(color: AppColors.greyColor)
                      : AppStyle.cardsubtitle
                          .copyWith(color: AppColors.greyColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
