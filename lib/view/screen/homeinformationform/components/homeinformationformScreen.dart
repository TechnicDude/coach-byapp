import 'package:alpersonalcoachingapp/page_routes/routes.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/utils/app_validator.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/appimage.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:alpersonalcoachingapp/utils/dialoghelper.dart';
import 'package:alpersonalcoachingapp/utils/informationform.dart';
import 'package:alpersonalcoachingapp/utils/submitbutton.dart';
import 'package:alpersonalcoachingapp/utils/textform.dart';
import 'package:alpersonalcoachingapp/view/screen/CoachmanPlanScreens/components/coachmanfourscreenUI.dart';
import 'package:alpersonalcoachingapp/view/screen/homeinformationform/components/infocontainerboxUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeInformationFormScreenActivity extends StatefulWidget {
  const HomeInformationFormScreenActivity({super.key});

  @override
  State<HomeInformationFormScreenActivity> createState() =>
      _HomeInformationFormScreenActivityState();
}

class _HomeInformationFormScreenActivityState
    extends State<HomeInformationFormScreenActivity> {
  bool isChecked = false;
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  final ImagePicker imgpicker = ImagePicker();
  XFile? imagefiles;

  openImages() async {
    try {
      final XFile? image =
          await imgpicker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        imagefiles = image;
        setState(() {});
      } else {
        DialogHelper.showFlutterToast(strMsg: 'No image is selected');
      }
    } catch (e) {
      DialogHelper.showFlutterToast(strMsg: 'Error while picking file');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(left: 2.h, right: 2.h, top: 1.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Vikt*",
                            style: AppHelper.themelight
                                ? AppStyle.cardtitledark
                                : AppStyle.cardtitle,
                          ),
                          InformationTextFormScreen(
                            hinttext: "viceps",
                            icon: Icons.bubble_chart,
                            keyboardType: TextInputType.number,
                            textEditingController: lastnameController,
                            validator: AppValidator.lastnameValidator,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Biceps*",
                            // Languages.of(context)!.enterdescription,
                            style: AppHelper.themelight
                                ? AppStyle.cardtitledark
                                : AppStyle.cardtitle,
                          ),
                          InformationTextFormScreen(
                            hinttext: "biceps",
                            keyboardType: TextInputType.number,
                            icon: Icons.bubble_chart,
                            textEditingController: lastnameController,
                            validator: AppValidator.lastnameValidator,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Rumpa*",
                            // Languages.of(context)!.enterdescription,
                            style: AppHelper.themelight
                                ? AppStyle.cardtitledark
                                : AppStyle.cardtitle,
                          ),
                          InformationTextFormScreen(
                            hinttext: "rumpa",
                            keyboardType: TextInputType.number,
                            icon: Icons.bubble_chart,
                            textEditingController: lastnameController,
                            validator: AppValidator.lastnameValidator,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Midja*",
                            // Languages.of(context)!.enterdescription,
                            style: AppHelper.themelight
                                ? AppStyle.cardtitledark
                                : AppStyle.cardtitle,
                          ),
                          InformationTextFormScreen(
                            hinttext: "midja",
                            icon: Icons.bubble_chart,
                            keyboardType: TextInputType.number,
                            textEditingController: lastnameController,
                            validator: AppValidator.lastnameValidator,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Lar*",
                            // Languages.of(context)!.enterdescription,
                            style: AppHelper.themelight
                                ? AppStyle.cardtitledark
                                : AppStyle.cardtitle,
                          ),
                          InformationTextFormScreen(
                            hinttext: "lar",
                            keyboardType: TextInputType.number,
                            icon: Icons.bubble_chart,
                            textEditingController: lastnameController,
                            validator: AppValidator.lastnameValidator,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Antal steg i snitt veckan*",
                            // Languages.of(context)!.enterdescription,
                            style: AppHelper.themelight
                                ? AppStyle.cardtitledark
                                : AppStyle.cardtitle,
                          ),
                          InformationTextFormScreen(
                            hinttext: "biceps",
                            icon: Icons.bubble_chart,
                            keyboardType: TextInputType.number,
                            textEditingController: lastnameController,
                            validator: AppValidator.lastnameValidator,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Divider(
                        color: AppColors.primarycolor.withOpacity(0.4),
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Blider(Frivilligt, men fordelaktigt)",
                            // Languages.of(context)!.enterdescription,
                            style: AppHelper.themelight
                                ? AppStyle.cardtitledark
                                : AppStyle.cardtitle,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      InfoContainerboxUI(
                        title: "Framsida",
                        subtitle: "Tryck for att ladda upp bild",
                        image: AppImages.bodyfront,
                        onTap: () {
                          openImages();
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      InfoContainerboxUI(
                        title: "Profil",
                        subtitle: "Tryck for att ladda upp bild",
                        image: AppImages.bodyside,
                        onTap: () {
                          openImages();
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      InfoContainerboxUI(
                        title: "Baksida",
                        subtitle: "Tryck for att ladda upp bild",
                        image: AppImages.bodyback,
                        onTap: () {
                          openImages();
                        },
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
