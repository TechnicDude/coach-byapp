import 'dart:io';
import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Future<bool> showExitPopup(context) async {
  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Languages.of(context)!.wanttoexitapp,
                  style: AppStyle.onbaordtitle.copyWith(fontSize: 16.sp),
                ),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          exit(0);
                        },
                        child: Text(
                          Languages.of(context)!.yes,
                          style: AppStyle.cardtitle.copyWith(fontSize: 16.sp),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: AppColors.primarycolor),
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(Languages.of(context)!.no,
                          style: AppStyle.cardtitle.copyWith(fontSize: 16.sp)),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                    ))
                  ],
                )
              ],
            ),
          ),
        );
      });
}
