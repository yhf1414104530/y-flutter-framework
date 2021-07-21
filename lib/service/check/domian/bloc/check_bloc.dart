import 'package:y_framework/base/base_bloc.dart';
import 'package:y_framework/service/check/domian/model/check_model.dart';

import './bloc.dart';

typedef ChangeValuesListener = void Function(dynamic values);

class CheckBloc extends BaseAppBloc<CheckEvent, CheckState> {
  final List<CheckModel>? checkModel;

  ChangeValuesListener? _changeValuesListener;

  final data;

  CheckBloc({this.checkModel, this.data}) : super(InitialCheckState(data));


  changeValue(changeValue) {
    add(ChangeCheckEvent(changeValue));
    if (_changeValuesListener != null) _changeValuesListener!(changeValue);
  }

  addChangeListener(ChangeValuesListener changeValuesListener) {
    this._changeValuesListener = changeValuesListener;
  }
}
