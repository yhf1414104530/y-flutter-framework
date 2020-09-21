import 'package:equatable/equatable.dart';

abstract class DataChangeState<T> {
  final T data;

  const DataChangeState(this.data);
}

class InitialDataChangeState<T> extends DataChangeState<T> {
  InitialDataChangeState(data) : super(data);
}
