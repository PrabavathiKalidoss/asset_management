import 'package:asset_management/services/shared/appconfig_service.dart';
import 'package:asset_management/services/shared/dialog_service.dart';
import 'package:asset_management/services/shared/environment_service.dart';
import 'package:asset_management/services/shared/navigator_service.dart';
import 'package:asset_management/services/shared/network_service.dart';
import 'package:asset_management/services/shared/preference_service.dart';
import 'helper/firebase_remote_helper.dart';
import 'helper/logger.dart';
import 'helper/update_checker.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

PreferenceService get preferenceService => locator<PreferenceService>();
NavigationService get navigationService => locator<NavigationService>();
AppConfigService get appConfigService => locator<AppConfigService>();
DialogService get dialogService => locator<DialogService>();

void setupLocator() {

  locator.registerLazySingleton(() => FirebaseRemoteHelper());
  locator.registerLazySingleton(() => AppConfigService());
  locator.registerLazySingleton(() => LogService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => PreferenceService());
  locator.registerLazySingleton(() => NetworkService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => UpdateChecker());
  locator.registerLazySingleton(() => EnvironmentService());

}