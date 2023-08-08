import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample_project/app/presentation/router.dart';
import 'package:sample_project/core/config/get_it.dart';
import 'package:sample_project/core/config/theme.dart';
import 'package:sample_project/core/snackbar/cubit/snack_bar_cubit.dart';
import 'package:logger/logger.dart';
import 'package:sample_project/features/home/domain/bloc/stories_cubit.dart';

Logger logger = Logger();

class App extends StatefulWidget {
  const App({
    super.key,
  });

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late Dio _dio;

  @override
  void initState() {
    _dio = _createDioInstance();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (BuildContext context, _) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<SnackBarCubit>(
              create: (BuildContext context) => SnackBarCubit(),
            ),
            BlocProvider<StoriesCubit>(
              create: (BuildContext context) => StoriesCubit(),
            ),
          ],
          child: MaterialApp.router(
            theme: getIt<AppTheme>().lightTheme,
            routerDelegate: router.routerDelegate,
            routeInformationParser: router.routeInformationParser,
            routeInformationProvider: router.routeInformationProvider,
          ),
        );
      },
    );
  }
}

// ignore: library_private_types_in_public_api
extension ApplicationApiInterceptors on _AppState {
  Dio _createDioInstance() {
    final Dio dio = Dio();
    dio.interceptors.clear();
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          logger.d(options.baseUrl);
          return handler.next(options);
        },
        onResponse: (Response<dynamic> response, ResponseInterceptorHandler handler) {
          logger.d(response.toString());
          return handler.next(response);
        },
        onError: (DioException error, ErrorInterceptorHandler handler) {
          logger.e(error.toString());
          return handler.next(error);
        },
      ),
    );
    return dio;
  }
}
