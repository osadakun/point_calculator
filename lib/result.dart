import 'package:logger/logger.dart';

final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 1,
    errorMethodCount: 5,
    lineLength: 80,
    colors: true,
    printEmojis: true,
  ),
);

sealed class Result<T> {
  const Result();

  /// 成功時の値を取得し、失敗時は `orElse` の値を返す
  T getOrElse(T Function() orElse) {
    if (this is Success<T>) {
      return (this as Success<T>).value;
    } else {
      return orElse();
    }
  }

  /// 結果を別の型 `U` に変換する
  U map<U>({
    required U Function(T value) success,
    required U Function(Object error) failure,
  }) {
    if (this is Success<T>) {
      return success((this as Success<T>).value);
    } else {
      final errorValue = (this as Failure<T>).error;
      logger.d('❌ Failure occurred: $errorValue', error: errorValue);
      return failure(errorValue);
    }
  }

  /// 成功時に `Result<U>` を返す関数を適用する
  Result<U> flatMap<U>(Result<U> Function(T value) transform) {
    if (this is Success<T>) {
      return transform((this as Success<T>).value);
    } else {
      return Failure<U>((this as Failure<T>).error);
    }
  }

  /// `Failure` の場合に例外を投げる（簡潔に `throw result.throwIfFailure()` で利用可）
  void throwIfFailure() {
    if (this is Failure<T>) {
      throw (this as Failure<T>).error;
    }
  }
}

class Success<T> extends Result<T> {
  final T value;
  const Success(this.value);
}

class Failure<T> extends Result<T> {
  final Object error;
  final StackTrace stackTrace;

  Failure(this.error, [StackTrace? stackTrace])
      : stackTrace = stackTrace ?? StackTrace.current {
    logger.d('❌ Failure occurred: $error',
        error: error, stackTrace: this.stackTrace);
  }
}
