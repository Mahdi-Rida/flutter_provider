import 'package:provider_architecture/core/services/posts_service.dart';
import 'package:provider_architecture/core/viewmodels/base_model.dart';
import 'package:provider_architecture/locator.dart';

class LikeButtonModel extends BaseModel {
  PostsService _postsService = locator<PostsService>();

  int postLikes(int postId) {
    return _postsService.posts.firstWhere((post) => post.id == postId).likes;
  }

  void incrementLikes(int postId) {
    _postsService.incrementLikes(postId);
    notifyListeners();
  }
}
