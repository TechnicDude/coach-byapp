import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/utils/appbarforall.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/appimage.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarScreens(
            title: Languages.of(context)!.notifications,
          )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          top: 2.h, left: 1.5.h, right: 1.5.h, bottom: 0.2.h),
                      child: InkWell(
                        child: Slidable(
                          actionPane: SlidableDrawerActionPane(),
                          actionExtentRatio: 0.25,
                          secondaryActions: <Widget>[
                            IconSlideAction(
                              caption: Languages.of(context)!.delete,
                              //"delete",
                              onTap: () {
                                _dialogBuilder(context);
                              },
                              iconWidget: Center(
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                  size: 25,
                                ),
                              ),
                            ),
                          ],
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardTheme.color,
                                  borderRadius: BorderRadius.circular(3.w),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(1.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                          radius: 4.h,
                                          backgroundImage: AssetImage(
                                            AppImages
                                                .welcomescreenillimagethree,
                                          )),
                                      SizedBox(
                                        width: 4.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 65.w,
                                            child: Text(
                                                'Fitness Tips and tricks Gillar center',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: AppHelper.themelight
                                                    ? AppStyle.cardtitledark
                                                    : AppStyle.cardtitle),
                                          ),
                                          SizedBox(
                                            height: 0.4.h,
                                          ),
                                          SizedBox(
                                            width: 65.w,
                                            child: Text(
                                              'The base use cases for GetSocial Notifications API is to build notify',
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: AppHelper.themelight
                                                  ? AppStyle.cardsubtitledark
                                                      .copyWith(fontSize: 14.sp)
                                                  : AppStyle.cardsubtitle
                                                      .copyWith(
                                                          fontSize: 14.sp),
                                            ),
                                          ),
                                          Divider(),
                                          Text(
                                            "Just now",
                                            style: AppHelper.themelight
                                                ? AppStyle.cardtitledark
                                                    .copyWith(fontSize: 13.sp)
                                                : AppStyle.cardtitle
                                                    .copyWith(fontSize: 13.sp),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }

  _dialogBuilder(
    BuildContext context,
  ) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(Languages.of(context)!.alert),
          content: Text(Languages.of(context)!.deletealertnmsg),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: Text(Languages.of(context)!.no),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: Text(Languages.of(context)!.yes),
              onPressed: () {
                //  delete(id);
              },
            ),
          ],
        );
      },
    );
  }
}
