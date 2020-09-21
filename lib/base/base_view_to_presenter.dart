/*
 * 项目名:    cacart_flutter
 * 包名
 * 文件名:    base_loading
 * 创建时间:  2019-10-30 on 15:00
 * 描述:
 *
 * @author   YHF
 */

import 'package:flutter/material.dart';

mixin ViewToBloc {
  void showLoadingDialog();

  void dismissDialog();

  void toast(String s);

  void sendEventToView(ViewEvent event);
}

abstract class ViewEvent {

}
