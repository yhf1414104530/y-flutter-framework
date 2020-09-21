import 'package:y_framework/base/base_event.dart';

import 'bloc.dart';

abstract class DataChangeEvent<T>
    extends BaseEvent<DataChangeBloc<T>, DataChangeState<T>> {
  DataChangeEvent();
}

class ChangeDataEvent<T> extends DataChangeEvent<T> {
  final T data;

  ChangeDataEvent(this.data);

  @override
  Stream<DataChangeState<T>> applyAsync(
      {DataChangeState currentState, DataChangeBloc bloc}) async* {
    yield InitialDataChangeState(data);
  }
}
