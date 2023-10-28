import 'package:alpersonalcoachingapp/api/api.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/page_routes/routes.dart';
import 'package:alpersonalcoachingapp/provider/ThemeProvider.dart';
import 'package:alpersonalcoachingapp/provider/profileprovider.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/utils/app_string.dart';
import 'package:alpersonalcoachingapp/utils/appimage.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:alpersonalcoachingapp/utils/changelanguagepopup.dart';
import 'package:alpersonalcoachingapp/utils/settingswidgetui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';

class ProfileScreenActivity extends StatefulWidget {
  const ProfileScreenActivity({super.key});

  @override
  State<ProfileScreenActivity> createState() => _ProfileScreenActivityState();
}

class _ProfileScreenActivityState extends State<ProfileScreenActivity> {
  ProfileUserProvider _profileuserProvider = ProfileUserProvider();

  @override
  void initState() {
    // TODO: implement initState
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();

    _profileuserProvider =
        Provider.of<ProfileUserProvider>(context, listen: false);
    _profileuserProvider.profileuserlist(AppHelper.userid ?? '');
  }

  bool showpop = false;
  bool light = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<DarkThemeProvider>(
        builder: (context, darkThemeProvider, child) {
      return Scaffold(
          backgroundColor: AppColors.primarycolor,
          appBar: AppBar(
            backgroundColor: AppColors.primarycolor,
            iconTheme: IconThemeData(
              color: AppColors.blackColor,
            ),
            elevation: 0,
            centerTitle: true,
            title: Text(Languages.of(context)!.profile,
                style: AppHelper.themelight
                    ? AppStyle.cardtitledark
                        .copyWith(fontSize: 18.sp, color: AppColors.blackColor)
                    : AppStyle.cardtitle.copyWith(
                        fontSize: 18.sp, color: AppColors.blackColor)),
          ),
          body: Consumer<ProfileUserProvider>(
              builder: ((context, profileUserProvider, child) {
            print(profileUserProvider.profileuserList);

            return Stack(
              children: [
                Container(
                  height: 8.h,
                  color: AppColors.primarycolor,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardTheme.color,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 1.h),
                      child: ListView(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(bottom: 1.h),
                              child: profileUserProvider
                                      .profileuserList.isNotEmpty
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          //  width: 250,
                                          height: 70,
                                          padding: EdgeInsets.only(left: 35.w),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        profileUserProvider
                                                                .profileuserList
                                                                .isNotEmpty
                                                            ? profileUserProvider
                                                                    .profileuserList[
                                                                        0]
                                                                    .firstName ??
                                                                ''
                                                            : '',
                                                        style: AppHelper
                                                                .themelight
                                                            ? AppStyle
                                                                .cardtitledark
                                                                .copyWith(
                                                                    fontSize:
                                                                        17.sp)
                                                            : AppStyle.cardtitle
                                                                .copyWith(
                                                                    fontSize:
                                                                        17.sp),
                                                      ),
                                                      SizedBox(
                                                        width: 1.w,
                                                      ),
                                                      Text(
                                                        profileUserProvider
                                                                .profileuserList
                                                                .isNotEmpty
                                                            ? profileUserProvider
                                                                    .profileuserList[
                                                                        0]
                                                                    .lastName ??
                                                                ''
                                                            : '',
                                                        style: AppHelper
                                                                .themelight
                                                            ? AppStyle
                                                                .cardtitledark
                                                                .copyWith(
                                                                    fontSize:
                                                                        17.sp)
                                                            : AppStyle.cardtitle
                                                                .copyWith(
                                                                    fontSize:
                                                                        17.sp),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    profileUserProvider
                                                            .profileuserList
                                                            .isNotEmpty
                                                        ? profileUserProvider
                                                                .profileuserList[
                                                                    0]
                                                                .emailAddress ??
                                                            ''
                                                        : '',
                                                    style: AppHelper.themelight
                                                        ? AppStyle
                                                            .cardsubtitledark
                                                        : AppStyle.cardsubtitle,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  : Container()),
                          SizedBox(
                            height: 3.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "55 kg",
                                    style: AppHelper.themelight
                                        ? AppStyle.cardtitledark
                                        : AppStyle.cardtitle,
                                  ),
                                  Text(
                                    "Weight",
                                    style: AppHelper.themelight
                                        ? AppStyle.cardsubtitledark
                                        : AppStyle.cardsubtitle,
                                  ),
                                ],
                              ),
                              VerticalDivider(
                                color: Colors.black,
                                thickness: 2,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "170 cm",
                                    style: AppHelper.themelight
                                        ? AppStyle.cardtitledark
                                        : AppStyle.cardtitle,
                                  ),
                                  Text(
                                    "Height",
                                    style: AppHelper.themelight
                                        ? AppStyle.cardsubtitledark
                                        : AppStyle.cardsubtitle,
                                  ),
                                ],
                              ),
                              VerticalDivider(
                                color: Colors.black, //color of divider
                                width: 10, //width space of divider
                                thickness: 3, //thickness of divier line
                                indent: 10, //Spacing at the top of divider.
                                endIndent:
                                    10, //Spacing at the bottom of divider.
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "18 year",
                                    style: AppHelper.themelight
                                        ? AppStyle.cardtitledark
                                        : AppStyle.cardtitle,
                                  ),
                                  Text(
                                    "Age",
                                    style: AppHelper.themelight
                                        ? AppStyle.cardsubtitledark
                                        : AppStyle.cardsubtitle,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          const Divider(
                            color: Colors.black12,
                            thickness: 1,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Settingwidgetui(
                            icon: Icons.edit,
                            title: Languages.of(context)!.editprofile,
                            onTap: () {
                              Navigator.pushNamed(context, Routes.editProfile,
                                  arguments: {
                                    AppStringFile.profileuserdata:
                                        profileUserProvider.profileuserList,
                                  }).then((value) {
                                _profileuserProvider
                                    .profileuserlist(AppHelper.userid ?? '');
                              });
                            },
                          ),
                          const Divider(
                            color: Colors.black12,
                            thickness: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.contrast,
                                    size: 2.5.h,
                                    color: AppColors.primarycolor,
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(
                                    Languages.of(context)!.darkmode,
                                    style: AppHelper.themelight
                                        ? AppStyle.cardsubtitledark
                                        : AppStyle.cardsubtitle,
                                  ),
                                ],
                              ),
                              Switch(
                                value: light,
                                activeColor: AppColors.primarycolor,
                                onChanged: (bool value) {
                                  // This is called when the user toggles the switch.
                                  setState(() {
                                    light = value;
                                    AppHelper.themelight =
                                        !AppHelper.themelight;
                                  });
                                  darkThemeProvider.darkThemessd(true);
                                },
                              ),
                            ],
                          ),
                          const Divider(
                            color: Colors.black12,
                            thickness: 1,
                          ),
                          Settingwidgetui(
                            icon: Icons.lock,
                            title: Languages.of(context)!.changepasswords,
                            onTap: () {
                              Navigator.pushNamed(
                                  context, Routes.changePassword);
                            },
                          ),
                          const Divider(
                            color: Colors.black12,
                            thickness: 1,
                          ),
                          Settingwidgetui(
                            icon: Icons.settings,
                            title: Languages.of(context)!.settings,
                            onTap: () {
                              Navigator.pushNamed(
                                  context, Routes.settingScreenActivity);
                            },
                          ),
                          const Divider(
                            color: Colors.black12,
                            thickness: 1,
                          ),
                          Settingwidgetui(
                            icon: Icons.share,
                            title: Languages.of(context)!.shareapp,
                            onTap: () {
                              Share.share(
                                  'hey! check out CoachbyApp https://play.google.com/store/apps/details?id=com.coachbyapp.app');
                            },
                          ),
                          const Divider(
                            color: Colors.black12,
                            thickness: 1,
                          ),
                          Settingwidgetui(
                            icon: Icons.logout,
                            title: Languages.of(context)!.logout,
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: Text(
                                    Languages.of(context)!.logout,
                                    style: AppHelper.themelight
                                        ? AppStyle.cardtitledark
                                            .copyWith(fontSize: 18.sp)
                                        : AppStyle.cardtitle
                                            .copyWith(fontSize: 18.sp),
                                  ),
                                  content: Text(
                                    Languages.of(context)!.logoutmsg,
                                    style: AppHelper.themelight
                                        ? AppStyle.cardsubtitledark
                                        : AppStyle.cardsubtitle,
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(ctx).pop();
                                      },
                                      child: Text(Languages.of(context)!.no,
                                          style: AppHelper.themelight
                                              ? AppStyle.cardtitledark
                                              : AppStyle.cardtitle),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        AppHelper.logout();
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pushNamedAndRemoveUntil(
                                                Routes.loginScreenActivity,
                                                (Route<dynamic> route) =>
                                                    false);
                                      },
                                      child: Text(Languages.of(context)!.yes,
                                          style: AppHelper.themelight
                                              ? AppStyle.cardtitledark
                                              : AppStyle.cardtitle),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          const Divider(
                            color: Colors.black12,
                            thickness: 1,
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "CoachbyApp \nVersion v1.0.0",
                                style: AppHelper.themelight
                                    ? AppStyle.cardsubtitledark
                                        .copyWith(fontSize: 13.sp)
                                    : AppStyle.cardsubtitle
                                        .copyWith(fontSize: 13.sp),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (showpop)
                  Center(child: EditLanguagePopup(
                    callback: (value) {
                      setState(() {
                        showpop = false;
                      });
                    },
                  )),
                Padding(
                  padding: EdgeInsets.only(top: 1.h, left: 7.w),
                  child: profileUserProvider.profileuserList.isNotEmpty
                      ? CircleAvatar(
                          radius: 6.5.h,
                          backgroundColor: AppColors.primarycolor,
                          child: CircleAvatar(
                            radius: 6.h,
                            backgroundColor:
                                AppColors.greyColor.withOpacity(0.3),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, Routes.editProfile,
                                    arguments: {
                                      AppStringFile.profileuserdata:
                                          profileUserProvider.profileuserList,
                                    }).then((value) {
                                  _profileuserProvider
                                      .profileuserlist(AppHelper.userid ?? '');
                                });
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 5.5.h,
                                backgroundImage: profileUserProvider
                                            .profileuserList[0].userAvatar !=
                                        null
                                    ? NetworkImage(APIURL.imageurl +
                                        profileUserProvider
                                            .profileuserList[0].userAvatar!)
                                    : AssetImage(
                                        AppImages.profile,
                                      ) as ImageProvider,
                              ),
                            ),
                          ),
                        )
                      : Container(),
                )
              ],
            );
          })));
    });
  }
}
