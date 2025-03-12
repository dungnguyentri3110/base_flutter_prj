import 'package:logger/logger.dart';

class AppLogger {
  AppLogger();
  static final Logger _logger = Logger();

  static void log({Level? level = Level.debug, dynamic message}){
    var title = '[DEBUG]';
    switch(level!){
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