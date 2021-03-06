import 'package:dopagent_frontend/domain/core/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'agent.freezed.dart';

@freezed
abstract class Agent with _$Agent {
  const factory Agent({@required UniqueId id}) = _Agent;
}
