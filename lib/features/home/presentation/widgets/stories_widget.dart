import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_img/flutter_img.dart';
import 'package:go_router/go_router.dart';
import 'package:starter_kit_flutter/core/widgets/horizontal_list.dart';
import 'package:starter_kit_flutter/features/home/domain/bloc/stories_cubit.dart';

class StoriesWidget extends HookWidget {
  const StoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      final storiesCubit = context.read<StoriesCubit>();
      storiesCubit.getStories();
      return null;
    }, []);
    return BlocBuilder<StoriesCubit, StoriesState>(
      builder: (context, state) {
        if (state is StoriesLoaded) {
          return HorizontalList(
            itemCount: state.stories.story_count,
            spacing: 0,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  context.go('/home/story/$index');
                },
                child: SizedBox(
                  height: 151.18,
                  width: 94.73,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Img(
                      state.stories.images[index],
                      height: 151.18,
                      width: 94.73,
                    ),
                  ),
                ),
              );
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
