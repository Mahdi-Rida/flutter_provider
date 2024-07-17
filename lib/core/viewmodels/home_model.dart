import 'package:flutter/cupertino.dart';
import 'package:provider_architecture/core/enums/view_state.dart';
import 'package:provider_architecture/core/models/post.dart';
import 'package:provider_architecture/core/services/api.dart';
import 'package:provider_architecture/core/viewmodels/base_model.dart';

import '../../locator.dart';
import '../services/posts_service.dart';

class HomeModel extends BaseModel {
  PostsService _postsService = locator<PostsService>();

  List<Post> get posts => _postsService.posts;

  Future getPosts(int userId) async {
    setState(ViewState.busy);

    await _postsService.getPostsForUser(userId);
    debugPrint('getPosts: posts: ${_postsService.posts.length}');
    setState(ViewState.idle);
  }
}
