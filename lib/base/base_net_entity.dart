/*
 * 项目名:    gma_law_flutter2
 * 包名
 * 文件名:    base_net_entity
 * 创建时间:  2020-01-18 on 15:09
 * 描述:
 *
 * @author   YHF
 */

import 'package:y_framework/util/config.dart';

class BaseNetEntity<T> {
  int? code;
  String? message;
  String? traceId;

  BaseNetEntity({this.code, this.message, this.data, this.traceId});

  T? data;

  bool get isSuccess => code == FConfig.ApiSuccessCode;
}
