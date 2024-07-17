import 'package:flutter/material.dart';
import 'package:provider_architecture/core/services/posts_service.dart';
import 'package:provider_architecture/locator.dart';

import '../enums/view_state.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.idle;
  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
