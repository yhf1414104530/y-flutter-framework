/*
 * 项目名:    gma_law_flutter
 * 包名
 * 文件名:    base_bloc
 * 创建时间:  2019-12-31 on 15:45
 * 描述:
 *
 * @author   YHF
 */
export 'package:equatable/equatable.dart';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:y_framework/base/base_view_to_presenter.dart';
import 'package:y_framework/service/load/bloc/bloc.dart';
import 'base_event.dart';
export 'package:flutter/foundation.dart';

abstract class BaseAppBloc<Event extends InnerBaseEvent, State>
    extends Bloc<Event, State> {
  BaseAppBloc(State initialState) : super(initialState) {
    on<Event>((event, emit) async {
      var newState;
      if (event is YBaseEvent) {
        newState = await event.applyEmit(this, state);
      } else if (event is BaseEvent) {
        newState = await event.applyAsync(this, state).first;
      }
      emit.call(newState);
    });
  }
}

///provider loading state service，if you need loading function
abstract class BaseLoadBloc<Event extends InnerBaseEvent, State>
    extends BaseBloc<InnerBaseEvent, State> {
  ViewToBloc viewToBloc;

  BaseLoadBloc(
    this.viewToBloc,
    State initialState,
  ) : super(initialState) {
    setView(viewToBloc);
  }
}

abstract class BaseBloc<Event extends InnerBaseEvent, State>
    extends BaseAppBloc<Event, State> {
  ViewToBloc? view;

  LoadBloc _loadBloc = LoadBloc(InitialState());

  setView(ViewToBloc viewToBloc) {
    view = viewToBloc;
  }

  LoadBloc get loadBloc => _loadBloc;

  pageLoading() {
    _loadBloc.loading();
  }

  pageError(Exception exception) {
    _loadBloc.error(exception);
  }

  pageSuccess() {
    _loadBloc.success();
  }

  bool isLoading() {
    return loadBloc.state is LoadingState;
  }

  @override
  Future<void> close() {
    _loadBloc.close();
    return super.close();
  }

  BaseBloc(State initialState) : super(initialState);
}
