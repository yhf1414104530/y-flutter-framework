/*
 * 项目名:    y_framework
 * 包名       provider_test
 * 文件名:    base_provider
 * 创建时间:  2020/9/18 on 4:21 PM
 * 描述:
 *
 * @author   YHF
 */

import 'dart:convert';

import 'package:y_framework/base/base_net_entity.dart';
import 'package:y_framework/net/exception/exception.dart';
import 'package:y_framework/net/request_bean.dart';
import 'package:y_framework/provider/y_base_provider.dart';
import 'package:y_framework/provider/y_base_provider_builder.dart';
import 'package:y_framework/provider/y_log.dart';
import 'package:y_framework/util/index.dart';

import 'custom_provider.dart';
import 'default_converter_factory.dart';

abstract class BaseProvider<T> extends YBaseProvider<T> {
  CustomProvider _customProvider = CustomProvider();

  @override
  // TODO: implement yBaseProviderBuilder
  YBaseProviderBuilder get yBaseProviderBuilder => _customProvider;

  @override
  Future<BaseNetEntity<T>> load() async {
    _log('request',
        'Api：${requestBean.requestUrl}----RequestParams：${json.encode(requestBean.requestParams)}');
    var data;
    switch (requestBean.requestType) {
      case RequestType.GET:
        data = await _customProvider.dio.requestGet(requestBean.requestUrl,
            requestParams: requestBean.requestParams);
        break;
      case RequestType.POST:
        data = await _customProvider.dio.requestPost(requestBean.requestUrl,
            requestParams: requestBean.requestParams);
        break;
      case RequestType.DEL:
        data = await _customProvider.dio.requestDel(requestBean.requestUrl,
            requestParams: requestBean.requestParams);
        break;
    }
    return _transformData(data);
  }

  Future<BaseNetEntity<T>> _transformData(data) {
    BaseNetEntity<T> transformData;
    transformData = _customProvider.converterFactory.transformData<T>(data);
    if (ObjectUtil.isEmpty(transformData)) {
      throw PersistenceException('数据转换错误');
    }
    _log('transformData', 'transformType is ${T.toString()}');
    _cacheToLocal(transformData.data);
    return Future.value(transformData);
  }

  _log(String event, String info) {
    _customProvider.log
        .logI('ProviderLog===>Event is {$event},Info is {$info}');
  }

  void _cacheToLocal(transformData) {}

  @override
  Future<T> loadLocal() async {
    var localInfo = await localStorage.getLocalInfo(localCacheKey);
    return null;
  }
}
