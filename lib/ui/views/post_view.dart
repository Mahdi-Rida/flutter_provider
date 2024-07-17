import 'package:flutter/material.dart';
import 'package:provider_architecture/core/enums/view_state.dart';
import 'package:provider_architecture/core/models/comment.dart';
import 'package:provider_architecture/core/models/post.dart';
import 'package:provider_architecture/core/viewmodels/comments_model.dart';
import 'package:provider_architecture/ui/shared/app_colors.dart';
import 'package:provider_architecture/ui/views/base_view.dart';
import 'package:provider_architecture/ui/widgets/comments.dart';
import 'package:provider_architecture/ui/widgets/like_button.dart';

class PostView extends StatelessWidget {
  final Post? post;

  PostView({this.post = null});

  @override
  Widget build(BuildContext context) {
    return BaseView<CommentsModel>(
        onModelReady: (model) {
          model.fetchComments(post!.id);
        },
        builder: (context, model, child) => model.state == ViewState.busy
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back)),
                  LikeButton(postId: post?.id ?? 0),
                  model.state == ViewState.busy
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Expanded(
                          child: ListView.builder(
                              itemCount: model.comments.length,
                              itemBuilder: (context, index) =>
                                  CommentItem(model.comments[index])),
                        ),
                ],
              ));
  }
}
