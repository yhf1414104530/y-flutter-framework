import 'package:y_framework/base/base_event.dart';
import 'package:y_framework/net/exception/exception.dart';
import 'package:y_framework/service/check/domian/bloc/muti_check_bloc/bloc.dart';

import 'muti_check_bloc.dart';

abstract class MutiCheckEvent extends YBaseEvent<MutiCheckBloc, MutiCheckState> {
  MutiCheckEvent();
}

class ChangeCheckDataEvent extends MutiCheckEvent {
  final checkData;

  ChangeCheckDataEvent(this.checkData);

  @override
  Stream<MutiCheckState> applyAsync(
      MutiCheckBloc bloc, MutiCheckState currentState) async* {
    if (currentState.checkList.contains(checkData)) {
      currentState.checkList.remove(checkData);
    } else {
      if (currentState.checkList.length >= bloc.maxCheckLength) {
        throw DomainException('当前最多可选择${bloc.maxCheckLength}项');
      }
      currentState.checkList.add(checkData);
    }
    // TODO: implement applyAsync
    yield InitialMutiCheckState(currentState.checkList);
  }
}

class AddCheckDataEvent extends MutiCheckEvent {
  final data;

  AddCheckDataEvent(this.data);

  @override
  Stream<MutiCheckState> applyAsync(
      MutiCheckBloc bloc, MutiCheckState currentState) async* {
    currentState.checkList.add(data);
    yield InitialMutiCheckState(currentState.checkList);
  }
}

class RemoveCheckDataEvent extends MutiCheckEvent {
  final data;

  RemoveCheckDataEvent(this.data);

  @override
  Stream<MutiCheckState> applyAsync(
      MutiCheckBloc bloc, MutiCheckState currentState) async* {
    currentState.checkList.remove(data);
    yield InitialMutiCheckState(currentState.checkList);
  }
}
