import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:alpersonalcoachingapp/utils/buttonwidget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class packagescreencardWidgetUI extends StatefulWidget {
  final String? title;
  final String? subtitle;
  final String? buttontext;
  final Function()? onTap;
  const packagescreencardWidgetUI({
    Key? key,
    this.title,
    this.subtitle,
    this.buttontext,
    this.onTap,
  }) : super(key: key);

  @override
  State<packagescreencardWidgetUI> createState() =>
      _packagescreencardWidgetUIState();
}

class _packagescreencardWidgetUIState extends State<packagescreencardWidgetUI> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: 40.w,
            height: 45.h,
            decoration: BoxDecoration(
              color: Theme.of(context).cardTheme.color,
              borderRadius: BorderRadius.circular(2.w),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(1, 1),
                )
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(2.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.stars,
                    color: AppColors.primarycolor,
                    size: 3.h,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    "BASIC",
                    style: AppHelper.themelight
                        ? AppStyle.cardtitledark.copyWith(
                            fontSize: 18.sp,
                            color: AppColors.primarycolor,
                          )
                        : AppStyle.cardtitle.copyWith(
                            fontSize: 18.sp,
                            color: AppColors.primarycolor,
                          ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Divider(),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "\$89 kr",
                    textAlign: TextAlign.start,
                    style: AppHelper.themelight
                        ? AppStyle.cardtitledark.copyWith(fontSize: 18.sp)
                        : AppStyle.cardtitle.copyWith(fontSize: 18.sp),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  SizedBox(
                    child: Text("The Basic. \$29/month. 500 texts per month",
                        maxLines: 2,
                        style: AppHelper.themelight
                            ? AppStyle.cardsubtitledark
                            : AppStyle.cardsubtitle),
                  ),
                  Spacer(),
                  ButtonWidget(
                    height: 5.h,
                    text: "BUY NOW",
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
