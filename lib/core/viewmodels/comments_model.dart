import 'package:flutter/cupertino.dart';
import '../../core/enums/view_state.dart';
import '../../core/services/api.dart';
import '../../core/viewmodels/base_model.dart';
import '../../locator.dart';

import '../models/comment.dart';

class CommentsModel extends BaseModel {
  Api _api = locator<Api>();

  List<Comment> comments = [];

  Future fetchComments(int postId) async {
    setState(ViewState.busy);
    comments = await _api.getCommentsForPost(postId);
    debugPrint('fetchComments: comments: ${comments.length}');
    setState(ViewState.idle);
  }
}
