// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_project/app/app.dart';
import 'package:sample_project/core/config/get_it.dart';

bool get kShouldShowQaControls => _kShouldShowQaControls;
bool _kShouldShowQaControls = false;

class AppBlocObserver extends BlocObserver {
  // @override
  // void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
  //   super.onChange(bloc, change);
  //   logger.i('onChange(${bloc.runtimeType}, $change)');
  // }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    if (error is StateError &&
        error.message == 'Cannot emit new states after calling close') {
      logger.e('onError(${bloc.runtimeType}, $error, $stackTrace)');
    } else {
      super.onError(bloc, error, stackTrace);
    }
  }
}

Future<void> bootstrap() async {
  Bloc.observer = AppBlocObserver();

  //* GoogleFonts License Registry
  LicenseRegistry.addLicense(() async* {
    final String license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(<String>['google_fonts'], license);
  });

  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await SystemChrome.setPreferredOrientations(const <DeviceOrientation>[
        DeviceOrientation.portraitUp,
      ]);

      FlutterError.onError = (FlutterErrorDetails details) {
        logger.e(details.exceptionAsString(), stackTrace: details.stack);
      };

      /// init get_it dependencies
      initDependencies();
      runApp(const App());
    },
    (Object error, StackTrace stackTrace) {
      log(error.toString(), stackTrace: stackTrace);

      if (error is FlutterError) {
        if (error.message.toLowerCase().contains('renderflex')) {
          logger.e('$error, $stackTrace');
        } else if (error.message
            .toLowerCase()
            .contains('cannot emit new states')) {
          logger.e('$error, $stackTrace');
        } else {
          logger.e('$error, $stackTrace');
        }
      } else {
        logger.e('$error, $stackTrace');
      }
    },
  );
}
