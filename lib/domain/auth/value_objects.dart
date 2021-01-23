import 'package:dartz/dartz.dart';
import 'package:dopagent_frontend/domain/core/failures.dart';
import 'package:dopagent_frontend/domain/core/value_objects.dart';


class Email extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;

  factory Email(String email) => Email._(emailValidator(email));

  const Email._(this.value);
}

class Password extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;

  factory Password(String password) => Password._(passwordValidator(password));

  const Password._(this.value);
}
