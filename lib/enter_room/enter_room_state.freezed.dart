// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'enter_room_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EnterRoomState {
  List<RoomName> get roomNames => throw _privateConstructorUsedError;

  /// Create a copy of EnterRoomState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EnterRoomStateCopyWith<EnterRoomState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnterRoomStateCopyWith<$Res> {
  factory $EnterRoomStateCopyWith(
          EnterRoomState value, $Res Function(EnterRoomState) then) =
      _$EnterRoomStateCopyWithImpl<$Res, EnterRoomState>;
  @useResult
  $Res call({List<RoomName> roomNames});
}

/// @nodoc
class _$EnterRoomStateCopyWithImpl<$Res, $Val extends EnterRoomState>
    implements $EnterRoomStateCopyWith<$Res> {
  _$EnterRoomStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EnterRoomState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomNames = null,
  }) {
    return _then(_value.copyWith(
      roomNames: null == roomNames
          ? _value.roomNames
          : roomNames // ignore: cast_nullable_to_non_nullable
              as List<RoomName>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EnterRoomStateImplCopyWith<$Res>
    implements $EnterRoomStateCopyWith<$Res> {
  factory _$$EnterRoomStateImplCopyWith(_$EnterRoomStateImpl value,
          $Res Function(_$EnterRoomStateImpl) then) =
      __$$EnterRoomStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<RoomName> roomNames});
}

/// @nodoc
class __$$EnterRoomStateImplCopyWithImpl<$Res>
    extends _$EnterRoomStateCopyWithImpl<$Res, _$EnterRoomStateImpl>
    implements _$$EnterRoomStateImplCopyWith<$Res> {
  __$$EnterRoomStateImplCopyWithImpl(
      _$EnterRoomStateImpl _value, $Res Function(_$EnterRoomStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of EnterRoomState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomNames = null,
  }) {
    return _then(_$EnterRoomStateImpl(
      roomNames: null == roomNames
          ? _value._roomNames
          : roomNames // ignore: cast_nullable_to_non_nullable
              as List<RoomName>,
    ));
  }
}

/// @nodoc

class _$EnterRoomStateImpl implements _EnterRoomState {
  const _$EnterRoomStateImpl({final List<RoomName> roomNames = const []})
      : _roomNames = roomNames;

  final List<RoomName> _roomNames;
  @override
  @JsonKey()
  List<RoomName> get roomNames {
    if (_roomNames is EqualUnmodifiableListView) return _roomNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_roomNames);
  }

  @override
  String toString() {
    return 'EnterRoomState(roomNames: $roomNames)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnterRoomStateImpl &&
            const DeepCollectionEquality()
                .equals(other._roomNames, _roomNames));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_roomNames));

  /// Create a copy of EnterRoomState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EnterRoomStateImplCopyWith<_$EnterRoomStateImpl> get copyWith =>
      __$$EnterRoomStateImplCopyWithImpl<_$EnterRoomStateImpl>(
          this, _$identity);
}

abstract class _EnterRoomState implements EnterRoomState {
  const factory _EnterRoomState({final List<RoomName> roomNames}) =
      _$EnterRoomStateImpl;

  @override
  List<RoomName> get roomNames;

  /// Create a copy of EnterRoomState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EnterRoomStateImplCopyWith<_$EnterRoomStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RoomName {
  String get name => throw _privateConstructorUsedError;
  int get roomId => throw _privateConstructorUsedError;
  List<String> get members => throw _privateConstructorUsedError;

  /// Create a copy of RoomName
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RoomNameCopyWith<RoomName> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomNameCopyWith<$Res> {
  factory $RoomNameCopyWith(RoomName value, $Res Function(RoomName) then) =
      _$RoomNameCopyWithImpl<$Res, RoomName>;
  @useResult
  $Res call({String name, int roomId, List<String> members});
}

/// @nodoc
class _$RoomNameCopyWithImpl<$Res, $Val extends RoomName>
    implements $RoomNameCopyWith<$Res> {
  _$RoomNameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RoomName
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? roomId = null,
    Object? members = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as int,
      members: null == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoomNameImplCopyWith<$Res>
    implements $RoomNameCopyWith<$Res> {
  factory _$$RoomNameImplCopyWith(
          _$RoomNameImpl value, $Res Function(_$RoomNameImpl) then) =
      __$$RoomNameImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int roomId, List<String> members});
}

/// @nodoc
class __$$RoomNameImplCopyWithImpl<$Res>
    extends _$RoomNameCopyWithImpl<$Res, _$RoomNameImpl>
    implements _$$RoomNameImplCopyWith<$Res> {
  __$$RoomNameImplCopyWithImpl(
      _$RoomNameImpl _value, $Res Function(_$RoomNameImpl) _then)
      : super(_value, _then);

  /// Create a copy of RoomName
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? roomId = null,
    Object? members = null,
  }) {
    return _then(_$RoomNameImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as int,
      members: null == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$RoomNameImpl implements _RoomName {
  const _$RoomNameImpl(
      {this.name = '', this.roomId = 0, final List<String> members = const []})
      : _members = members;

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final int roomId;
  final List<String> _members;
  @override
  @JsonKey()
  List<String> get members {
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  @override
  String toString() {
    return 'RoomName(name: $name, roomId: $roomId, members: $members)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomNameImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            const DeepCollectionEquality().equals(other._members, _members));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, name, roomId, const DeepCollectionEquality().hash(_members));

  /// Create a copy of RoomName
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomNameImplCopyWith<_$RoomNameImpl> get copyWith =>
      __$$RoomNameImplCopyWithImpl<_$RoomNameImpl>(this, _$identity);
}

abstract class _RoomName implements RoomName {
  const factory _RoomName(
      {final String name,
      final int roomId,
      final List<String> members}) = _$RoomNameImpl;

  @override
  String get name;
  @override
  int get roomId;
  @override
  List<String> get members;

  /// Create a copy of RoomName
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RoomNameImplCopyWith<_$RoomNameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
