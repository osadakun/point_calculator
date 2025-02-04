// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_room_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateRoomState {
  String get roomName => throw _privateConstructorUsedError;
  List<Member> get members => throw _privateConstructorUsedError;

  /// Create a copy of CreateRoomState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateRoomStateCopyWith<CreateRoomState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateRoomStateCopyWith<$Res> {
  factory $CreateRoomStateCopyWith(
          CreateRoomState value, $Res Function(CreateRoomState) then) =
      _$CreateRoomStateCopyWithImpl<$Res, CreateRoomState>;
  @useResult
  $Res call({String roomName, List<Member> members});
}

/// @nodoc
class _$CreateRoomStateCopyWithImpl<$Res, $Val extends CreateRoomState>
    implements $CreateRoomStateCopyWith<$Res> {
  _$CreateRoomStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateRoomState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomName = null,
    Object? members = null,
  }) {
    return _then(_value.copyWith(
      roomName: null == roomName
          ? _value.roomName
          : roomName // ignore: cast_nullable_to_non_nullable
              as String,
      members: null == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<Member>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateRoomStateImplCopyWith<$Res>
    implements $CreateRoomStateCopyWith<$Res> {
  factory _$$CreateRoomStateImplCopyWith(_$CreateRoomStateImpl value,
          $Res Function(_$CreateRoomStateImpl) then) =
      __$$CreateRoomStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String roomName, List<Member> members});
}

/// @nodoc
class __$$CreateRoomStateImplCopyWithImpl<$Res>
    extends _$CreateRoomStateCopyWithImpl<$Res, _$CreateRoomStateImpl>
    implements _$$CreateRoomStateImplCopyWith<$Res> {
  __$$CreateRoomStateImplCopyWithImpl(
      _$CreateRoomStateImpl _value, $Res Function(_$CreateRoomStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateRoomState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomName = null,
    Object? members = null,
  }) {
    return _then(_$CreateRoomStateImpl(
      roomName: null == roomName
          ? _value.roomName
          : roomName // ignore: cast_nullable_to_non_nullable
              as String,
      members: null == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<Member>,
    ));
  }
}

/// @nodoc

class _$CreateRoomStateImpl implements _CreateRoomState {
  const _$CreateRoomStateImpl(
      {this.roomName = '', final List<Member> members = const []})
      : _members = members;

  @override
  @JsonKey()
  final String roomName;
  final List<Member> _members;
  @override
  @JsonKey()
  List<Member> get members {
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  @override
  String toString() {
    return 'CreateRoomState(roomName: $roomName, members: $members)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateRoomStateImpl &&
            (identical(other.roomName, roomName) ||
                other.roomName == roomName) &&
            const DeepCollectionEquality().equals(other._members, _members));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, roomName, const DeepCollectionEquality().hash(_members));

  /// Create a copy of CreateRoomState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateRoomStateImplCopyWith<_$CreateRoomStateImpl> get copyWith =>
      __$$CreateRoomStateImplCopyWithImpl<_$CreateRoomStateImpl>(
          this, _$identity);
}

abstract class _CreateRoomState implements CreateRoomState {
  const factory _CreateRoomState(
      {final String roomName,
      final List<Member> members}) = _$CreateRoomStateImpl;

  @override
  String get roomName;
  @override
  List<Member> get members;

  /// Create a copy of CreateRoomState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateRoomStateImplCopyWith<_$CreateRoomStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Member {
  String get name => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;

  /// Create a copy of Member
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MemberCopyWith<Member> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberCopyWith<$Res> {
  factory $MemberCopyWith(Member value, $Res Function(Member) then) =
      _$MemberCopyWithImpl<$Res, Member>;
  @useResult
  $Res call({String name, int id});
}

/// @nodoc
class _$MemberCopyWithImpl<$Res, $Val extends Member>
    implements $MemberCopyWith<$Res> {
  _$MemberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Member
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MemberImplCopyWith<$Res> implements $MemberCopyWith<$Res> {
  factory _$$MemberImplCopyWith(
          _$MemberImpl value, $Res Function(_$MemberImpl) then) =
      __$$MemberImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int id});
}

/// @nodoc
class __$$MemberImplCopyWithImpl<$Res>
    extends _$MemberCopyWithImpl<$Res, _$MemberImpl>
    implements _$$MemberImplCopyWith<$Res> {
  __$$MemberImplCopyWithImpl(
      _$MemberImpl _value, $Res Function(_$MemberImpl) _then)
      : super(_value, _then);

  /// Create a copy of Member
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
  }) {
    return _then(_$MemberImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$MemberImpl implements _Member {
  const _$MemberImpl({this.name = '', this.id = 0});

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final int id;

  @override
  String toString() {
    return 'Member(name: $name, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemberImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, id);

  /// Create a copy of Member
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MemberImplCopyWith<_$MemberImpl> get copyWith =>
      __$$MemberImplCopyWithImpl<_$MemberImpl>(this, _$identity);
}

abstract class _Member implements Member {
  const factory _Member({final String name, final int id}) = _$MemberImpl;

  @override
  String get name;
  @override
  int get id;

  /// Create a copy of Member
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MemberImplCopyWith<_$MemberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
