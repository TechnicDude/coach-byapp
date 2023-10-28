import 'dart:developer';
import 'package:alpersonalcoachingapp/api/loginapi.dart';
import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:alpersonalcoachingapp/page_routes/routes.dart';
import 'package:alpersonalcoachingapp/utils/app_string.dart';
import 'package:alpersonalcoachingapp/utils/app_validator.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/utils/appstyle.dart';
import 'package:alpersonalcoachingapp/utils/buttonwidget.dart';
import 'package:alpersonalcoachingapp/utils/dialoghelper.dart';
import 'package:alpersonalcoachingapp/utils/textform.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInForm extends StatefulWidget {
  final Function callback;
  const SignInForm({
    Key? key,
    required this.callback,
  }) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isShowLoading = false;
  bool _obscureText = true;
  String error = "";

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  bool isLoading = false;
  bool valuedata = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Languages.of(context)!.email,
            style: AppHelper.themelight
                ? AppStyle.cardtitledark
                : AppStyle.cardtitle,
          ),
          TextFormScreen(
            textEditingController: emailController,
            hinttext: Languages.of(context)!.email,
            icon: Icons.email,
            validator: AppValidator.emailValidator,
          ),
          SizedBox(
            height: 1.5.h,
          ),
          Text(
            Languages.of(context)!.password,
            style: AppHelper.themelight
                ? AppStyle.cardtitledark
                : AppStyle.cardtitle,
          ),
          TextFormScreen(
            hinttext: Languages.of(context)!.password,
            icon: Icons.lock,
            textEditingController: passwordController,
            validator: AppValidator.passwordValidator,
            suffixIcon: true,
            obscure: _obscureText,
            onPressed: _toggle,
          ),
          SizedBox(
            height: 1.h,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.forgetPassword);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  Languages.of(context)!.forgotpasswords,
                  style: AppHelper.themelight
                      ? AppStyle.cardsubtitledark
                      : AppStyle.cardsubtitle,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            children: [
              Checkbox(
                value: valuedata,
                onChanged: (value) {
                  setState(() {
                    valuedata = value!;
                  });
                },
              ),
              Row(
                children: [
                  Text(
                    Languages.of(context)!.iacceptthe,
                    style: AppHelper.themelight
                        ? AppStyle.cardsubtitledark
                        : AppStyle.cardsubtitle,
                  ),
                  Text(
                    Languages.of(context)!.termsandcondition,
                    style: AppStyle.cardsubtitle.copyWith(color: Colors.blue),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 3.h,
          ),
          Center(
            child: Text(
              error,
              style: AppStyle.cardtitledark.copyWith(color: Colors.red),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          ButtonWidget(
            text: Languages.of(context)!.login,
            onTap: () {
              if (isLoading) {
                return;
              }

              login(emailController.text, passwordController.text);
            },
          )
        ],
      ),
    );
  }

  login(email, password) async {
    setState(() {
      isLoading = true;
      widget.callback(true);
    });

    final bool isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected) {
      if (_formKey.currentState!.validate()) {
        if (valuedata) {
          setState(() {
            isLoading = false;
            widget.callback(false);
          });

          var data = {
            "email": emailController.text.toString().trim(),
            "password": passwordController.text.toString().trim(),
          };
          LoginApi loginApi = LoginApi(data);
          final response = await loginApi.login();

          log(response.toString());

          if (response['status'].toString().toLowerCase() == "success") {
            //  Map<String, dynamic> res = response['user'];

            AppHelper.AUTH_TOKEN_VALUE = response['accessToken'];
            AppHelper.email_VALUE = response['user']['emailAddress'];
            AppHelper.userid = response['user']['id'].toString();
            AppHelper.firstName = response['user']['firstName'].toString();
            AppHelper.lastName = response['user']['lastName'].toString();
            AppHelper.userAvatar = response['user']['userAvatar'].toString();

            // AppHelper.role = response['user']['userRole']['id'].toString();

            SharedPreferences sharedPreferences =
                await SharedPreferences.getInstance();
            sharedPreferences.setString(
                AppStringFile.userid, response['user']['id'].toString());

            sharedPreferences.setString(AppStringFile.email,
                response['user']['emailAddress'].toString());

            sharedPreferences.setString(
                AppStringFile.name, response['user']['firstName'].toString());

            sharedPreferences.setString(AppStringFile.lastname,
                response['user']['lastName'].toString());

            sharedPreferences.setString(AppStringFile.userAvatar,
                response['user']['userAvatar'].toString());

            sharedPreferences.setString(
                AppStringFile.authtoken, response['accessToken'].toString());

            // sharedPreferences.setString(AppStringFile.role,
            //     response['user']['userRole']['id'].toString());

            String? token;
            try {
              token = (await FirebaseMessaging.instance.getToken())!;
              print(token);
            } catch (e) {
              print(e);
            }
            var body = {"facId": token};
            LoginApi responsefcmtoken = LoginApi(body);

            final responsefcmtokenreturn =
                await responsefcmtoken.factokenregister();
            print(responsefcmtokenreturn);

            DialogHelper.showFlutterToast(
                strMsg: Languages.of(context)!.loginsussces);

            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.dashBoardScreenActivity,
              (Route<dynamic> route) => false,
              arguments: {AppStringFile.email: emailController.text},
            );
            setState(() {
              widget.callback(false);
              isLoading = false;
            });
          } else {
            DialogHelper.showFlutterToast(strMsg: response['error'].toString());
            setState(() {
              error = response['error'].toString();
              widget.callback(false);
              isLoading = false;
            });
          }
        } else {
          AppHelper().dialogBuilder(context, Languages.of(context)!.alert,
              Languages.of(context)!.pleaseaccettermesandcondtions);
          setState(() {
            widget.callback(false);
            isLoading = false;
          });
        }
      } else {
        setState(() {
          isLoading = false;
          widget.callback(false);
        });
      }
    } else {
      AppHelper().dialogBuilder(
          context, "", Languages.of(context)!.internetnotavailable);
      setState(() {
        isLoading = false;
        widget.callback(false);
      });
    }
  }
}
