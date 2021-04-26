import 'package:flutter/material.dart';
import 'package:y_framework/base/base_view_to_presenter.dart';
import 'package:y_framework/net/exception/exception.dart';
import 'package:y_framework/service/index.dart';
import 'package:y_framework/util/index.dart';

import 'base_bloc.dart';
import 'view_event_observer.dart';

abstract class YBaseState<T extends StatefulWidget> extends State<T>
    with ViewToBloc {

  static ViewEventObserver viewEventObserver = ViewEventObserver();

  List<BaseAppBloc> _mList = [];

  injectBloc(BaseAppBloc bloc) {
    _mList.add(bloc);
  }

  injectBlocs(List<BaseAppBloc> blocList) {
    _mList.addAll(blocList);
  }

  T getBc<T extends BaseAppBloc>() {
    var list = _mList
        .where((element) => element.runtimeType.toString() == T.toString())
        .toList();
    if (ObjectUtil.isEmptyList(list))
      throw TransactionException('${T.toString()} is null，please inject bloc object..');
    return _mList[0];
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding widgetsBinding = WidgetsBinding.instance;
    widgetsBinding.addPostFrameCallback((callback) {
      onResume();
    });
  }

  @override
  void sendEventToView(ViewEvent event) {
    viewEventObserver.hookViewEvent(event, this);
  }

  @override
  void dispose() {
    for (var value in _mList) {
      value?.close();
    }
    super.dispose();
  }

  void onResume() {}
}
