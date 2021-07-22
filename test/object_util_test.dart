/*
 * 项目名:    y-flutter-framework
 * 包名
 * 文件名:    object_util_test
 * 创建时间:  2021/7/22 on 4:24 PM
 * 描述:
 *
 * @author   YHF
 */

import 'package:y_framework/util/object_util.dart';

void main() {
  String? a = null;
  Map map = {'a': 'b'};
  print(ObjectUtil.isEmptyString(a));
  print(a?.length);
  print(ObjectUtil.isEmptyMap(map));
}
