part of 'test_bloc.dart';

@immutable
abstract class TestState {
  final int num;

  TestState(this.num);

  @override
  String toString() {
    // TODO: implement toString
    return '$num';
  }
}

class TestInitial extends TestState {
  TestInitial(int num) : super(num);
}
