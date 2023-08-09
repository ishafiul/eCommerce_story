import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:starter_kit_flutter/features/story/domain/bloc/story_cubit.dart';

class StoryScreen extends HookWidget {
  final String? initId;

  const StoryScreen({super.key, required this.initId});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<double> watchPercent = useState(0);
    final ValueNotifier<bool> isHold = useState(false);
    final ValueNotifier<int> totalImages = useState(1);
    final ValueNotifier<int> index = useState(int.parse(initId!));
    Timer timer = Timer(Duration.zero, () {});
    void watcher() {
      timer = Timer.periodic(const Duration(milliseconds: 80), (timer) {
        if (!isHold.value) {
          if (watchPercent.value + 0.01 < 1) {
            watchPercent.value += 0.01;
          } else {
            if (totalImages.value != 1 && (totalImages.value - 1 == index.value)) {
              context.pop();
            } else {
              index.value++;
              context.read<StoryCubit>().getStory(context, index.value);
              watchPercent.value = 0;
            }
          }
        }
      });
    }

    useEffect(
      () {
        context.read<StoryCubit>().getStory(context, index.value);
        watcher();
        return () {
          timer.cancel();
        };
      },
      [],
    );

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          LinearPercentIndicator(
            percent: watchPercent.value,
            progressColor: Colors.black54,
            barRadius: const Radius.circular(10),
            backgroundColor: Colors.black26,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(
                  Icons.close,
                  color: Colors.grey,
                  size: 31,
                ),
              )
            ],
          ),
          Expanded(
            child: GestureDetector(
              onLongPress: () {
                isHold.value = true;
              },
              onLongPressUp: () {
                isHold.value = false;
              },
              onTapDown: (details) async {
                await Future<void>.delayed(const Duration(milliseconds: 400));
                final screenWidgth = MediaQuery.sizeOf(context).width;
                final dx = details.globalPosition.dx;
                if (!isHold.value) {
                  if (dx < screenWidgth / 2) {
                    /// prev
                    index.value--;
                    if (index.value < 0) {
                      context.pop();
                    } else {
                      context.read<StoryCubit>().getStory(context, index.value);
                      watchPercent.value = 0;
                      isHold.value = false;
                    }
                  } else {
                    /// next
                    index.value++;
                    if (index.value >= totalImages.value) {
                      context.pop();
                    } else {
                      context.read<StoryCubit>().getStory(context, index.value);
                      watchPercent.value = 0;
                      isHold.value = false;
                    }
                  }
                }
              },
              child: ColoredBox(
                color: Colors.white,
                child: BlocConsumer<StoryCubit, StoryState>(
                  listener: (context, state) {
                    if (state is StoryLoaded) {
                      totalImages.value = state.total;
                    }
                  },
                  builder: (context, state) {
                    if (state is StoryLoaded) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Image.network(state.image),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
