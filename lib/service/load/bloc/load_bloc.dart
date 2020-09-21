import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:y_framework/base/base_bloc.dart';
import 'bloc.dart';

class LoadBloc extends BaseAppBloc<LoadEvent, LoadState> {
  final LoadState loadState;

  LoadBloc(this.loadState) : super(loadState);

  ///page loading state , used for just entered page
  loading() {
    add(LoadingEvent());
  }

  error(Exception exception) {
    add(ErrorEvent(exception));
  }

  success() {
    add(SuccessEvent());
  }
}
