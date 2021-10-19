import 'package:y_framework/base/base_event.dart';

import 'bloc.dart';

abstract class LoadEvent extends BaseEvent<LoadBloc, LoadState> {}

class LoadingEvent extends LoadEvent {
  @override
  Stream<LoadState> applyAsync(LoadBloc bloc, LoadState currentState) async* {
    yield LoadingState();
  }
}

class SuccessEvent extends LoadEvent {
  @override
  Stream<LoadState> applyAsync(LoadBloc bloc, LoadState currentState) async* {
    yield SuccessState();
  }
}

class ErrorEvent extends LoadEvent {
  final Exception exception;

  ErrorEvent(this.exception);

  @override
  Stream<LoadState> applyAsync(LoadBloc bloc, LoadState currentState) async* {
    yield ErrorState(exception);
  }
}
