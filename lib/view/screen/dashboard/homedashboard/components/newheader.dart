import 'package:alpersonalcoachingapp/page_routes/routes.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/appimage.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NewArrivalsHeader extends StatefulWidget {
  final Function? onTap;
  const NewArrivalsHeader({Key? key, this.onTap}) : super(key: key);

  @override
  _NewArrivalsHeaderState createState() => _NewArrivalsHeaderState();
}

class _NewArrivalsHeaderState extends State<NewArrivalsHeader> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => widget.onTap!.call(),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 15,
              ),
              child: Container(
                height: 160,
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: AppColors.primarycolor,
                  borderRadius: BorderRadius.circular(2.h),
                ),
              ),
            ),
            Positioned(
              top: 30,
              left: 30,
              bottom: 20,
              child: SizedBox(
                width: 35.w,
                child: Text(
                  "Fitness Online Training Coach",
                  maxLines: 4,
                  style: AppHelper.themelight
                      ? AppStyle.cardtitle.copyWith(fontSize: 20.sp)
                      : AppStyle.cardtitle.copyWith(fontSize: 20.sp),
                ),
              ),
            ),
            Positioned(
                top: -10,
                right: 30,
                child: Image.asset(
                  AppImages.clock,
                  height: 160,
                )),
            Positioned(
              bottom: 10,
              right: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.all(2.h),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, Routes.homepageinfotabbarSCreenActivity);
                      },
                      child: Container(
                          height: 9.w,
                          width: 9.w,
                          decoration: BoxDecoration(
                            color: AppColors.iconboxcolor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(1.h)),
                          ),
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
