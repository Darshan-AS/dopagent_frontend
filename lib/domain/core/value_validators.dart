import 'package:dartz/dartz.dart';
import 'package:dopagent_frontend/domain/core/failures.dart';

Either<ValueFailure<String>, String> emailValidator(String email) {
  const emailRegex =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";
  return RegExp(emailRegex).hasMatch(email)
      ? right(email)
      : left(ValueFailure.invalidEmail(invalidValue: email));
}

Either<ValueFailure<String>, String> passwordValidator(String password) {
  return password.length >= 6
      ? right(password)
      : left(ValueFailure.shortPassword(invalidValue: password));
}

Either<ValueFailure<String>, String> qrCodeValidator(String qrCode) {
  return qrCode.isNotEmpty
      ? right(qrCode)
      : left(ValueFailure.invalidQrCode(invalidValue: qrCode));
}

Either<ValueFailure<String>, String> notEmptyValidator(String stringValue) {
  return stringValue.isNotEmpty
      ? right(stringValue)
      : left(ValueFailure.emptyValue(invalidValue: stringValue));
}

Either<ValueFailure<T>, T> unsignedNumValidator<T>(T value) {
  return value is num && !value.isNegative
      ? right(value)
      : left(ValueFailure.negativeValue(invalidValue: value));
}

Either<ValueFailure<T>, T> positiveNumValidator<T>(T value) {
  return value is num && value > 0
      ? right(value)
      : left(ValueFailure.invalidValue(invalidValue: value));
}

Either<ValueFailure<String>, String> accountNumberValidator(
  String accountNumber,
) {
  return accountNumber.isNotEmpty
      ? right(accountNumber)
      : left(ValueFailure.invalidAccountNumber(invalidValue: accountNumber));
}

Either<ValueFailure<double>, double> denominationValidator(
  double denomination,
) {
  return denomination >= 10
      ? right(denomination)
      : left(ValueFailure.invalidDenomination(invalidValue: denomination));
}

Either<ValueFailure<DateTime>, DateTime> dateValidator(String dateString) {
  try {
    final dateTime = DateTime.parse(dateString);
    return right(dateTime);
  } catch (_) {
    return left(ValueFailure.invalidDate(invalidValue: DateTime.now()));
  }
}
