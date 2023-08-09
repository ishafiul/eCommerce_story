import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:starter_kit_flutter/core/snackbar/cubit/snack_bar_cubit.dart';
import 'package:starter_kit_flutter/features/home/domain/bloc/stories_cubit.dart';
import 'package:starter_kit_flutter/features/story/domain/bloc/story_cubit.dart';

@Singleton()
class Provider {
  List<BlocProvider> providers = [
    BlocProvider<SnackBarCubit>(
      create: (BuildContext context) => SnackBarCubit(),
    ),
    BlocProvider<StoriesCubit>(
      create: (BuildContext context) => StoriesCubit(),
    ),
    BlocProvider<StoryCubit>(
      create: (BuildContext context) => StoryCubit(),
    ),
  ];
}
