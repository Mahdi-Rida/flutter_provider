import 'dart:convert' as convert;

import 'package:flutter/widgets.dart';
import 'package:provider_architecture/core/models/comment.dart';
import 'package:provider_architecture/core/models/post.dart';
import 'package:provider_architecture/core/models/user.dart';
import 'package:http/http.dart' as http;

/// The service responsible for networking requests
class Api {
  static const endpoint = 'jsonplaceholder.typicode.com';

  var client = new http.Client();

  Future<User?> getUserProfile(int userId) async {
    // Get user profile for id
    var response = await http.get(Uri.http(endpoint, '/users'));

    var jsonResponse = convert.jsonDecode(response.body);

    if (jsonResponse is List) {
      var userMap = jsonResponse.firstWhere((user) => user['id'] == userId,
          orElse: () => null);

      if (userMap != null) {
        return User.fromJson(userMap);
      } else {
        // Handle user not found
        return null;
      }
    } else if (jsonResponse is Map<String, dynamic>) {
      // If the response is a single user object
      return User.fromJson(jsonResponse);
    } else {
      // Handle unexpected response format
      return null;
    }
  }

  Future<List<Post>> getPostsForUser(int userId) async {
    List<Post> posts = [];
    // Get user posts for id
    var response = await http
        .get(Uri.https(endpoint, '/posts', {'userId': userId.toString()}));
    debugPrint('Url: ${response.request?.url.toString()}');
    // parse into List
    var parsed = convert.jsonDecode(response.body) as List<dynamic>;

    // loop and convert each item to Post
    for (var post in parsed) {
      posts.add(Post.fromJson(post));
    }

    return posts;
  }

  Future<List<Comment>> getCommentsForPost(int postId) async {
    List<Comment> comments = [];

    // Get comments for post
    var response = await http
        .get(Uri.https(endpoint, '/comments', {'postId': postId.toString()}));
    debugPrint('Url: ${response.request?.url.toString()}');
    // Parse into List
    var parsed = convert.jsonDecode(response.body) as List<dynamic>;

    // Loop and convert each item to a Comment
    for (var comment in parsed) {
      comments.add(Comment.fromJson(comment));
    }

    return comments;
  }
}
