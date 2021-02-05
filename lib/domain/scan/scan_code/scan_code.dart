import 'package:dartz/dartz.dart';
import 'package:dopagent_frontend/domain/core/failures.dart';
import 'package:dopagent_frontend/domain/scan/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'scan_code.freezed.dart';

@freezed
abstract class ScanFormat with _$ScanFormat {
  const factory ScanFormat.qrCode() = QrCode;

  const factory ScanFormat.barCode() = BarCode;
}

@freezed
abstract class ScanCode implements _$ScanCode {
  const factory ScanCode({
    @required ScanData data,
    @required ScanFormat format,
  }) = _ScanCode;

  // ignore: unused_element
  const ScanCode._();

  Option<ValueFailure<dynamic>> get failureOption {
    return data.value.fold((f) => some(f), (_) => none());
  }
}
