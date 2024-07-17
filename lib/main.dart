import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/core/services/authentication_service.dart';
import 'package:provider_architecture/logger.dart';
import '../core/models/user.dart';
import '../ui/router/app_router.dart';
import '../locator.dart';
import '../ui/views/login_view.dart';

void main() {
  Logger.level = Level.info;
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final log = Logger(printer: SimpleLogPrinter(className: 'Main'));
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>(
      create: (BuildContext context) =>
          locator<AuthenticationService>().streamController,
      initialData: User.initial(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: Scaffold(
            floatingActionButton: FloatingActionButton(onPressed: () {
              log.v('verbose');
              log.d('debug');
              log.i('info');
              log.w('problem');
              log.e('error');
            }),
            body: LoginView()),
        // initialRoute: 'tab',
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
