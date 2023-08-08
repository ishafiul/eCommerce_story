
import 'package:get_it/get_it.dart';
import 'package:sample_project/core/config/get_it.config.dart';
import 'package:injectable/injectable.dart';
final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void initDependencies() => $initGetIt(getIt);