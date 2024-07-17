import 'package:provider_architecture/core/services/api.dart';
import 'package:provider_architecture/locator.dart';

import '../models/post.dart';

class PostsService {
  Api _api = locator<Api>();
  List<Post> _posts = [];
  List<Post> get posts => _posts;

  Future getPostsForUser(int userId) async {
    _posts = await _api.getPostsForUser(userId);
  }

  void incrementLikes(int postId) {
    _posts.firstWhere((post) => post.id == postId).likes += 1;
  }
}
