/*
 * 项目名:    flutter_y_framework_test
 * 包名
 * 文件名:    bloc_test
 * 创建时间:  2020/9/18 on 1:56 PM
 * 描述:
 *
 * @author   YHF
 */


import 'package:y_framework/base/base_view_to_presenter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'delegate.dart';
import 'test_bloc.dart';

void main() async {
  Bloc.observer = SimpleBlocDelegate();
  var testView = TestView();


  TestBloc(testView)..test()..testTwo();


  await Future.delayed(Duration(minutes: 1));
}

class TestView with ViewToBloc {
  @override
  void dismissDialog() {
    print('dismissDialog');
  }

  @override
  void sendEventToView(ViewEvent event) {
    print('event-$event');
  }

  @override
  void showLoadingDialog({String? msg}) {
    print('showLoadingDialog');
  }

  @override
  void toast(String s) {
    print('toast-$s');
  }

  @override
  bool isShowLoading() {
    return true;
  }
}
