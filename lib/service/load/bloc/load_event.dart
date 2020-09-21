import 'package:y_framework/base/base_event.dart';

import 'bloc.dart';

abstract class LoadEvent extends BaseEvent<LoadBloc, LoadState> {}

class LoadingEvent extends LoadEvent {
  @override
  Stream<LoadState> applyAsync({LoadState currentState, LoadBloc bloc}) async* {
    yield LoadingState();
  }
}

class SuccessEvent extends LoadEvent {
  @override
  Stream<LoadState> applyAsync({LoadState currentState, LoadBloc bloc}) async* {
    yield SuccessState();
  }
}

class ErrorEvent extends LoadEvent {
  final Exception exception;

  ErrorEvent(this.exception);

  @override
  Stream<LoadState> applyAsync({LoadState currentState, LoadBloc bloc}) async* {
    yield ErrorState(exception);
  }
}
