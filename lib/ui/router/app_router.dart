import 'package:flutter/material.dart';
import 'package:provider_architecture/ui/views/home_view.dart';
import 'package:provider_architecture/ui/views/login_view.dart';
import 'package:provider_architecture/ui/views/post_view.dart';
import 'package:provider_architecture/ui/views/tab_container.dart';

import '../../core/models/post.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'home':
        return MaterialPageRoute(builder: (_) => HomeView());
      case 'login':
        return MaterialPageRoute(builder: (_) => LoginView());
      case 'tab':
        return MaterialPageRoute(builder: (_) => TabContainer());
      case 'post':
        var posts = settings.arguments as Post;
        return MaterialPageRoute(
            builder: (_) => PostView(
                  post: posts,
                ));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route is defined for this route'),
                  ),
                ));
    }
  }
}
