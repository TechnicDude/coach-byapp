import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:alpersonalcoachingapp/utils/submitbutton.dart';
import 'package:alpersonalcoachingapp/view/screen/homeinformationform/components/homeinformationformScreen.dart';
import 'package:alpersonalcoachingapp/view/screen/homeinformationform/components/homeinformationformthree.dart';
import 'package:alpersonalcoachingapp/view/screen/homeinformationform/components/homeinformationformtwo.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomepageinfotabbarSCreenActivity extends StatefulWidget {
  const HomepageinfotabbarSCreenActivity({super.key});

  @override
  State<HomepageinfotabbarSCreenActivity> createState() =>
      _HomepageinfotabbarSCreenActivityState();
}

class _HomepageinfotabbarSCreenActivityState
    extends State<HomepageinfotabbarSCreenActivity> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        bottomNavigationBar: SubmitButton(
          text: "Forsatt",
          onTap: () {},
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.primarycolor,
          iconTheme: IconThemeData(color: AppColors.blackColor),
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Veckouppdatering",
            style: AppStyle.cardtitle.copyWith(fontSize: 18.sp),
          ),
          bottom: TabBar(
            unselectedLabelColor: AppColors.greyColor,
            labelColor: AppColors.blackColor,
            tabs: <Widget>[
              Tab(
                text: "Veckans Framsteg",
              ),
              Tab(
                text: "Foregaende vecka",
              ),
              Tab(
                text: "Kommande vecka",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            HomeInformationFormScreenActivity(),
            Homeinformationformtwo(),
            Homeinformationformthree(),
          ],
        ),
      ),
    );
  }
}
