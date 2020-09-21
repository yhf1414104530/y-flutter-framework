import 'package:equatable/equatable.dart';

abstract class CheckState extends Equatable {
  final changeValue;

  CheckState(this.changeValue);
}

class InitialCheckState extends CheckState {
  InitialCheckState(changeValue) : super(changeValue);

  @override
  List<Object> get props => [changeValue];
}
