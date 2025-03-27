// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TodoApiModel _$TodoApiModelFromJson(Map<String, dynamic> json) {
  return CreateTodoApiModel.fromJson(json);
}

/// @nodoc
mixin _$TodoApiModel {
  String get name => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) create,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? create,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? create,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateTodoApiModel value) create,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateTodoApiModel value)? create,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateTodoApiModel value)? create,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this TodoApiModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TodoApiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TodoApiModelCopyWith<TodoApiModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoApiModelCopyWith<$Res> {
  factory $TodoApiModelCopyWith(
          TodoApiModel value, $Res Function(TodoApiModel) then) =
      _$TodoApiModelCopyWithImpl<$Res, TodoApiModel>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$TodoApiModelCopyWithImpl<$Res, $Val extends TodoApiModel>
    implements $TodoApiModelCopyWith<$Res> {
  _$TodoApiModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodoApiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateTodoApiModelImplCopyWith<$Res>
    implements $TodoApiModelCopyWith<$Res> {
  factory _$$CreateTodoApiModelImplCopyWith(_$CreateTodoApiModelImpl value,
          $Res Function(_$CreateTodoApiModelImpl) then) =
      __$$CreateTodoApiModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$CreateTodoApiModelImplCopyWithImpl<$Res>
    extends _$TodoApiModelCopyWithImpl<$Res, _$CreateTodoApiModelImpl>
    implements _$$CreateTodoApiModelImplCopyWith<$Res> {
  __$$CreateTodoApiModelImplCopyWithImpl(_$CreateTodoApiModelImpl _value,
      $Res Function(_$CreateTodoApiModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TodoApiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$CreateTodoApiModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateTodoApiModelImpl implements CreateTodoApiModel {
  const _$CreateTodoApiModelImpl({required this.name});

  factory _$CreateTodoApiModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateTodoApiModelImplFromJson(json);

  @override
  final String name;

  @override
  String toString() {
    return 'TodoApiModel.create(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateTodoApiModelImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  /// Create a copy of TodoApiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateTodoApiModelImplCopyWith<_$CreateTodoApiModelImpl> get copyWith =>
      __$$CreateTodoApiModelImplCopyWithImpl<_$CreateTodoApiModelImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) create,
  }) {
    return create(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name)? create,
  }) {
    return create?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? create,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateTodoApiModel value) create,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateTodoApiModel value)? create,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateTodoApiModel value)? create,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateTodoApiModelImplToJson(
      this,
    );
  }
}

abstract class CreateTodoApiModel implements TodoApiModel {
  const factory CreateTodoApiModel({required final String name}) =
      _$CreateTodoApiModelImpl;

  factory CreateTodoApiModel.fromJson(Map<String, dynamic> json) =
      _$CreateTodoApiModelImpl.fromJson;

  @override
  String get name;

  /// Create a copy of TodoApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateTodoApiModelImplCopyWith<_$CreateTodoApiModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
