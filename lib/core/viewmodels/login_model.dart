import 'package:flutter/material.dart';
import 'package:provider_architecture/core/viewmodels/base_model.dart';

import '../../locator.dart';
import '../enums/view_state.dart';
import '../services/authentication_service.dart';

class LoginModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  String errorMessage = '';

  Future<bool> login(String userIdText) async {
    errorMessage = '';
    setState(ViewState.busy);
    var userId = int.tryParse(userIdText);
    if (userId == null) {
      errorMessage = 'Value entered is not a number';
      setState(ViewState.idle);
      return false;
    }
    var success = await _authenticationService.login(userId: userId!);
    setState(ViewState.idle);
    return success;
  }
}
