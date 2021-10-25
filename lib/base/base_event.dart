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
import 'package:y_framework/util/config.dart';

import 'base_bloc.dart';
import 'base_net_entity.dart';

abstract class YBaseEvent<B, S> extends InnerBaseEvent {
  Stream<S> applyAsync(B bloc, S currentState);
}

abstract class InnerBaseEvent {
  void handlerException(Bloc bloc, BaseNetEntity entity) {
    throw DomainException(entity.message.toString(), code: entity.code ?? 0);
  }

  void handlerLoadException(BaseLoadBloc bloc, BaseNetEntity entity) {
    bloc.view?.dismissDialog();
    throw DomainException(entity.message.toString(), code: entity.code ?? 0);
  }

  bool isSuccess(BaseNetEntity entity) {
    return entity.code == FConfig.ApiSuccessCode;
  }
}

///兼容旧版本
///[YBaseEvent]
@Deprecated('兼容旧版本 请使用YBaseEvent')
abstract class BaseEvent<B, S> extends InnerBaseEvent {
  Stream<S> applyAsync({required B bloc, required S currentState});
}
