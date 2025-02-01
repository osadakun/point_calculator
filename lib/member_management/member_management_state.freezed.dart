// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_management_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MemberManagementState {
  List<Member> get members => throw _privateConstructorUsedError;

  /// Create a copy of MemberManagementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MemberManagementStateCopyWith<MemberManagementState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberManagementStateCopyWith<$Res> {
  factory $MemberManagementStateCopyWith(MemberManagementState value,
          $Res Function(MemberManagementState) then) =
      _$MemberManagementStateCopyWithImpl<$Res, MemberManagementState>;
  @useResult
  $Res call({List<Member> members});
}

/// @nodoc
class _$MemberManagementStateCopyWithImpl<$Res,
        $Val extends MemberManagementState>
    implements $MemberManagementStateCopyWith<$Res> {
  _$MemberManagementStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MemberManagementState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? members = null,
  }) {
    return _then(_value.copyWith(
      members: null == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<Member>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MemberManagementStateImplCopyWith<$Res>
    implements $MemberManagementStateCopyWith<$Res> {
  factory _$$MemberManagementStateImplCopyWith(
          _$MemberManagementStateImpl value,
          $Res Function(_$MemberManagementStateImpl) then) =
      __$$MemberManagementStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Member> members});
}

/// @nodoc
class __$$MemberManagementStateImplCopyWithImpl<$Res>
    extends _$MemberManagementStateCopyWithImpl<$Res,
        _$MemberManagementStateImpl>
    implements _$$MemberManagementStateImplCopyWith<$Res> {
  __$$MemberManagementStateImplCopyWithImpl(_$MemberManagementStateImpl _value,
      $Res Function(_$MemberManagementStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MemberManagementState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? members = null,
  }) {
    return _then(_$MemberManagementStateImpl(
      members: null == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<Member>,
    ));
  }
}

/// @nodoc

class _$MemberManagementStateImpl implements _MemberManagementState {
  const _$MemberManagementStateImpl({final List<Member> members = const []})
      : _members = members;

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
    return 'MemberManagementState(members: $members)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemberManagementStateImpl &&
            const DeepCollectionEquality().equals(other._members, _members));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_members));

  /// Create a copy of MemberManagementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MemberManagementStateImplCopyWith<_$MemberManagementStateImpl>
      get copyWith => __$$MemberManagementStateImplCopyWithImpl<
          _$MemberManagementStateImpl>(this, _$identity);
}

abstract class _MemberManagementState implements MemberManagementState {
  const factory _MemberManagementState({final List<Member> members}) =
      _$MemberManagementStateImpl;

  @override
  List<Member> get members;

  /// Create a copy of MemberManagementState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MemberManagementStateImplCopyWith<_$MemberManagementStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
