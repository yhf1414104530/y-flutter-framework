/*
 * 项目名:    y_framework
 * 包名
 * 文件名:    custom_provider
 * 创建时间:  2020/9/18 on 4:21 PM
 * 描述:
 *
 * @author   YHF
 */

import 'package:dio/src/dio.dart';
import 'package:y_framework/provider/y_base_provider_builder.dart';
import 'package:y_framework/provider/y_converter_factory.dart';
import 'package:y_framework/provider/y_dio.dart';
import 'package:y_framework/provider/y_local_storage.dart';
import 'package:y_framework/provider/y_log.dart';
import 'package:y_framework/service/local_storage/local_storage_service.dart';
import 'package:y_framework/service/log/y_default_log.dart';

import 'custom_cache_manager.dart';
import 'default_converter_factory.dart';
import 'default_dio.dart';

void main() {}

class CustomProvider extends YBaseProviderBuilder {

  @override
  YConverterFactory get converterFactory => DefaultConverterFactory();

  @override
  YDio get dio => DefaultDio();

  @override
  YLocalStorage get localStorage => LocalStorageService(CustomCacheManager());

  @override
  YLog get log => YDefaultLog();

}
