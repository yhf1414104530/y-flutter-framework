import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class BaseNetWork {
  // 工厂模式
  factory BaseNetWork() => _getInstance();

  static BaseNetWork get instance => _getInstance();
  static BaseNetWork _instance;
  Dio dio;
  BaseOptions options;

  BaseNetWork._internal() {
    DefaultHttpClientAdapter adapter = DefaultHttpClientAdapter();
    dio = Dio()
      ..options = BaseOptions(
        baseUrl: '',
        connectTimeout: 15000,
        receiveTimeout: 5000,
      );
  }

  ///清除授权
  clearAuthorization() {}

  ///获取授权token
  getAuthorization() async {}

  static BaseNetWork _getInstance() {
    if (_instance == null) {
      _instance = new BaseNetWork._internal();
    }
    return _instance;
  }
}
