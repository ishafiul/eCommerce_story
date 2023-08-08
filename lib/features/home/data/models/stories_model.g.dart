// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Stories _$$_StoriesFromJson(Map<String, dynamic> json) => _$_Stories(
      story_count: json['story_count'] as int,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_StoriesToJson(_$_Stories instance) =>
    <String, dynamic>{
      'story_count': instance.story_count,
      'images': instance.images,
    };
