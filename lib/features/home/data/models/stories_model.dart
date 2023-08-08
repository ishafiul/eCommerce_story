import 'package:freezed_annotation/freezed_annotation.dart';

part 'stories_model.freezed.dart';

part 'stories_model.g.dart';

@Freezed()
class Stories with _$Stories {
  const factory Stories({
    required int story_count,
    required List<String> images,
  }) = _Stories;

  factory Stories.fromJson(Map<String, Object?> json) => _$StoriesFromJson(json);
}