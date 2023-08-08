part of 'stories_cubit.dart';

@immutable
abstract class StoriesState {}

class StoriesInitial extends StoriesState {}

class StoriesLoaded extends StoriesState {
  final Stories stories;

  StoriesLoaded({required this.stories});
}
