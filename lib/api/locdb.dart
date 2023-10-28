import 'package:alpersonalcoachingapp/api/likeapi.dart';
import 'package:alpersonalcoachingapp/utils/app_string.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocDb {
  LocDb._internal();
  static final LocDb _db = LocDb._internal();
  factory LocDb() {
    return _db;
  }
  bool loginapp = false;

  Future<bool> isLoggedIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    AppHelper.AUTH_TOKEN_VALUE = preferences.getString(AppStringFile.authtoken);
    AppHelper.userid = preferences.getString(AppStringFile.userid);
    AppHelper.email_VALUE = preferences.getString(AppStringFile.email);
    AppHelper.role = preferences.getString(AppStringFile.role);
    AppHelper.language = preferences.getString("SelectedLanguageCode");
    AppHelper.firstName = preferences.getString(AppStringFile.name);
    AppHelper.lastName = preferences.getString(AppStringFile.lastname);
    // AppHelper.emailAddress = preferences.getString(AppStringFile.email);
    AppHelper.userAvatar = preferences.getString(AppStringFile.userAvatar);

    if (AppHelper.userid == null || AppHelper.userid == false) {
      print("object check");
      loginapp = false;
      return false;
    } else {
      LikeApi registerresponse = LikeApi();

      final response = await registerresponse.meapi();

      print(response);
      if (response['status'].toString().toLowerCase() == "error") {
        AppHelper.logout();
        return false;
      } else {
        loginapp = true;
        return true;
      }
    }
  }
}
