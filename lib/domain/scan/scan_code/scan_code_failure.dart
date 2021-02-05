import 'package:freezed_annotation/freezed_annotation.dart';

part 'scan_code_failure.freezed.dart';

@freezed
abstract class ScanCodeFailure with _$ScanCodeFailure {
  const factory ScanCodeFailure.unexpected() = _Unexpected;
}
