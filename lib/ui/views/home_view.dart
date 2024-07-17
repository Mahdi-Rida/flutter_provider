import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/ui/widgets/postlist_item.dart';
import '../../core/enums/view_state.dart';
import '../../core/models/user.dart';
import '../../core/viewmodels/home_model.dart';
import '../../ui/shared/app_colors.dart';
import '../../ui/shared/text_styles.dart';
import '../../ui/shared/ui_helpers.dart';
import '../../ui/views/base_view.dart';

import '../../core/models/post.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      onModelReady: (model) {
        var user = Provider.of<User>(context, listen: true);
        debugPrint('model context ${user.toString()}');
        model.getPosts(user.id);
      },
      builder: (context, model, child) => Scaffold(
          backgroundColor: backgroundColor,
          floatingActionButton: FloatingActionButton(onPressed: () {
            model.getPosts(Provider.of<User>(context, listen: false).id);
          }),
          body: model.state == ViewState.busy
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UIHelper.verticalSpaceLarge(),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Welcome ${Provider.of<User>(context, listen: true).name}',
                        style: headerStyle,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Here are all your posts',
                        style: subHeaderStyle,
                      ),
                    ),
                    UIHelper.verticalSpaceSmall(),
                    Expanded(child: getPostsUi(model.posts))
                  ],
                )),
    );
  }

  Widget getPostsUi(List<Post> posts) {
    return ListView.builder(
      itemCount: posts.length,
      key: new Key(UniqueKey().toString()),
      itemBuilder: (context, index) => PostListItem(
          post: posts[index],
          onTap: () {
            Navigator.pushNamed(context, 'post', arguments: posts[index]);
          }),
    );
  }
}
