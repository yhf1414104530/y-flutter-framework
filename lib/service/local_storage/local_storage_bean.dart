/*
 * 项目名:    feng_go_app
 * 包名
 * 文件名:    local_storage_bean
 * 创建时间:  2020/9/11 on 1:40 PM
 * 描述:
 *
 * @author   YHF
 */

import 'package:y_framework/util/index.dart';

class LocalStorageBean {
  late String cacheType;

  String? cacheFilePath;

  late String cacheInfo;

  DateTime? createDateTime;

  String? version;

  LocalStorageBean(this.cacheType, this.cacheInfo,
      {this.cacheFilePath, this.createDateTime, this.version});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["cacheType"] = this.cacheType;
    data["cacheFilePath"] = this.cacheFilePath;
    data["cacheInfo"] = this.cacheInfo;
    data["version"] = this.version;
    data["createDateTime"] = this.createDateTime?.toIso8601String();
    return data;
  }

  LocalStorageBean.fromJson(Map<String, dynamic> json) {
    cacheType = json['cacheType'];
    cacheFilePath = json['cacheFilePath'];
    cacheInfo = json['cacheInfo'];
    version = json['version'];
    if (!ObjectUtil.isEmptyString(json['createDateTime'])) {
      createDateTime = DateTime.parse(json['createDateTime']);
    }
  }
}

class CacheType {
  static const IMAGE = 'file';
  static const VIDEO = 'video';
  static const JSON = 'json';
  static const TEXT = 'text';
}
