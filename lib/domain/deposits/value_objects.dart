import 'package:dartz/dartz.dart';
import 'package:dopagent_frontend/domain/core/failures.dart';
import 'package:dopagent_frontend/domain/core/value_objects.dart';
import 'package:dopagent_frontend/domain/core/value_validators.dart';

class NoOfInstallments extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  factory NoOfInstallments(int noOfInstallments) =>
      NoOfInstallments._(positiveNumValidator(noOfInstallments));

  const NoOfInstallments._(this.value);
}
