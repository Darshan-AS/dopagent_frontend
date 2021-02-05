import 'package:dartz/dartz.dart';
import 'package:dopagent_frontend/domain/core/failures.dart';
import 'package:dopagent_frontend/domain/core/value_objects.dart';
import 'package:dopagent_frontend/domain/core/value_validators.dart';

class ScanData extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory ScanData(String qrCode) => ScanData._(qrCodeValidator(qrCode));

  const ScanData._(this.value);
}
