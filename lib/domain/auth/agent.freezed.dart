// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'agent.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$AgentTearOff {
  const _$AgentTearOff();

// ignore: unused_element
  _Agent call({@required UniqueId id}) {
    return _Agent(
      id: id,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Agent = _$AgentTearOff();

/// @nodoc
mixin _$Agent {
  UniqueId get id;

  @JsonKey(ignore: true)
  $AgentCopyWith<Agent> get copyWith;
}

/// @nodoc
abstract class $AgentCopyWith<$Res> {
  factory $AgentCopyWith(Agent value, $Res Function(Agent) then) =
      _$AgentCopyWithImpl<$Res>;
  $Res call({UniqueId id});
}

/// @nodoc
class _$AgentCopyWithImpl<$Res> implements $AgentCopyWith<$Res> {
  _$AgentCopyWithImpl(this._value, this._then);

  final Agent _value;
  // ignore: unused_field
  final $Res Function(Agent) _then;

  @override
  $Res call({
    Object id = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as UniqueId,
    ));
  }
}

/// @nodoc
abstract class _$AgentCopyWith<$Res> implements $AgentCopyWith<$Res> {
  factory _$AgentCopyWith(_Agent value, $Res Function(_Agent) then) =
      __$AgentCopyWithImpl<$Res>;
  @override
  $Res call({UniqueId id});
}

/// @nodoc
class __$AgentCopyWithImpl<$Res> extends _$AgentCopyWithImpl<$Res>
    implements _$AgentCopyWith<$Res> {
  __$AgentCopyWithImpl(_Agent _value, $Res Function(_Agent) _then)
      : super(_value, (v) => _then(v as _Agent));

  @override
  _Agent get _value => super._value as _Agent;

  @override
  $Res call({
    Object id = freezed,
  }) {
    return _then(_Agent(
      id: id == freezed ? _value.id : id as UniqueId,
    ));
  }
}

/// @nodoc
class _$_Agent implements _Agent {
  const _$_Agent({@required this.id}) : assert(id != null);

  @override
  final UniqueId id;

  @override
  String toString() {
    return 'Agent(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Agent &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(id);

  @JsonKey(ignore: true)
  @override
  _$AgentCopyWith<_Agent> get copyWith =>
      __$AgentCopyWithImpl<_Agent>(this, _$identity);
}

abstract class _Agent implements Agent {
  const factory _Agent({@required UniqueId id}) = _$_Agent;

  @override
  UniqueId get id;
  @override
  @JsonKey(ignore: true)
  _$AgentCopyWith<_Agent> get copyWith;
}
