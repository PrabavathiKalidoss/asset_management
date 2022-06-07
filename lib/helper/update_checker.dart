import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/res/styles.dart';
import '../locator.dart';
import '../services/shared/appconfig_service.dart';
import 'logger.dart';

class UpdateChecker {
  versionCheck(BuildContext context) async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    final String currentVersion = info.version;

    final AppConfig? appConfig = locator<AppConfigService>().config;
    final AppStore? appStore = Platform.isIOS ? appConfig?.iosStore : appConfig?.androidStore;

    try {

      print(appStore?.version);
      print(currentVersion);

      if (int.parse(appStore!.version!.replaceAll(".", "")) > int.parse(currentVersion.replaceAll(".", "")) && appStore.forceUpdate!) {
        String message = appStore.updateMessage ?? '';
        // "There is a newer version of App available. Please update to continue using the app!";

        // locator<AnalyticsService>().logScreenName("update_dialog");
        // locator<AnalyticsService>()
        //     .logEvent("update_dialog", <String, dynamic>{'message': message});

        await showDialog<String>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                "Update Required",
                style: AppTextStyle.body2Bold,
              ),
              content:
              Text(message, style: AppTextStyle.label3Medium),
              actions: <Widget>[

                MaterialButton(
                  child: Text(
                    "Update Now",
                    style: AppTextStyle.label3Medium,
                  ),
                  onPressed: () async => await launch(appStore.url ?? ''),
                ),
              ],
            );
          },
        );
      }
    } catch (exception, stacktrace) {
      Logger.e("Unable to check for version info", e: exception, s: stacktrace);
    }
  }
}