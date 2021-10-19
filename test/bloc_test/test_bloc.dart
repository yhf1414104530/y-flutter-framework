import 'dart:async';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:y_framework/base/base_bloc.dart';
import 'package:y_framework/base/base_event.dart';
import 'package:y_framework/base/base_view_to_presenter.dart';
import 'package:y_framework/net/exception/exception.dart';

part 'test_event.dart';

part 'test_state.dart';

class TestBloc extends BaseLoadBloc<TestEvent, TestState> {
  TestBloc(ViewToBloc viewToPresenter) : super(viewToPresenter, TestInitial(1));

  void test() {
    var i = state.num + 1;
    add(ChangeDataEvent(i));
  }

  void testTwo() {
    var i = state.num + 1;
    add(ChangeDataLoadingEvent(i));
  }
}
