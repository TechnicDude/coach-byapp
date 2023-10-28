// ignore_for_file:

import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class WeekLyDetailsmeasurmentScreenActivity extends StatelessWidget {
  final String title;
  final String title2;

  const WeekLyDetailsmeasurmentScreenActivity({
    super.key,
    required this.title,
    required this.title2,
  });

  @override
  Widget build(BuildContext context) {
    double progressValue = 40;
    return Center(
      child: Container(
        height: 30.w,
        width: 30.w,
        decoration: BoxDecoration(
          color: Theme.of(context).cardTheme.color,
          borderRadius: BorderRadius.circular(3.w),
        ),
        child: SfRadialGauge(axes: <RadialAxis>[
          RadialAxis(
              minimum: 0,
              maximum: 100,
              showLabels: false,
              showTicks: false,
              startAngle: 270,
              endAngle: 270,
              radiusFactor: 0.8,
              axisLineStyle: AxisLineStyle(
                thickness: 0.2,
                color: AppColors.primarycolor.withOpacity(.2),
                thicknessUnit: GaugeSizeUnit.factor,
              ),
              pointers: <GaugePointer>[
                RangePointer(
                    value: progressValue,
                    width: 0.2,
                    sizeUnit: GaugeSizeUnit.factor,
                    cornerStyle: CornerStyle.startCurve,
                    gradient: const SweepGradient(colors: <Color>[
                      AppColors.primarycolor,
                      AppColors.primarycolor
                    ], stops: <double>[
                      0.25,
                      0.75
                    ])),
                MarkerPointer(
                  value: progressValue,
                  markerType: MarkerType.circle,
                  color: AppColors.primarycolor,
                  markerWidth: 15,
                  markerHeight: 15,
                )
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                  positionFactor: 0,
                  widget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: AppHelper.themelight
                            ? AppStyle.cardsubtitledark
                                .copyWith(fontSize: 14.sp)
                            : AppStyle.cardsubtitle.copyWith(fontSize: 14.sp),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Text(
                        title2,
                        style: AppHelper.themelight
                            ? AppStyle.cardsubtitledark
                            : AppStyle.cardsubtitle,
                      ),
                    ],
                  ),
                ),
              ]),
        ]),
      ),
    );
  }
}
