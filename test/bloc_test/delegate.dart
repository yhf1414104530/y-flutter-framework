import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:y_framework/base/base_bloc.dart';
import 'package:y_framework/net/exception/exception.dart';

class SimpleBlocDelegate extends BlocObserver {
  @override
  void onEvent(bloc, event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(BlocBase cubit, Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(cubit, error, stackTrace);
    if (cubit is BaseLoadBloc) {
      if(cubit.isLoading()){
        print(error is PersistenceException);
        print(error is ServiceException);
        print(error is DomainException);
        cubit.pageError(error as Exception);
      }
      print(cubit.isLoading());
    }
    if (error is DomainException) {
    } else if (error is ServiceException || error is DioError) {}
    print('$error===$cubit==$stackTrace');
  }

  @override
  void onChange(BlocBase cubit, Change change) {
    // TODO: implement onChange
    super.onChange(cubit, change);
    print('$cubit===$change');
  }
}
