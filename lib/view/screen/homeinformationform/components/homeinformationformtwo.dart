import 'package:alpersonalcoachingapp/page_routes/routes.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:alpersonalcoachingapp/utils/submitbutton.dart';
import 'package:alpersonalcoachingapp/view/screen/homeinformationform/components/homeinformationformwidgetui.dart';
import 'package:alpersonalcoachingapp/view/screen/homeinformationform/components/homeinformationformwidgetwhiteui.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Homeinformationformtwo extends StatefulWidget {
  const Homeinformationformtwo({super.key});

  @override
  State<Homeinformationformtwo> createState() => _HomeinformationformtwoState();
}

class _HomeinformationformtwoState extends State<Homeinformationformtwo> {
  String? gender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,

      //  backgroundColor: AppColors.backgroundColorgrey,
      // bottomNavigationBar: SubmitButton(
      //   text: "Forsatt",
      //   onTap: () {
      //     // Navigator.pushNamed(context, Routes.homeinformationformtwo);
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
              //       "Foregaende vecka",
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
                  Text(
                    "Hur har veckan gatt ?*",
                    style: AppStyle.cardtitle.copyWith(color: Colors.black),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     color: AppColors.primarycolor,
                  //     borderRadius: BorderRadius.all(Radius.circular(1.h)),
                  //     border:
                  //         Border.all(color: AppColors.primarycolor, width: 2),
                  //     boxShadow: [
                  //       BoxShadow(
                  //         color: Colors.grey,
                  //         spreadRadius: 1,
                  //         blurRadius: 1,
                  //         offset: Offset(1, 1),
                  //       ),
                  //     ],
                  //   ),
                  //   child: RadioListTile(
                  //     title: Text(
                  //       "Male",
                  //       style: AppStyle.cardtitle.copyWith(color: Colors.black),
                  //     ),
                  //     value: "male",
                  //     groupValue: gender,
                  //     onChanged: (value) {
                  //       setState(() {
                  //         gender = value.toString();
                  //       });
                  //     },
                  //   ),
                  // ),

                  HomeinformationformUiScreenACtivity(
                    title: "Okej",
                    color: AppColors.primarycolor,
                  ),

                  SizedBox(
                    height: 1.h,
                  ),
                  HomeinformationformUiwhiteScreenACtivity(
                    title: "Mandag",
                    color: AppColors.whiteColor,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  HomeinformationformUiScreenACtivity(
                    title: "Okej",
                    color: AppColors.primarycolor,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  HomeinformationformUiScreenACtivity(
                    title: "Mindo",
                    color: AppColors.primarycolor,
                  ),
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Utmaningar du klarat av?*",
                    style: AppStyle.cardtitle.copyWith(color: Colors.black),
                  ),
                  TextFormField(
                      keyboardType: TextInputType.multiline,
                      minLines: 4,
                      maxLines: 4,
                      // maxLength: 1000,
                      decoration: InputDecoration(
                        fillColor: Theme.of(context).cardTheme.color,

                        // Colors.white,
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(1.h),
                            borderSide:
                                BorderSide(color: AppColors.blackColor)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.greyColor),
                        ),
                      ))
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Foldjde du din plan ?*",
                    style: AppStyle.cardtitle.copyWith(color: Colors.black),
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
                          borderSide: BorderSide(color: AppColors.greyColor),
                        ),
                      ))
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
