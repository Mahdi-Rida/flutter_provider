import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';

class SimpleLogPrinter extends LogPrinter {
  final String className;

  SimpleLogPrinter({required this.className});

  @override
  List<String> log(LogEvent event) {
    var color = PrettyPrinter.defaultLevelColors;
    debugPrint('$className: ${event.message}');
    return [];
  }
}
