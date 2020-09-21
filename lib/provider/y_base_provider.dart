/*
 * 项目名:    y_framework
 * 包名       provider
 * 文件名:    y_base_provider
 * 创建时间:  2020/9/21 on 3:35 PM
 * 描述:
 *
 * @author   YHF
 */

import 'package:y_framework/base/base_net_entity.dart';
import 'package:y_framework/net/request_bean.dart';
import 'package:y_framework/provider/y_local_storage.dart';
import 'package:y_framework/y_framework.dart';

import 'y_base_provider_builder.dart';

abstract class YBaseProvider<T> {
  YBaseProviderBuilder get yBaseProviderBuilder;

  Future<BaseNetEntity<T>> load();

  Future<T> loadLocal();

  RequestBean get requestBean;

  bool get isLocalCache => requestBean.isCacheLocal;

  String get cacheTag => requestBean.cacheTag;

  YLocalStorage get localStorage => yBaseProviderBuilder.localStorage;

  String get localCacheKey => _createKey();

  String _createKey() {
    return ObjectUtil.isEmptyString(requestBean.cacheTag)
        ? T.toString()
        : '${T.runtimeType.toString()}?${requestBean.cacheTag}';
  }
}
