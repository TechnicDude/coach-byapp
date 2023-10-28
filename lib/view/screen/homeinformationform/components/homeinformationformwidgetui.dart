import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeinformationformUiScreenACtivity extends StatefulWidget {
  final String title;
  final color;
  const HomeinformationformUiScreenACtivity({
    super.key,
    required this.title,
    required this.color,
  });

  @override
  State<HomeinformationformUiScreenACtivity> createState() =>
      _HomeinformationformUiScreenACtivityState();
}

class _HomeinformationformUiScreenACtivityState
    extends State<HomeinformationformUiScreenACtivity> {
  String? gender;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.all(Radius.circular(1.h)),
        border: Border.all(color: AppColors.primarycolor, width: 2),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey,
        //     spreadRadius: 1,
        //     blurRadius: 1,
        //     offset: Offset(1, 1),
        //   ),
        // ],
      ),
      child: RadioListTile(
        title: Text(
          widget.title,
          // "Male",
          style: AppStyle.cardtitle.copyWith(color: Colors.black),
        ),
        value: "male",
        groupValue: gender,
        onChanged: (value) {
          setState(() {
            gender = value.toString();
          });
        },
      ),
    );
  }
}
