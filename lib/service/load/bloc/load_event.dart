import 'package:y_framework/base/base_event.dart';

import 'bloc.dart';

abstract class LoadEvent extends YBaseEvent<LoadBloc, LoadState> {}

class LoadingEvent extends LoadEvent {
  @override
  Stream<LoadState> applyAsync(LoadBloc bloc, LoadState currentState) async* {
    yield LoadingState();
  }

  @override
  Future<LoadState> applyEmit(LoadBloc bloc, LoadState currentState) async{
    return Future.value(LoadingState());
  }
}

class SuccessEvent extends LoadEvent {
  @override
  Stream<LoadState> applyAsync(LoadBloc bloc, LoadState currentState) async* {
    yield SuccessState();
  }

  @override
  Future<LoadState> applyEmit(LoadBloc bloc, LoadState currentState) {
    return Future.value(SuccessState());
  }
}

class ErrorEvent extends LoadEvent {
  final Exception exception;

  ErrorEvent(this.exception);

  @override
  Stream<LoadState> applyAsync(LoadBloc bloc, LoadState currentState) async* {
    yield ErrorState(exception);
  }

  @override
  Future<LoadState> applyEmit(LoadBloc bloc, LoadState currentState) {
    return Future.value(ErrorState(exception));
  }
}
