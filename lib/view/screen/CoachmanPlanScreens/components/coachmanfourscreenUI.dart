import 'package:alpersonalcoachingapp/page_routes/routes.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CoachmanfourUiScreenACtivity extends StatelessWidget {
  final String title;
  final String subtitle;
  final String kclamount;
  final Function()? onTap;
  const CoachmanfourUiScreenACtivity(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.kclamount,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardTheme.color,
          borderRadius: BorderRadius.circular(3.w),
        ),
        child: Padding(
          padding: EdgeInsets.all(3.w),
          child: Row(children: [
            Column(
              children: [
                Text(
                  title,
                  style: AppHelper.themelight
                      ? AppStyle.cardtitledark
                      : AppStyle.cardtitle,
                ),
                Text(
                  subtitle,
                  style: AppHelper.themelight
                      ? AppStyle.cardtitledark
                          .copyWith(color: AppColors.greyColor)
                      : AppStyle.cardtitle.copyWith(color: AppColors.greyColor),
                ),
              ],
            ),
            Spacer(),
            Text(
              kclamount,
              style: AppHelper.themelight
                  ? AppStyle.cardtitledark.copyWith(color: AppColors.greyColor)
                  : AppStyle.cardtitle.copyWith(color: AppColors.greyColor),
            ),
          ]),
        ),
      ),
    );
  }
}
