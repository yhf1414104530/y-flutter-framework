import 'package:flutter/material.dart';
import 'package:y_framework/base/base_view_to_presenter.dart';
import 'package:y_framework/util/index.dart';

abstract class YBaseState<T extends StatefulWidget> extends State<T>
    with UI, ViewToBloc {

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
