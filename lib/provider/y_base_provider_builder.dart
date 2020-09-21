/*
 * 项目名:    flutter_y_framework_test
 * 包名       provider
 * 文件名:    y_base_provider
 * 创建时间:  2020/9/18 on 4:03 PM
 * 描述:
 *
 * @author   YHF
 */

import 'package:dio/dio.dart';
import 'package:y_framework/provider/y_dio.dart';

import 'y_converter_factory.dart';
import 'y_local_storage.dart';
import 'y_log.dart';

abstract class YBaseProviderBuilder {

  ///本地缓存
  YLocalStorage get localStorage;

  ///数据转换工厂
  YConverterFactory get converterFactory;

  ///日志
  YLog get log;

  ///网络提供者
  YDio get dio;

}
