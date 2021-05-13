/*
 * 项目名:    y_framework
 * 包名       provider_test
 * 文件名:    default_log
 * 创建时间:  2020/9/18 on 4:29 PM
 * 描述:
 *
 * @author   YHF
 */

import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:y_framework/provider/y_dio.dart';

class DefaultDio extends YDio {
  Dio _dio;
  BaseOptions _options;

  DefaultDio() {
    DefaultHttpClientAdapter adapter = DefaultHttpClientAdapter();
    adapter.onHttpClientCreate = (HttpClient client) {
      client.findProxy = (uri) {
        return 'PROXY 192.168.3.100:8888';
      };
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) {
        return true;
      };
    };
    _dio = Dio()
      ..options = BaseOptions(
        baseUrl: 'http://mall.test.feng-go.com/api/v1/',
        connectTimeout: 15000,
        receiveTimeout: 5000,
      )
      ..httpClientAdapter = adapter;
  }

  @override
  Future requestDel(String apiAddress, {Map<String, dynamic> requestParams}) {
    return _dio.delete(apiAddress, data: requestParams);
  }

  @override
  Future requestGet(String apiAddress, {Map<String, dynamic> requestParams}) {
    return _dio.request(apiAddress, queryParameters: requestParams);
  }

  @override
  Future requestPost(String apiAddress, {Map<String, dynamic> requestParams}) {
    return _dio.post(apiAddress, data: json.encode(requestParams));
  }

  @override
  Future requestPostJson(String apiAddress, {String json}) {
    return _dio.post(apiAddress, data: json);
  }

  @override
  Future requestPostJsonV2(String apiAddress, {jsonObject}) {
    return _dio.post(apiAddress, data: json.encode(jsonObject));
  }
}
