abstract class LoadState {}

class InitialState extends LoadState {}

class LoadingState extends LoadState {}

class ErrorState extends LoadState {
  final Exception ex;

  ErrorState(this.ex);
}

class SuccessState extends LoadState {}
