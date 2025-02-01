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
      return failure((this as Failure<T>).error);
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
}

class Success<T> extends Result<T> {
  final T value;
  const Success(this.value);
}

class Failure<T> extends Result<T> {
  final Object error;
  const Failure(this.error);
}
