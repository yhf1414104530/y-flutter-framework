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
import 'package:bloc/bloc.dart';
import 'package:y_framework/base/base_view_to_presenter.dart';
import 'package:y_framework/service/load/bloc/bloc.dart';
import 'base_event.dart';
export  'package:flutter/foundation.dart';


abstract class BaseAppBloc<Event extends BaseEvent, State>
    extends Bloc<Event, State> {
  BaseAppBloc(State initialState) : super(initialState);

  @override
  Stream<State> mapEventToState(
    Event event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      print(stackTrace);
      yield state;
    }
  }
}

///provider loading state service，if you need loading function
abstract class BaseLoadBloc<Event extends BaseEvent, State>
    extends BaseAppBloc<Event, State> {
  final ViewToBloc view;

  LoadBloc _loadBloc = LoadBloc(SuccessState());

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

  @override
  Future<void> close() {
    _loadBloc.close();
    return super.close();
  }

  BaseLoadBloc(
    this.view,
    State initialState,
  ) : super(initialState);
}
