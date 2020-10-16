/*
 * 项目名:    y_framework
 * 包名       log_test
 * 文件名:    log_test
 * 创建时间:  2020/10/15 on 6:02 PM
 * 描述:
 *
 * @author   YHF
 */

import 'package:y_framework/service/log/log.dart';

import 'test_one.dart';
import 'test_two.dart';

void main() {
  Log.init();
  TestOne().log();
  TestTwo().log();
}
