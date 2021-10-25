part of 'test_bloc.dart';

@immutable
abstract class TestEvent extends BaseEvent<TestBloc, TestState> {}

class ChangeDataEvent extends TestEvent {
  final int data;

  ChangeDataEvent(this.data);

  @override
  Stream<TestState> applyAsync(
      {required TestBloc bloc, required TestState currentState}) async* {
    bloc.pageLoading();
    await Future.delayed(Duration(seconds: 2));
    bloc.pageSuccess();
    yield TestInitial(data);
  }

  @override
  String toString() {
    // TODO: implement toString
    return '$data';
  }
}

class ChangeDataLoadingEvent extends TestEvent {
  final int data;

  ChangeDataLoadingEvent(this.data);

  @override
  String toString() {
    // TODO: implement toString
    return '$data';
  }

  @override
  Stream<TestState> applyAsync({required TestBloc bloc, required TestState currentState}) async* {
    bloc.view?.showLoadingDialog();
    await Future.delayed(Duration(seconds: 2));
    bloc.view?.dismissDialog();
    throw PersistenceException('Test');
    yield TestInitial(data);
  }
}
