import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:provider_architecture/core/models/user.dart';
import 'package:provider_architecture/core/services/api.dart';
import 'package:provider_architecture/locator.dart';

class AuthenticationService {
  Api _api = locator<Api>();
  StreamController<User> _userController = StreamController<User>();
  Stream<User> get streamController => _userController.stream;

  Future<bool> login({required int userId}) async {
    var fetchedUser = await _api.getUserProfile(userId);
    var hasUser = fetchedUser != null;
    if (hasUser) {
      _userController.add(fetchedUser);
    }
    return hasUser;
  }
}
