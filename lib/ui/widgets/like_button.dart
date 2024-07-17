import 'package:flutter/material.dart';
import 'package:provider_architecture/core/viewmodels/like_button_model.dart';
import 'package:provider_architecture/ui/views/base_view.dart';

class LikeButton extends StatelessWidget {
  final int postId;

  const LikeButton({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return BaseView<LikeButtonModel>(
        builder: (context, model, child) => Row(
              children: [
                Text('Likes: ${model.postLikes(postId)}'),
                MaterialButton(
                  onPressed: () {
                    model.incrementLikes(postId);
                  },
                  color: Colors.white,
                  child: Icon(Icons.thumb_up),
                )
              ],
            ),
        onModelReady: (model) {});
  }
}
