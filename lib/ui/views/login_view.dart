import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/core/viewmodels/login_model.dart';
import 'package:provider_architecture/locator.dart';
import 'package:provider_architecture/ui/shared/app_colors.dart';
import 'package:provider_architecture/ui/views/base_view.dart';

import '../../core/enums/view_state.dart';
import '../widgets/login_header.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(
        onModelReady: (model) {},
        builder: (context, model, child) => Scaffold(
              backgroundColor: backgroundColor,
              body: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    LoginHeader(
                      controller: _controller,
                      validationMessage: model.errorMessage,
                    ),
                    model.state == ViewState.busy
                        ? CircularProgressIndicator()
                        : MaterialButton(
                            onPressed: () async {
                              var loginSuccess =
                                  await model.login(_controller.text);
                              if (loginSuccess) {
                                //navigate to home view
                                Navigator.pushNamed(context, 'home');
                              }
                            },
                            color: Colors.white,
                            child: Text(
                              'Login',
                              style: TextStyle(color: Colors.black12),
                            ))
                  ],
                ),
              ),
            ));
  }
}
