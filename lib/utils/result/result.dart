abstract class Result<T> {
  const Result();

  factory Result.ok(T value) = Ok._; //? Tears off pattern
  factory Result.error(Exception error) =>
      Error._(error); //? Parameters pattern, needs a arrow function
}

final class Ok<T> extends Result<T> {
  Ok._(this.value);
  final T value;
}

final class Error<T> extends Result<T> {
  Error._(this.error);

  Exception error;
}

extension ResultExtension on Object {
  Result ok() {
    return Result.ok(this);
  }
}

extension ResultException on Exception {
  Result error() {
    return Result.error(this);
  }
}

extension ResulCasting<T> on Result<T> {
  Ok<T> get asOk => this as Ok<T>;

  Error<T> get asError => this as Error<T>;
}
