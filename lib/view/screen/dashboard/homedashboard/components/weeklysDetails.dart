import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class WeekLyDetailsScreenActivity extends StatelessWidget {
  const WeekLyDetailsScreenActivity({super.key});

  @override
  Widget build(BuildContext context) {
    double progressValue = 70;
    return Container(
      height: 80.w,
      // width: 100.w,
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
                markerWidth: 40,
                markerHeight: 40,
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
                      'Du har gatt ner',
                      style: AppHelper.themelight
                          ? AppStyle.cardtitledark
                          : AppStyle.cardtitle,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      progressValue.toStringAsFixed(0) + ' Kg',
                      style: AppHelper.themelight
                          ? AppStyle.cardtitledark.copyWith(fontSize: 22.sp)
                          : AppStyle.cardtitle.copyWith(fontSize: 22.sp),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      'av malet pa 22',
                      style: AppHelper.themelight
                          ? AppStyle.cardtitledark
                          : AppStyle.cardtitle,
                    ),
                  ],
                ),
              ),
              // GaugeAnnotation(
              //     positionFactor: 0,
              //     widget: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       mainAxisAlignment: MainAxisAlignment.end,
              //       children: [
              //         Text(
              //           'Vecka 3',
              //           style: AppStyle.cardsubtitle,
              //         ),
              //       ],
              //     ))
            ]),
      ]),
    );
  }
}
