import 'package:freezed_annotation/freezed_annotation.dart';

part 'installment_failure.freezed.dart';

@freezed
abstract class InstallmentFailure with _$InstallmentFailure {
  const factory InstallmentFailure.unexpected() = _Unexpected;
}
