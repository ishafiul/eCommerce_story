// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stories_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Stories _$StoriesFromJson(Map<String, dynamic> json) {
  return _Stories.fromJson(json);
}

/// @nodoc
mixin _$Stories {
  int get story_count => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoriesCopyWith<Stories> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoriesCopyWith<$Res> {
  factory $StoriesCopyWith(Stories value, $Res Function(Stories) then) =
      _$StoriesCopyWithImpl<$Res, Stories>;
  @useResult
  $Res call({int story_count, List<String> images});
}

/// @nodoc
class _$StoriesCopyWithImpl<$Res, $Val extends Stories>
    implements $StoriesCopyWith<$Res> {
  _$StoriesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? story_count = null,
    Object? images = null,
  }) {
    return _then(_value.copyWith(
      story_count: null == story_count
          ? _value.story_count
          : story_count // ignore: cast_nullable_to_non_nullable
              as int,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StoriesCopyWith<$Res> implements $StoriesCopyWith<$Res> {
  factory _$$_StoriesCopyWith(
          _$_Stories value, $Res Function(_$_Stories) then) =
      __$$_StoriesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int story_count, List<String> images});
}

/// @nodoc
class __$$_StoriesCopyWithImpl<$Res>
    extends _$StoriesCopyWithImpl<$Res, _$_Stories>
    implements _$$_StoriesCopyWith<$Res> {
  __$$_StoriesCopyWithImpl(_$_Stories _value, $Res Function(_$_Stories) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? story_count = null,
    Object? images = null,
  }) {
    return _then(_$_Stories(
      story_count: null == story_count
          ? _value.story_count
          : story_count // ignore: cast_nullable_to_non_nullable
              as int,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Stories implements _Stories {
  const _$_Stories(
      {required this.story_count, required final List<String> images})
      : _images = images;

  factory _$_Stories.fromJson(Map<String, dynamic> json) =>
      _$$_StoriesFromJson(json);

  @override
  final int story_count;
  final List<String> _images;
  @override
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'Stories(story_count: $story_count, images: $images)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Stories &&
            (identical(other.story_count, story_count) ||
                other.story_count == story_count) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, story_count, const DeepCollectionEquality().hash(_images));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StoriesCopyWith<_$_Stories> get copyWith =>
      __$$_StoriesCopyWithImpl<_$_Stories>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StoriesToJson(
      this,
    );
  }
}

abstract class _Stories implements Stories {
  const factory _Stories(
      {required final int story_count,
      required final List<String> images}) = _$_Stories;

  factory _Stories.fromJson(Map<String, dynamic> json) = _$_Stories.fromJson;

  @override
  int get story_count;
  @override
  List<String> get images;
  @override
  @JsonKey(ignore: true)
  _$$_StoriesCopyWith<_$_Stories> get copyWith =>
      throw _privateConstructorUsedError;
}
