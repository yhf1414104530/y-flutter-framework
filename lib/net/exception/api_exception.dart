export 'error_data.dart';

import 'error_data.dart';

// 底层持久化异常，例如‘网络故障’等
class PersistenceException extends BaseException {
  PersistenceException(Object message, {int code}) : super(message, code: code);
}

// 业务层异常，各类业务错误，包含领域层和服务层（服务层也称为应用层）
class TransactionException extends BaseException {
  TransactionException(Object message, {int code}) : super(message, code: code);
}

// 领域层异常，例如‘用户无权限’等
class DomainException extends TransactionException {
  DomainException(Object message, {int code}) : super(message, code: code);
}

// 服务层异常
class ServiceException extends TransactionException {
  ServiceException(Object message, {int code}) : super(message, code: code);
}

abstract class BaseException extends FormatException {
  final int code;

  BaseException(Object message, {int code})
      : code = code,
        super(message);
}
