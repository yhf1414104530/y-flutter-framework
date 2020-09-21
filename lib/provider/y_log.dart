/*
 * 项目名:    flutter_y_framework_test
 * 包名       provider
 * 文件名:    y_log
 * 创建时间:  2020/9/18 on 4:05 PM
 * 描述:
 *
 * @author   YHF
 */

abstract class YLog {
  void logI(String s);

  void logE(String s);

  void logD(String s);

  void logW(String s);

  String get logName;
}
