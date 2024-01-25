// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_freezed_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RegisterFreezedState {
  List<dynamic> get employeeDataList => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isDataNotFound => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<dynamic> employeeDataList, bool isLoading, bool isDataNotFound)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<dynamic> employeeDataList, bool isLoading,
            bool isDataNotFound)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<dynamic> employeeDataList, bool isLoading,
            bool isDataNotFound)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterFreezedStateCopyWith<RegisterFreezedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterFreezedStateCopyWith<$Res> {
  factory $RegisterFreezedStateCopyWith(RegisterFreezedState value,
          $Res Function(RegisterFreezedState) then) =
      _$RegisterFreezedStateCopyWithImpl<$Res, RegisterFreezedState>;
  @useResult
  $Res call(
      {List<dynamic> employeeDataList, bool isLoading, bool isDataNotFound});
}

/// @nodoc
class _$RegisterFreezedStateCopyWithImpl<$Res,
        $Val extends RegisterFreezedState>
    implements $RegisterFreezedStateCopyWith<$Res> {
  _$RegisterFreezedStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employeeDataList = null,
    Object? isLoading = null,
    Object? isDataNotFound = null,
  }) {
    return _then(_value.copyWith(
      employeeDataList: null == employeeDataList
          ? _value.employeeDataList
          : employeeDataList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isDataNotFound: null == isDataNotFound
          ? _value.isDataNotFound
          : isDataNotFound // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $RegisterFreezedStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<dynamic> employeeDataList, bool isLoading, bool isDataNotFound});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$RegisterFreezedStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employeeDataList = null,
    Object? isLoading = null,
    Object? isDataNotFound = null,
  }) {
    return _then(_$InitialImpl(
      employeeDataList: null == employeeDataList
          ? _value._employeeDataList
          : employeeDataList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isDataNotFound: null == isDataNotFound
          ? _value.isDataNotFound
          : isDataNotFound // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {final List<dynamic> employeeDataList = const [],
      this.isLoading = false,
      this.isDataNotFound = false})
      : _employeeDataList = employeeDataList;

  final List<dynamic> _employeeDataList;
  @override
  @JsonKey()
  List<dynamic> get employeeDataList {
    if (_employeeDataList is EqualUnmodifiableListView)
      return _employeeDataList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_employeeDataList);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isDataNotFound;

  @override
  String toString() {
    return 'RegisterFreezedState.initial(employeeDataList: $employeeDataList, isLoading: $isLoading, isDataNotFound: $isDataNotFound)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality()
                .equals(other._employeeDataList, _employeeDataList) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isDataNotFound, isDataNotFound) ||
                other.isDataNotFound == isDataNotFound));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_employeeDataList),
      isLoading,
      isDataNotFound);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<dynamic> employeeDataList, bool isLoading, bool isDataNotFound)
        initial,
  }) {
    return initial(employeeDataList, isLoading, isDataNotFound);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<dynamic> employeeDataList, bool isLoading,
            bool isDataNotFound)?
        initial,
  }) {
    return initial?.call(employeeDataList, isLoading, isDataNotFound);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<dynamic> employeeDataList, bool isLoading,
            bool isDataNotFound)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(employeeDataList, isLoading, isDataNotFound);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements RegisterFreezedState {
  const factory _Initial(
      {final List<dynamic> employeeDataList,
      final bool isLoading,
      final bool isDataNotFound}) = _$InitialImpl;

  @override
  List<dynamic> get employeeDataList;
  @override
  bool get isLoading;
  @override
  bool get isDataNotFound;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
