// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'each_room_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EachRoom {
  String get roomName => throw _privateConstructorUsedError;
  int get roomId => throw _privateConstructorUsedError;
  List<Member> get roomMembers => throw _privateConstructorUsedError;
  int get basePoint => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get scoreInfo =>
      throw _privateConstructorUsedError;

  /// Create a copy of EachRoom
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EachRoomCopyWith<EachRoom> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EachRoomCopyWith<$Res> {
  factory $EachRoomCopyWith(EachRoom value, $Res Function(EachRoom) then) =
      _$EachRoomCopyWithImpl<$Res, EachRoom>;
  @useResult
  $Res call(
      {String roomName,
      int roomId,
      List<Member> roomMembers,
      int basePoint,
      List<Map<String, dynamic>> scoreInfo});
}

/// @nodoc
class _$EachRoomCopyWithImpl<$Res, $Val extends EachRoom>
    implements $EachRoomCopyWith<$Res> {
  _$EachRoomCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EachRoom
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomName = null,
    Object? roomId = null,
    Object? roomMembers = null,
    Object? basePoint = null,
    Object? scoreInfo = null,
  }) {
    return _then(_value.copyWith(
      roomName: null == roomName
          ? _value.roomName
          : roomName // ignore: cast_nullable_to_non_nullable
              as String,
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as int,
      roomMembers: null == roomMembers
          ? _value.roomMembers
          : roomMembers // ignore: cast_nullable_to_non_nullable
              as List<Member>,
      basePoint: null == basePoint
          ? _value.basePoint
          : basePoint // ignore: cast_nullable_to_non_nullable
              as int,
      scoreInfo: null == scoreInfo
          ? _value.scoreInfo
          : scoreInfo // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EachRoomImplCopyWith<$Res>
    implements $EachRoomCopyWith<$Res> {
  factory _$$EachRoomImplCopyWith(
          _$EachRoomImpl value, $Res Function(_$EachRoomImpl) then) =
      __$$EachRoomImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String roomName,
      int roomId,
      List<Member> roomMembers,
      int basePoint,
      List<Map<String, dynamic>> scoreInfo});
}

/// @nodoc
class __$$EachRoomImplCopyWithImpl<$Res>
    extends _$EachRoomCopyWithImpl<$Res, _$EachRoomImpl>
    implements _$$EachRoomImplCopyWith<$Res> {
  __$$EachRoomImplCopyWithImpl(
      _$EachRoomImpl _value, $Res Function(_$EachRoomImpl) _then)
      : super(_value, _then);

  /// Create a copy of EachRoom
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomName = null,
    Object? roomId = null,
    Object? roomMembers = null,
    Object? basePoint = null,
    Object? scoreInfo = null,
  }) {
    return _then(_$EachRoomImpl(
      roomName: null == roomName
          ? _value.roomName
          : roomName // ignore: cast_nullable_to_non_nullable
              as String,
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as int,
      roomMembers: null == roomMembers
          ? _value._roomMembers
          : roomMembers // ignore: cast_nullable_to_non_nullable
              as List<Member>,
      basePoint: null == basePoint
          ? _value.basePoint
          : basePoint // ignore: cast_nullable_to_non_nullable
              as int,
      scoreInfo: null == scoreInfo
          ? _value._scoreInfo
          : scoreInfo // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc

class _$EachRoomImpl implements _EachRoom {
  const _$EachRoomImpl(
      {this.roomName = '',
      this.roomId = 0,
      final List<Member> roomMembers = const [],
      this.basePoint = 0,
      final List<Map<String, dynamic>> scoreInfo = const []})
      : _roomMembers = roomMembers,
        _scoreInfo = scoreInfo;

  @override
  @JsonKey()
  final String roomName;
  @override
  @JsonKey()
  final int roomId;
  final List<Member> _roomMembers;
  @override
  @JsonKey()
  List<Member> get roomMembers {
    if (_roomMembers is EqualUnmodifiableListView) return _roomMembers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_roomMembers);
  }

  @override
  @JsonKey()
  final int basePoint;
  final List<Map<String, dynamic>> _scoreInfo;
  @override
  @JsonKey()
  List<Map<String, dynamic>> get scoreInfo {
    if (_scoreInfo is EqualUnmodifiableListView) return _scoreInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_scoreInfo);
  }

  @override
  String toString() {
    return 'EachRoom(roomName: $roomName, roomId: $roomId, roomMembers: $roomMembers, basePoint: $basePoint, scoreInfo: $scoreInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EachRoomImpl &&
            (identical(other.roomName, roomName) ||
                other.roomName == roomName) &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            const DeepCollectionEquality()
                .equals(other._roomMembers, _roomMembers) &&
            (identical(other.basePoint, basePoint) ||
                other.basePoint == basePoint) &&
            const DeepCollectionEquality()
                .equals(other._scoreInfo, _scoreInfo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      roomName,
      roomId,
      const DeepCollectionEquality().hash(_roomMembers),
      basePoint,
      const DeepCollectionEquality().hash(_scoreInfo));

  /// Create a copy of EachRoom
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EachRoomImplCopyWith<_$EachRoomImpl> get copyWith =>
      __$$EachRoomImplCopyWithImpl<_$EachRoomImpl>(this, _$identity);
}

abstract class _EachRoom implements EachRoom {
  const factory _EachRoom(
      {final String roomName,
      final int roomId,
      final List<Member> roomMembers,
      final int basePoint,
      final List<Map<String, dynamic>> scoreInfo}) = _$EachRoomImpl;

  @override
  String get roomName;
  @override
  int get roomId;
  @override
  List<Member> get roomMembers;
  @override
  int get basePoint;
  @override
  List<Map<String, dynamic>> get scoreInfo;

  /// Create a copy of EachRoom
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EachRoomImplCopyWith<_$EachRoomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
