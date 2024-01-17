import 'package:flutter/material.dart';

class LoginInfo extends ChangeNotifier {
  var _userName = '';
  String get userName => _userName;
  bool get loggedIn => _userName.isNotEmpty;

  void login(String userName) {
    _userName = userName;
    notifyListeners();
  }

  void logout() {
    _userName = '';
    notifyListeners();
  }
}
