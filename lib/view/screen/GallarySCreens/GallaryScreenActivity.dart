import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/utils/appbarforall.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/appimage.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:alpersonalcoachingapp/utils/dialoghelper.dart';
import 'package:alpersonalcoachingapp/view/screen/homeinformationform/components/infocontainerboxUI.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GallaryScreenActivity extends StatefulWidget {
  const GallaryScreenActivity({super.key});

  @override
  State<GallaryScreenActivity> createState() => _GallaryScreenActivityState();
}

class _GallaryScreenActivityState extends State<GallaryScreenActivity> {
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
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarScreens(
            title: Languages.of(context)!.gallary,
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(2.h),
          child: Column(
            children: [
              Text(
                "Please Choose your image",
                maxLines: 4,
                style: AppHelper.themelight
                    ? AppStyle.cardtitledark.copyWith(fontSize: 18.sp)
                    : AppStyle.cardtitle.copyWith(fontSize: 18.sp),
              ),
              SizedBox(
                height: 2.h,
              ),
              InfoContainerboxUI(
                title: "Framsida",
                subtitle: "Choose your image ",
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
                subtitle: "Select your images",
                image: AppImages.bodyside,
                onTap: () {
                  openImages();
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              InfoContainerboxUI(
                title: "Profil",
                subtitle: "Select your images",
                image: AppImages.bodyback,
                onTap: () {
                  openImages();
                },
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
