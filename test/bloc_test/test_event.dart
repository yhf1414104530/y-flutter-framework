part of 'test_bloc.dart';

abstract class TestEvent extends BaseEvent<TestBloc, TestState> {}

class ChangeDataEvent extends TestEvent {
  final int data;

  ChangeDataEvent(this.data);

  @override
  Stream<TestState> applyAsync(TestBloc bloc, TestState currentState) async* {
    bloc.pageLoading();
    await Future.delayed(Duration(seconds: 2));
    bloc.pageSuccess();
    yield TestInitial(data);
  }

  @override
  Future<TestState> applyEmit(TestBloc bloc, TestState currentState) async {
    bloc.pageLoading();
    await Future.delayed(Duration(seconds: 2));
    bloc.pageSuccess();
    return TestInitial(data);
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
  Stream<TestState> applyAsync(TestBloc bloc, TestState currentState) async* {
    bloc.view?.showLoadingDialog();
    await Future.delayed(Duration(seconds: 2));
    bloc.view?.dismissDialog();
    throw PersistenceException('Test');
    yield TestInitial(data);
  }

  @override
  applyEmit(TestBloc bloc, TestState currentState) async {
    bloc.view?.showLoadingDialog();
    await Future.delayed(Duration(seconds: 2));
    bloc.view?.dismissDialog();
    throw PersistenceException('Test');
  }
}
