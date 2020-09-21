import 'package:y_framework/base/base_bloc.dart';
import './bloc.dart';

class DataChangeBloc<T>
    extends BaseAppBloc<DataChangeEvent<T>, DataChangeState<T>> {
  final T data;

  DataChangeBloc({this.data}) : super(InitialDataChangeState(data));

  void changeData(T data) {
    add(ChangeDataEvent(data));
  }
}
