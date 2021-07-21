/*
 * 项目名:    gma_law_flutter
 * 包名
 * 文件名:    base_event
 * 创建时间:  2019-12-25 on 17:13
 * 描述:
 *
 * @author   YHF
 */

import 'package:bloc/bloc.dart';
import 'package:y_framework/net/exception/exception.dart';

import 'base_bloc.dart';
import 'base_net_entity.dart';

abstract class BaseEvent<B, S> {
  Stream<S> applyAsync({required B bloc,required S currentState});

  void handlerException(Bloc bloc, BaseNetEntity entity) {
    throw DomainException(entity.message.toString(), code: entity.code ?? 0);
  }

  void handlerLoadException(BaseLoadBloc bloc, BaseNetEntity entity) {
    bloc.view?.dismissDialog();
    throw DomainException(entity.message.toString(), code: entity.code ?? 0);
  }

  bool isSuccess(BaseNetEntity entity) {
    return entity.code == 200;
  }
}
