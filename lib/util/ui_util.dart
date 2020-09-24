/*
 * 项目名:    cacart_flutter
 * 包名
 * 文件名:    ui_util
 * 创建时间:  2019/4/16 on 5:03 PM
 * 描述:
 *
 * @author   Dino
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

mixin UI {



  ScreenUtil get screenUtil=>ScreenUtil();

  /// screen width
  /// 屏幕 宽
  double get screenWidth => ScreenUtil().screenWidth;

  /// screen height
  /// 屏幕 高
  double get screenHeight => ScreenUtil().screenHeight;

  double sFontSize(double size) {
    return screenUtil.setSp(size);
  }



  double sHeight(double size) {
    return screenUtil.setWidth(size);
  }

  double sWidth(double size) {
    return screenUtil.setWidth(size);
  }

  EdgeInsets sInsetsLTRB(double left, double top, double right, double bottom) {
    return EdgeInsets.fromLTRB(
      sWidth(left),
      sHeight(top),
      sWidth(right),
      sHeight(bottom),
    );
  }

  EdgeInsets sInsetsOnly(
      {double left = 0, double top = 0, double right = 0, double bottom = 0}) {
    return EdgeInsets.fromLTRB(
      sWidth(left),
      sHeight(top),
      sWidth(right),
      sHeight(bottom),
    );
  }

  EdgeInsets sInsetsAll(double value) {
    return EdgeInsets.fromLTRB(
      sWidth(value),
      sHeight(value),
      sWidth(value),
      sHeight(value),
    );
  }

  EdgeInsets sInsetsHV(double h, double v) {
    return EdgeInsets.fromLTRB(
      sWidth(h),
      sHeight(v),
      sWidth(h),
      sHeight(v),
    );
  }

  Widget paddingH30(Widget child) {
    return Padding(
      padding: sInsetsHV(30, 0),
      child: child,
    );
  }

  Widget paddingV20(Widget child) {
    return Padding(
      padding: sInsetsHV(0, 20),
      child: child,
    );
  }
}

class UiUtil with UI{

}
