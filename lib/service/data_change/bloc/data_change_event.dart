import 'package:y_framework/base/base_event.dart';

import 'bloc.dart';

abstract class DataChangeEvent<T>
    extends YBaseEvent<DataChangeBloc<T>, DataChangeState<T>> {
  DataChangeEvent();
}

class ChangeDataEvent<T> extends DataChangeEvent<T> {
  final T? data;

  ChangeDataEvent(this.data);

  @override
  Stream<DataChangeState<T>> applyAsync(
      DataChangeBloc<T> bloc, DataChangeState<T> currentState) async* {
    yield InitialDataChangeState(data);
    if (bloc.valueChanged != null) bloc.valueChanged!(data);
  }
}
