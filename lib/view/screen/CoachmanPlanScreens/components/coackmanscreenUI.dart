import 'package:alpersonalcoachingapp/page_routes/routes.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CoachmanUiScreenACtivity extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Function()? onTap;
  const CoachmanUiScreenACtivity(
      {super.key, required this.title, required this.icon, this.onTap});

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
            Text(
              title,
              style: AppHelper.themelight
                  ? AppStyle.cardtitledark
                  : AppStyle.cardtitle,
            ),
            Spacer(),
            Icon(
              Icons.arrow_circle_right_outlined,
              color: AppColors.greyColor,
              size: 3.5.h,
            ),
          ]),
        ),
      ),
    );
  }
}
