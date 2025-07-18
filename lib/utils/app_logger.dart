import 'package:logger/logger.dart';

class Log {
  Log();
  static final Logger _logger = Logger();

  static void d(dynamic message, {Level? level = Level.debug}) {
    var title = '[DEBUG]';
    switch (level!) {
      case Level.info:
        title = '[INFO]';
        break;
      case Level.error:
        title = '[ERROR]';
        break;
      case Level.warning:
        title = '[warning]';
        break;
      default:
        title = '[DEBUG]';
    }
    _logger.log(level!, '$title: $message');
  }
}
