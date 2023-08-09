part of 'story_cubit.dart';

@immutable
abstract class StoryState {}

class StoryInitial extends StoryState {}

class StoryLoaded extends StoryState {
  final String image;
  final int total;

  StoryLoaded({required this.image, required this.total});
}
