import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:y_framework/provider/y_local_storage.dart';
import 'package:y_framework/util/index.dart';

import 'local_storage_bean.dart';

class LocalStorageService extends YLocalStorage {
  final BaseCacheManager baseCacheManager;

  LocalStorageService(this.baseCacheManager);

  @override
  Future<File> saveImageFile(String key, String url, {String saveInfo}) async {
    return _saveNetFile(key, url, CacheType.IMAGE, saveInfo: saveInfo);
  }

  @override
  Future<File> saveVideoFile(String key, String url, {String saveInfo}) async {
    return _saveNetFile(key, url, CacheType.VIDEO, saveInfo: saveInfo);
  }

  Future<File> _saveNetFile(String key, String url, String type,
      {saveInfo}) async {
    var fileInfo = await baseCacheManager.downloadFile(url);
    if (ObjectUtil.isEmpty(fileInfo)) {
      throw FormatException('下载失败');
    }
    return _saveLocalInfo(
        key,
        LocalStorageBean(type, saveInfo ?? url,
            cacheFilePath: fileInfo.file.path, createDateTime: DateTime.now()));
  }

  @override
  Future<File> saveMessage(String key, String message) async {
    return _saveLocalInfo(
        key,
        LocalStorageBean(CacheType.TEXT, message,
            createDateTime: DateTime.now()));
  }

  @override
  Future<File> saveJsonMessage(String key, String jsonMessage) async {
    return _saveLocalInfo(
        key,
        LocalStorageBean(CacheType.JSON, jsonMessage,
            createDateTime: DateTime.now()));
  }

  Future<File> _saveLocalInfo(String key, LocalStorageBean localStorageBean,
      {Type type}) {
    return baseCacheManager.putFile(
        key, Utf8Encoder().convert(json.encode(localStorageBean.toJson())));
  }

  @override
  Future<LocalStorageBean> getLocalInfo(String key) async {
    if (ObjectUtil.isEmptyString(key)) {
      throw FormatException('请输入正确的key');
    }
    LocalStorageBean localStorageBean;
    var file = await baseCacheManager.getFileFromCache(key);
    if (ObjectUtil.isEmpty(file)) {
      return Future.value(null);
    }
    var fileJson = file.file.readAsStringSync();
    try {
      var jsonData = json.decode(fileJson);
      localStorageBean = LocalStorageBean.fromJson(jsonData);
    } catch (ex) {
      print(ex.toString());
    }
    return localStorageBean;
  }

  @override
  void removeData(String key) async {
    if (key == null) {
      return null;
    }
    baseCacheManager.removeFile(key);
  }
}
