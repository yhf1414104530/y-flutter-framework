import 'package:y_framework/base/base_event.dart';
import 'package:y_framework/service/check/domian/bloc/bloc.dart';

abstract class CheckEvent extends BaseEvent<CheckBloc, CheckState> {
  CheckEvent();
}

class ChangeCheckEvent extends CheckEvent {
  final changeValue;

  ChangeCheckEvent(this.changeValue);

  @override
  Stream<CheckState> applyAsync(
      CheckBloc bloc, CheckState currentState) async* {
    yield InitialCheckState(changeValue);
  }
}
