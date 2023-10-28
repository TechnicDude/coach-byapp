import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/provider/ThemeProvider.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/utils/appimage.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:alpersonalcoachingapp/utils/settingswidgetui.dart';
import 'package:alpersonalcoachingapp/view/screen/dashboard/homedashboard/components/subscription/subscriptionwidgetui.dart';
import 'package:alpersonalcoachingapp/view/screen/packageScreen/pckagescreenuicard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PackageScreenActivity extends StatefulWidget {
  const PackageScreenActivity({super.key});

  @override
  State<PackageScreenActivity> createState() => _PackageScreenActivityState();
}

class _PackageScreenActivityState extends State<PackageScreenActivity> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DarkThemeProvider>(
        builder: (context, darkThemeProvider, child) {
      return Scaffold(
          backgroundColor: AppColors.whiteColor,
          appBar: AppBar(
            backgroundColor: AppColors.whiteColor,
            iconTheme: IconThemeData(
              color: AppColors.blackColor,
            ),
            elevation: 0,
            centerTitle: true,
            title: Text(Languages.of(context)!.settings,
                style: AppHelper.themelight
                    ? AppStyle.cardtitledark
                        .copyWith(fontSize: 18.sp, color: AppColors.blackColor)
                    : AppStyle.cardtitle.copyWith(
                        fontSize: 18.sp, color: AppColors.blackColor)),
          ),
          body: Column(
            children: [
              SizedBox(
                height: 70.w,
                child: Image(
                  image: AssetImage(AppImages.package),
                ),
              ),
              Flexible(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: packagescreencardWidgetUI(),
                          ),
                        );
                      })),
            ],
          ));
    });
  }
}
