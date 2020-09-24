import 'package:y_framework/base/base_bloc.dart';
import './bloc.dart';

class MutiCheckBloc extends BaseAppBloc<MutiCheckEvent, MutiCheckState> {
  final int maxCheckLength;

  MutiCheckBloc({this.maxCheckLength = 9}) : super(InitialMutiCheckState([]));

  changeValue(checkData) {
    add(ChangeCheckDataEvent(checkData));
  }

  addValue(data) {
    add(AddCheckDataEvent(data));
  }

  removeValue(data) {
    add(RemoveCheckDataEvent(data));
  }

  cleanValue() {
    state.checkList.clear();
  }
}
