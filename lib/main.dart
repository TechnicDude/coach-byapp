import 'package:alpersonalcoachingapp/localization/locale_constants.dart';
import 'package:alpersonalcoachingapp/localization/localizations_delegate.dart';
import 'package:alpersonalcoachingapp/page_routes/route_generate.dart';
import 'package:alpersonalcoachingapp/page_routes/routes.dart';
import 'package:alpersonalcoachingapp/provider/ThemeProvider.dart';
import 'package:alpersonalcoachingapp/theme/dark_theme.dart';
import 'package:alpersonalcoachingapp/theme/light_theme.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static void setLocale(BuildContext context, Locale newLocale) {
    var state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(newLocale);
  }

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() async {
    getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return StreamProvider<InternetConnectionStatus>(
        initialData: InternetConnectionStatus.connected,
        create: (_) {
          return InternetConnectionChecker().onStatusChange;
        },
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider<DarkThemeProvider>(
                create: (_) => DarkThemeProvider()),
          ],
          child: Consumer<DarkThemeProvider>(builder: (context, value, child) {
            return MaterialApp(
                builder: (context, child) {
                  AppHelper.themelight = !value.darkTheme;

                  return MediaQuery(
                    child: child!,
                    data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  );
                },
                title: 'CoachbyApp',
                debugShowCheckedModeBanner: false,
                locale: _locale,
                initialRoute: Routes.splashScreen,
                onGenerateRoute: RouteGenerator.generateRoute,
                theme: value.darkTheme ? lighttheme : darktheme,
                supportedLocales: [
                  Locale('en', ''), // english
                  Locale('sv', ''), // swedish
                ],
                localizationsDelegates: [
                  AppLocalizationsDelegate(),
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                localeResolutionCallback: (locale, supportedLocales) {
                  for (var supportedLocale in supportedLocales) {
                    if (supportedLocale.languageCode == locale?.languageCode &&
                        supportedLocale.countryCode == locale?.countryCode) {
                      return supportedLocale;
                    }
                  }
                  return supportedLocales.first;
                });
          }),
        ),
      );
    });
  }
}

const defaultInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(16)),
  borderSide: BorderSide(
    color: Color(0xFFDEE3F2),
    width: 1,
  ),
);
