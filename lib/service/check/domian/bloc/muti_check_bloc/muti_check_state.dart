import 'package:equatable/equatable.dart';

abstract class MutiCheckState extends Equatable {
  final List checkList;

  const MutiCheckState(this.checkList);
}

class InitialMutiCheckState extends MutiCheckState {
  InitialMutiCheckState(List checkList) : super(checkList);

  @override
  List<Object> get props => [DateTime.now().toIso8601String()];
}
