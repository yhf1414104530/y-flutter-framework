

import 'package:flutter/material.dart';
import 'package:y_framework/base/base_view_to_presenter.dart';
import 'package:y_framework/util/index.dart';
import 'package:y_framework/util/router_util.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T>
    with RouterFunction, UI, ViewToBloc {



  @override
  void sendEventToView(ViewEvent event) {
    print(event);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding widgetsBinding = WidgetsBinding.instance;
    widgetsBinding.addPostFrameCallback((callback) {
      onResume();
    });
  }



  void onResume() {}
}
