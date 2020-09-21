/*
 * 项目名:    flutter_y_framework_test
 * 包名       provider
 * 文件名:    y_converter_factory
 * 创建时间:  2020/9/18 on 3:57 PM
 * 描述:
 *
 * @author   YHF
 */

import 'package:y_framework/base/base_net_entity.dart';

abstract class YConverterFactory {
 BaseNetEntity<T> transformData<T>(data);
}
