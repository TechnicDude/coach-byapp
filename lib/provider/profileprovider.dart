import 'package:alpersonalcoachingapp/api/api.dart';
import 'package:alpersonalcoachingapp/api/network.dart';
import 'package:alpersonalcoachingapp/model/profilemodel.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:flutter/material.dart';

class ProfileUserProvider extends ChangeNotifier {
  ProfileUserModel profileuserModel = ProfileUserModel();

  List<ProfileUserData> _profileuserlist = [];
  List<ProfileUserData> get profileuserList => _profileuserlist;

  bool datanotfound = false;

  Future profileuserlist(String email) async {
    // print("object data");
    var url = APIURL.HOME + '/' + AppHelper.userid!;
    // var url = APIURL.USERPROFILE;
    ServiceWithHeader _service = new ServiceWithHeader(url);
    final response = await _service.data();
    // print(response);
    _profileuserlist = [];
    profileuserModel = ProfileUserModel.fromJson(response);
    if (profileuserModel.data != null) {
      var profileuser = profileuserModel.data;
      _profileuserlist.add(profileuser!);
      notifyListeners();
    }
  }
}
