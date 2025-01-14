// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sample_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SampleState {
// デフォルト値を設定
  String get name => throw _privateConstructorUsedError;
  int get age => throw _privateConstructorUsedError;

  /// Create a copy of SampleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SampleStateCopyWith<SampleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SampleStateCopyWith<$Res> {
  factory $SampleStateCopyWith(
          SampleState value, $Res Function(SampleState) then) =
      _$SampleStateCopyWithImpl<$Res, SampleState>;
  @useResult
  $Res call({String name, int age});
}

/// @nodoc
class _$SampleStateCopyWithImpl<$Res, $Val extends SampleState>
    implements $SampleStateCopyWith<$Res> {
  _$SampleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SampleState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? age = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SampleStateImplCopyWith<$Res>
    implements $SampleStateCopyWith<$Res> {
  factory _$$SampleStateImplCopyWith(
          _$SampleStateImpl value, $Res Function(_$SampleStateImpl) then) =
      __$$SampleStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int age});
}

/// @nodoc
class __$$SampleStateImplCopyWithImpl<$Res>
    extends _$SampleStateCopyWithImpl<$Res, _$SampleStateImpl>
    implements _$$SampleStateImplCopyWith<$Res> {
  __$$SampleStateImplCopyWithImpl(
      _$SampleStateImpl _value, $Res Function(_$SampleStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SampleState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? age = null,
  }) {
    return _then(_$SampleStateImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SampleStateImpl implements _SampleState {
  const _$SampleStateImpl({this.name = '', this.age = 0});

// デフォルト値を設定
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final int age;

  @override
  String toString() {
    return 'SampleState(name: $name, age: $age)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SampleStateImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.age, age) || other.age == age));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, age);

  /// Create a copy of SampleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SampleStateImplCopyWith<_$SampleStateImpl> get copyWith =>
      __$$SampleStateImplCopyWithImpl<_$SampleStateImpl>(this, _$identity);
}

abstract class _SampleState implements SampleState {
  const factory _SampleState({final String name, final int age}) =
      _$SampleStateImpl;

// デフォルト値を設定
  @override
  String get name;
  @override
  int get age;

  /// Create a copy of SampleState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SampleStateImplCopyWith<_$SampleStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
