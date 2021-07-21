/*
 * 项目名:    y_framework
 * 包名       service.log
 * 文件名:    log
 * 创建时间:  2020/10/15 on 5:59 PM
 * 描述:
 *
 * @author   YHF
 */
import 'package:logger/logger.dart';
import 'package:y_framework/service/log/y_default_log.dart';

class Log {
  static late YDefaultLog _log;

  static init({
    LogFilter? filter,
    LogPrinter? printer,
    LogOutput? output,
  }) {
    _log = YDefaultLog(filter: filter, printer: printer, output: output);
  }

  static void d(String s) {
    _log.logD(s);
  }

  static void e(String s) {
    _log.logE(s);
  }

  static void i(String s) {
    _log.logI(s);
  }

  static void w(String s) {
    _log.logW(s);
  }
}
