import 'package:alpersonalcoachingapp/page_routes/routes.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:alpersonalcoachingapp/utils/submitbutton.dart';
import 'package:alpersonalcoachingapp/view/screen/homeinformationform/components/homeinformationformwidgetui.dart';
import 'package:alpersonalcoachingapp/view/screen/homeinformationform/components/homeinformationformwidgetwhiteui.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Homeinformationformthree extends StatefulWidget {
  const Homeinformationformthree({super.key});

  @override
  State<Homeinformationformthree> createState() =>
      _HomeinformationformthreeState();
}

class _HomeinformationformthreeState extends State<Homeinformationformthree> {
  String? gender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,

      // backgroundColor: AppColors.backgroundColorgrey,
      // bottomNavigationBar: SubmitButton(
      //   text: "Skicha in!",
      //   onTap: () {
      //     Navigator.pushNamed(context, Routes.homeinformationformtwo);
      //   },
      // ),
      body: Padding(
        padding: EdgeInsets.only(left: 2.h, right: 2.h, top: 1.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     Text(
              //       "Kommande vecka",
              //       // Languages.of(context)!.enterdescription,
              //       style: AppStyle.cardtitle
              //           .copyWith(color: Colors.black, fontSize: 18.sp),
              //     ),
              //   ],
              // ),
              // SizedBox(
              //   height: 1.h,
              // ),
              // Divider(
              //   thickness: 1,
              //   color: AppColors.greyColor,
              // ),
              SizedBox(
                height: 1.h,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hur du planerat din kommande vecka ?*",
                        style: AppStyle.cardtitle.copyWith(color: Colors.black),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      HomeinformationformUiScreenACtivity(
                        title: "Ja, det har jag",
                        color: AppColors.primarycolor,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      HomeinformationformUiwhiteScreenACtivity(
                        title: "Mandag",
                        color: AppColors.whiteColor,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hur du planerat din kommande vecka ?*",
                        style: AppStyle.cardtitle.copyWith(color: Colors.black),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      HomeinformationformUiScreenACtivity(
                        title: "Ja, det har jag",
                        color: AppColors.primarycolor,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      HomeinformationformUiScreenACtivity(
                        title: "Women",
                        color: AppColors.primarycolor,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      HomeinformationformUiScreenACtivity(
                        title: "Okej",
                        color: AppColors.primarycolor,
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Text(
                        "Utmaningar du klarat av Utmaningar du klarat av?*",
                        style: AppStyle.cardtitle.copyWith(color: Colors.black),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      TextFormField(
                          keyboardType: TextInputType.multiline,
                          minLines: 4,
                          maxLines: 4,
                          // maxLength: 1000,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                // borderSide:
                                //     BorderSide(color: AppColors.blackColor)
                                ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(1.h),
                                borderSide:
                                    BorderSide(color: AppColors.blackColor)),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.greyColor),
                            ),
                          ))
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
