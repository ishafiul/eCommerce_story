import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:starter_kit_flutter/features/home/domain/bloc/stories_cubit.dart';

part 'story_state.dart';

class StoryCubit extends Cubit<StoryState> {
  StoryCubit() : super(StoryInitial());

  void getStory(BuildContext context, int index) async {
    emit(StoryInitial());
    await Future<void>.delayed(const Duration(milliseconds: 40));

    final storiesCubit = context.read<StoriesCubit>();
    if (storiesCubit.state is StoriesLoaded) {
      final stories = (storiesCubit.state as StoriesLoaded).stories;
      emit(StoryLoaded(total: stories.images.length, image: stories.images[index]));
    } else {

    }
  }
}
