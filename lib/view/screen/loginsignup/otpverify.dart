import 'dart:io';

import 'package:alpersonalcoachingapp/api/loginapi.dart';
import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/page_routes/routes.dart';
import 'package:alpersonalcoachingapp/utils/appColors.dart';
import 'package:alpersonalcoachingapp/utils/app_string.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:alpersonalcoachingapp/utils/buttonwidget.dart';
import 'package:alpersonalcoachingapp/utils/dialoghelper.dart';
import 'package:alpersonalcoachingapp/utils/loaderscreen.dart';
import 'package:alpersonalcoachingapp/utils/mainbar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpVerify extends StatefulWidget {
  final String? id;
  final String? email;
  final String? userid;
  final String? pagetype;
  const OtpVerify({Key? key, this.id, this.email, this.pagetype, this.userid})
      : super(key: key);

  @override
  State<OtpVerify> createState() => _OtpVerifyState();
}

class _OtpVerifyState extends State<OtpVerify> {
  bool isLoading = false;
  String _finalotp = '';
  String _error = '';

  forgotPassword(String email) async {
    var data = {
      'email': email,
    };
    print(email.toString());
    LoginApi registerresponse = LoginApi(data);
    final response = await registerresponse.sentotp();
    if (response['status'].toString() == "success") {
      // Navigator.pushNamed(context, Routes.otpVerify, arguments: {
      //   StringFile.email: email,
      //   StringFile.pagetype: StringFile.forgot_password,
      //   // StringFile.id: response['user']['id'],
      // });
      DialogHelper.showFlutterToast(strMsg: "success");
    } else {
      setState(() {
        _error = response['_error'].toString();
        isLoading = false;
      });
    }
  }

  Future<void> fetchdata() async {
    final bool isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected) {
      if (_finalotp.length == 6) {
        var data = {
          'email': widget.email,
          'otp': _finalotp,
        };
        LoginApi registerresponse = LoginApi(data);
        var response;
        if (widget.pagetype == AppStringFile.forgot_password) {
          response = await registerresponse.verifyOtp();

          print(response);
          print(data.toString());
          if (response['status'].toString().toLowerCase() == "success") {
            Navigator.pushNamed(context, Routes.setnewPassword, arguments: {
              AppStringFile.email: widget.email,
              AppStringFile.id: widget.id,
              AppStringFile.otp: _finalotp,
            });
            // DialogHelper.showFlutterToast(
            // strMsg: Languages.of(context)!.otpsendsuccessfully);
            DialogHelper.showFlutterToast(
                strMsg: "Otp Verification Done Successfully");
            setState(() {
              isLoading = false;
            });
          } else {
            DialogHelper.showFlutterToast(strMsg: "Registration Failed!");
            setState(() {
              _error = response['error'];
            });
          }
        } else {
          print("object data new");
          // response = await registerresponse.forgetverifyOtp();
          response = await registerresponse.verifyOtp();
          print(response);
          print(data.toString());
          if (response['status'].toString().toLowerCase() == "success") {
            Map<String, dynamic> res = response['user'];
            SharedPreferences sharedPreferences =
                await SharedPreferences.getInstance();

            AppHelper.userid = res['id'].toString();
            AppHelper.email_VALUE = widget.email;
            AppHelper.AUTH_TOKEN_VALUE = response['accessToken'].toString();

            sharedPreferences.setString(
                AppStringFile.userid, res['id'].toString());

            sharedPreferences.setString(
                AppStringFile.email, widget.email.toString());
            sharedPreferences.setString(
                AppStringFile.authtoken, response['accessToken'].toString());

            DialogHelper.showFlutterToast(strMsg: response['message']);
            String? token;
            // try {
            //   token = (await FirebaseMessaging.instance.getToken())!;
            //   print(token);
            // } catch (e) {
            //   print(e);
            // }
            var body = {"facId": token};
            LoginApi responsefcmtoken = LoginApi(body);
            final responsefcmtokenreturn =
                await responsefcmtoken.factokenregister();
            print(responsefcmtokenreturn);
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.dashBoardScreenActivity, (route) => false);
          } else {
            print(response);
            DialogHelper.showFlutterToast(strMsg: response['error']);
            setState(() {
              _error = response['error'].toString();
              isLoading = false;
            });
          }
        }
      }
    } else {
      setState(() {
        isLoading = false;
      });
      DialogHelper().shoppopDialog(context);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 4.h, right: 2.h, left: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Platform.isAndroid
                          ? Icons.arrow_back
                          : Icons.arrow_back_ios,
                    ),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ],
              ),
              MainBar(
                text: Languages.of(context)!.verifyaccount,
                subtext: Languages.of(context)!.verifyaccountmsg,
              ),
              SizedBox(
                height: 6.h,
              ),
              PinCodeTextField(
                appContext: context,
                length: 6,
                obscureText: false,
                cursorColor: AppColors.blackColor,
                //animationType: AnimationType.fade,

                pastedTextStyle: TextStyle(
                  color: AppColors.primarycolor,
                  fontWeight: FontWeight.bold,
                ),
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  disabledColor: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(1.h),
                  fieldHeight: 100.w / 8,
                  fieldWidth: 100.w / 8,
                  activeFillColor:
                      Theme.of(context).appBarTheme.backgroundColor,
                  // Theme.of(context).colorScheme.primary,

                  inactiveColor: AppColors.greyColor,
                  inactiveFillColor: AppColors.whiteColor,
                  selectedFillColor: AppColors.whiteColor,
                  selectedColor: AppColors.primarycolor,
                  activeColor: Theme.of(context).appBarTheme.backgroundColor,
                ),

                animationDuration: Duration(milliseconds: 300),
                enableActiveFill: true,
                onCompleted: (v) {
                  print("Completed");
                  _finalotp = v;
                  print(_finalotp);
                },
                onChanged: (value) {
                  print(value);
                  setState(() {
                    // currentText = value;
                  });
                },
                beforeTextPaste: (text) {
                  print("Allowing to paste $text");
                  return true;
                },
              ),
              SizedBox(
                height: 3.h,
              ),
              Center(
                child: Text(
                  _error,
                  style: AppStyle.cardsubtitle
                      .copyWith(color: Colors.red, fontSize: 15.sp),
                ),
              ),
              Center(
                child: Text(Languages.of(context)!.plzenterotpverify,
                    style: AppHelper.themelight
                        ? AppStyle.cardsubtitledark
                        : AppStyle.cardsubtitle),
              ),
              SizedBox(
                height: 6.h,
              ),
              // ButtonWidget(
              //   onTap: () {
              //     //singIn(context);
              //   },
              //   text: Languages.of(context)!.submit,
              // ),

              !isLoading
                  ? ButtonWidget(
                      text: Languages.of(context)!.submit,
                      onTap: () {
                        setState(() {
                          _error = '';
                        });

                        fetchdata();
                      })
                  : LoaderScreen(),

              SizedBox(
                height: 2.h,
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: Languages.of(context)!.otpnotrecive,
                    style: AppStyle.cardsubtitle.copyWith(color: Colors.grey),
                    children: <TextSpan>[
                      TextSpan(
                          text: Languages.of(context)!.resend,
                          style: AppHelper.themelight
                              ? AppStyle.cardsubtitledark
                              : AppStyle.cardsubtitle,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              forgotPassword(widget.email!);
                            }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
