/*
 * 项目名:    y_framework
 * 包名       provider_test
 * 文件名:    default_log
 * 创建时间:  2020/9/18 on 4:29 PM
 * 描述:
 *
 * @author   YHF
 */

import 'package:y_framework/base/base_net_entity.dart';
import 'package:y_framework/provider/y_converter_factory.dart';

class DefaultConverterFactory extends YConverterFactory {
  @override
  BaseNetEntity<T> transformData<T>(data) {
    var response = data.data;
    int code = response['code'];
    String? message = response['message'];
    var dataInfo = response['data'];
    return BaseNetEntity(code: code, message: message, data: dataInfo);
  }
}
