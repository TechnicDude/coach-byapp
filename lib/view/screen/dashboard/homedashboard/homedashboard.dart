import 'package:alpersonalcoachingapp/api/api.dart';
import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/page_routes/routes.dart';
import 'package:alpersonalcoachingapp/provider/ThemeProvider.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/appimage.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:alpersonalcoachingapp/utils/components/Appiconsbutton.dart';
import 'package:alpersonalcoachingapp/utils/extentions.dart';
import 'package:alpersonalcoachingapp/view/screen/dashboard/homedashboard/components/bodysdetails.dart';
import 'package:alpersonalcoachingapp/view/screen/dashboard/homedashboard/components/newheader.dart';
import 'package:alpersonalcoachingapp/view/screen/dashboard/homedashboard/components/subscription/subscriptionhomeui.dart';
import 'package:alpersonalcoachingapp/view/screen/dashboard/homedashboard/components/weeklysDetails.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeDashboardScreenActivity extends StatefulWidget {
  final Function callback;
  const HomeDashboardScreenActivity({
    Key? key,
    required this.callback,
  }) : super(key: key);

  @override
  _HomeDashboardScreenActivityState createState() =>
      _HomeDashboardScreenActivityState();
}

class _HomeDashboardScreenActivityState
    extends State<HomeDashboardScreenActivity> {
  DarkThemeProvider foodcategoriesProvider = DarkThemeProvider();

  Widget _icon(IconData icon, {Color color = AppColors.primarycolor}) {
    return CircleAvatar(
      radius: 3.h,
      backgroundColor: AppColors.whiteColor.withOpacity(0.2),
      child: GestureDetector(
        onTap: () {},
        child: CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 2.6.h,
          backgroundImage: AppHelper.userAvatar != null
              ? NetworkImage(APIURL.imageurl + AppHelper.userAvatar!)
              : AssetImage(
                  AppImages.profile,
                ) as ImageProvider,
        ),
      ),
    ).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(13)));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DarkThemeProvider>(
        builder: (context, darkThemeProvider, child) {
      return SafeArea(
        child: Padding(
            padding: EdgeInsets.only(top: 1.h, left: 2.h, right: 2.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: <Widget>[
                    RotatedBox(
                      quarterTurns: 4,
                      child: _icon(Icons.sort, color: Colors.white).ripple(() {
                        widget.callback("okopen");
                      }),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: Languages.of(context)!.good,
                            style: AppHelper.themelight
                                ? AppStyle.cardtitledark
                                    .copyWith(fontSize: 16.sp)
                                : AppStyle.cardtitle.copyWith(fontSize: 16.sp),
                            children: <TextSpan>[
                              TextSpan(
                                  text: " ${AppHelper().greeting()}",
                                  style: AppHelper.themelight
                                      ? AppStyle.cardtitledark.copyWith(
                                          color: AppColors.primarycolor,
                                          fontSize: 16.sp)
                                      : AppStyle.cardtitle.copyWith(
                                          color: AppColors.primarycolor,
                                          fontSize: 16.sp)),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: '${AppHelper.firstName}',
                            style: AppHelper.themelight
                                ? AppStyle.cardsubtitledark
                                    .copyWith(fontSize: 15.sp)
                                : AppStyle.cardsubtitle
                                    .copyWith(fontSize: 15.sp),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ",",
                                  style: AppHelper.themelight
                                      ? AppStyle.cardtitledark.copyWith(
                                          color: AppColors.primarycolor,
                                          fontSize: 15.sp)
                                      : AppStyle.cardtitle.copyWith(
                                          color: AppColors.primarycolor,
                                          fontSize: 15.sp)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Stack(
                      alignment: Alignment.topRight,
                      clipBehavior: Clip.none,
                      children: [
                        AppIconButtonsScreenActivity(
                            icondata: Icons.notifications_none,
                            onTap: () {
                              Navigator.pushNamed(
                                  context, Routes.notificationScreen);
                            }),
                        Positioned(
                          top: -5,
                          left: 14,
                          child: Container(
                            height: 4.w,
                            width: 4.w,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 1.0,
                                  ),
                                ],
                                color: Colors.white.withOpacity(0.9),
                                shape: BoxShape.circle),
                            child: Center(
                              child: Text(
                                "5",
                                style: AppStyle.cardsubtitle,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    AppIconButtonsScreenActivity(
                      icondata: Icons.photo_library_outlined,
                      onTap: () {
                        Navigator.pushNamed(
                            context, Routes.gallaryScreenActivity);
                      },
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    AppIconButtonsScreenActivity(
                        icondata: Icons.settings,
                        onTap: () {
                          Navigator.pushNamed(
                              context, Routes.settingScreenActivity);
                        }),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: ScrollPhysics(),
                    child: Column(children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      // Stack(
                      //   alignment: Alignment.bottomCenter,
                      //   children: [
                      //     Container(
                      //       height: 20.h,
                      //       width: 100.h,
                      //       decoration: BoxDecoration(
                      //         color: Theme.of(context).cardTheme.color,
                      //         borderRadius: BorderRadius.circular(3.w),
                      //       ),
                      //       // child: ClipRRect(
                      //       //   borderRadius: BorderRadius.circular(1.h),
                      //       //   // child: NetWorkImageScreen(
                      //       //   //   height: 2.h,
                      //       //   //   image: APIURL.imageurl +
                      //       //   //       (foodtypedata![index].primaryImage!),
                      //       //   // )
                      //       //   child: Image.asset(
                      //       //     AppImages.splash,
                      //       //     fit: BoxFit.fill,
                      //       //   ),
                      //       // )
                      //     ),
                      //     Column(
                      //       children: [
                      //         SizedBox(
                      //           width: 80.w,
                      //           child: Text(
                      //             "The Pawsh Puppy Passport is any puppy training.",
                      //             maxLines: 2,
                      //             style: AppHelper.themelight
                      //                 ? AppStyle.cardtitledark
                      //                     .copyWith(fontSize: 14.sp)
                      //                 : AppStyle.cardtitle
                      //                     .copyWith(fontSize: 14.sp),
                      //           ),
                      //         ),
                      //         SizedBox(
                      //           height: 1.h,
                      //         ),
                      //         SizedBox(
                      //           width: 80.w,
                      //           child: Text(
                      //             "He is pampered from head to tail with the finest grooming products on the market, knows the best tricks on the block, and always has the latest toy",
                      //             maxLines: 2,
                      //             style: AppHelper.themelight
                      //                 ? AppStyle.cardsubtitledark
                      //                 : AppStyle.cardsubtitle,
                      //           ),
                      //         ),
                      //         Row(
                      //           mainAxisAlignment: MainAxisAlignment.end,
                      //           children: [
                      //             Padding(
                      //               padding: EdgeInsets.all(2.h),
                      //               child: InkWell(
                      //                 onTap: () {
                      //                   Navigator.pushNamed(
                      //                       context,
                      //                       Routes
                      //                           .homepageinfotabbarSCreenActivity);
                      //                 },
                      //                 child: Container(
                      //                     height: 5.h,
                      //                     width: 10.w,
                      //                     decoration: BoxDecoration(
                      //                       color: AppColors.iconboxcolor,
                      //                       borderRadius: BorderRadius.all(
                      //                           Radius.circular(1.h)),
                      //                     ),
                      //                     child: Icon(
                      //                       Icons.arrow_forward,
                      //                       color: Colors.white,
                      //                     )),
                      //               ),
                      //             ),
                      //           ],
                      //         )
                      //       ],
                      //     ),
                      //   ],
                      // ),

                      // SizedBox(
                      //   height: 2.h,
                      // ),

                      NewArrivalsHeader(
                        onTap: () {
                          Navigator.pushNamed(
                              context, Routes.homepageinfotabbarSCreenActivity);
                        },
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      SubscriptionHomeUiScreenACtivity(
                        title: "Erbjudanden",
                        icon: Icons.celebration,
                        onTap: () {
                          Navigator.pushNamed(
                              context, Routes.subscriptionScreenActivity);
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      WeekLyDetailsScreenActivity(),
                      SizedBox(
                        height: 2.h,
                      ),
                      Wrap(
                        spacing: 12.0,
                        runSpacing: 12.0,
                        children: [
                          // WeekLyDetailsmeasurmentScreenActivity(),

                          BodysDetailsScreenACtivity(
                            title: Languages.of(context)!.biceps,
                            value: 10.0,
                            icon: AppImages.biceps,
                          ),
                          BodysDetailsScreenACtivity(
                            title: Languages.of(context)!.bum,
                            value: 10.0,
                            icon: AppImages.butt,
                          ),
                          BodysDetailsScreenACtivity(
                            title: Languages.of(context)!.waist,
                            value: 10.0,
                            icon: AppImages.waist,
                          ),
                          BodysDetailsScreenACtivity(
                            title: Languages.of(context)!.leg,
                            value: 10.0,
                            icon: AppImages.leg,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                    ]),
                  ),
                )
              ],
            )),
      );
    });
  }
}
