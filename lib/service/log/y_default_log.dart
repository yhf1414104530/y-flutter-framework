/*
 * 项目名:    y_framework
 * 包名       service.log
 * 文件名:    y_log
 * 创建时间:  2020/9/21 on 2:46 PM
 * 描述:
 *
 * @author   YHF
 */

import 'package:logger/logger.dart';
import 'package:y_framework/provider/y_log.dart';

class YDefaultLog extends YLog {
  Logger _log;

  YDefaultLog() {
    _log = Logger(
      printer:
          PrettyPrinter(colors: false, printEmojis: false, printTime: false),
    );
  }

  @override
  void logD(String s) {
    _log.d(s);
  }

  @override
  void logE(String s) {
    _log.e(s);
  }

  @override
  void logI(String s) {
    _log.i(s);
  }

  @override
  // TODO: implement logName
  String get logName => 'Y';

  @override
  void logW(String s) {
    _log.w(s);
  }
}
