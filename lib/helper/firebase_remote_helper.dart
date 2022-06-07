
import 'package:connectivity/connectivity.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:package_info/package_info.dart';
import '../core/enum/environment.dart';
import '../core/res/colors.dart';
import '../locator.dart';
import '../services/shared/appconfig_service.dart';
import 'logger.dart';

class FirebaseRemoteHelper {

  final AppConfigService appConfigService = locator<AppConfigService>();

  Future<void> configure() async {
    RemoteConfig remoteConfig = RemoteConfig.instance;
    try {
      await remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 60),
        minimumFetchInterval: Duration.zero,
      ));
      await remoteConfig.fetchAndActivate();

      String configKey;
      AppEnvironment appEnvironment;

      PackageInfo packageInfo = await PackageInfo.fromPlatform();

      if (packageInfo.packageName.contains("dev")){
        appEnvironment = AppEnvironment.DEV;
        configKey = "dev_config";
      } else if (packageInfo.packageName.contains("uat")){
        appEnvironment = AppEnvironment.STAGING;
        configKey = "uat_config";
      } else {
        appEnvironment = AppEnvironment.PRODUCTION;
        configKey = "config";
      }

      debugPrint(configKey);

      appConfigService.setConfig(remoteConfig.getString(configKey), appEnvironment, packageInfo.packageName);
      Logger.d('Init RemoteConfig: SUCCESS');
      Logger.d(appConfigService.config!.toJson().toString());

    } catch (e) {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none){
         Fluttertoast.showToast(
             msg: "No Network Connection. Please Enable Internet and Try Again.",
             toastLength: Toast.LENGTH_LONG,
             backgroundColor: AppColor.textOnBackground.withOpacity(0.8),
             textColor: AppColor.background
         );
      }
      debugPrint("exe ${e}");
      throw e;
    }
  }

}
