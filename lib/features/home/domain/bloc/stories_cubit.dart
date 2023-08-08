import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:starter_kit_flutter/features/home/data/models/stories_model.dart';
import 'package:starter_kit_flutter/features/home/data/repository/stories_repository.dart';

part 'stories_state.dart';

class StoriesCubit extends Cubit<StoriesState> {
  StoriesCubit() : super(StoriesInitial());

  Future<void> getStories() async {
    emit(StoriesInitial());
    final storiesRepository = StoriesRepository();
    final stories = await storiesRepository.getAllStories();
    emit(StoriesLoaded(stories: stories));
  }
}
