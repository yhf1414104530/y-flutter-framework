/*
 * 项目名:    flutter_y_framework_test
 * 包名       provider
 * 文件名:    y_local_storage
 * 创建时间:  2020/9/18 on 3:56 PM
 * 描述:
 *
 * @author   YHF
 */

import 'dart:io';

import 'package:y_framework/service/local_storage/local_storage_bean.dart';

abstract class YLocalStorage {
  Future<File> saveImageFile(String key, String url, {String saveInfo});

  Future<File> saveVideoFile(String key, String url, {String saveInfo});

  Future<File> saveMessage(String key, String message);

  Future<File> saveJsonMessage(String key, String jsonMessage);

  Future<LocalStorageBean?> getLocalInfo(String key);

  void removeData(String key);
}
