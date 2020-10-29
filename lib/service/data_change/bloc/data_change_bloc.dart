import 'package:y_framework/base/base_bloc.dart';
import './bloc.dart';

class DataChangeBloc<T>
    extends BaseAppBloc<DataChangeEvent<T>, DataChangeState<T>> {
  final T data;

  final ValueChanged<T> valueChanged;

  DataChangeBloc({
    this.data,
    this.valueChanged,
  }) : super(InitialDataChangeState(data));

  void changeData(T data) {
    add(ChangeDataEvent(data));
  }
}
