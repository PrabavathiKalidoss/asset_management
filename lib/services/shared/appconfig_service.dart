import 'dart:convert';
import 'package:flutter/material.dart';

import '../../core/enum/environment.dart';

class AppConfigService {
  AppConfig? _appConfig;
  AppEnvironment? _appEnvironment;
  String? _packageName;

  AppEnvironment? get appEnvironment => _appEnvironment;

  String get envString {
    if (_packageName?.endsWith(".dev") == true) {
      return "DEVELOP";
    } else if (_packageName?.endsWith(".uat") == true) {
      return "UAT";
    } else {
      return "PROD";
    }
  }

  Color get color {
    if (_packageName?.endsWith(".dev") == true) {
      return Colors.red;
    } else if (_packageName?.endsWith(".uat") == true) {
      return Colors.orange;
    } else {
      return Colors.green;
    }
  }

  AppConfig? get config {
    return _appConfig;
  }

  setConfig(String value, AppEnvironment appEnvironment, String packageName) {
    _packageName = packageName;
    _appConfig = AppConfig.fromJson(jsonDecode(value));
    _appEnvironment = appEnvironment;
  }
}

class AppConfig {
  String? appName;
  String? baseApiUrl;
  String? googleAPIKey;
  String? openApiUrl;
  AppLinks? appLinks;
  AppStore? androidStore;
  AppStore? iosStore;
  String? oneSignalID;


  AppConfig(
      {this.appName,
        this.baseApiUrl,
        this.googleAPIKey,
        this.iosStore,
        this.androidStore,
        this.appLinks});

  AppConfig.fromJson(Map<String, dynamic> json) {
    appName = json['AppName'];
    baseApiUrl = json['BaseApiUrl'];
    googleAPIKey = json['GoogleAPIKey'];
    openApiUrl = json['openApiUrl'];
    androidStore = json['AndroidStore'] != null
        ? new AppStore.fromJson(json['AndroidStore'])
        : null;
    iosStore = json['IosStore'] != null
        ? new AppStore.fromJson(json['IosStore'])
        : null;
    appLinks = json['AppLinks'] != null
        ? new AppLinks.fromJson(json['AppLinks'])
        : null;
    oneSignalID = json['OneSignalID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AppName'] = this.appName;
    data['BaseApiUrl'] = this.baseApiUrl;
    data['openApiUrl'] = this.openApiUrl;
    data['GoogleAPIKey'] = this.googleAPIKey;
    data['OneSignalID'] = this.oneSignalID;
    if (this.androidStore != null) {
      data['AndroidStore'] = this.androidStore?.toJson();
    }
    if (this.iosStore != null) {
      data['IosStore'] = this.iosStore?.toJson();
    }
    if (this.appLinks != null) {
      data['AppLinks'] = this.appLinks?.toJson();
    }
    return data;
  }
}

class AppStore {
  String? url;
  String? appID;
  String? version;
  String? reviewUrl;
  String? updateMessage;
  bool? forceUpdate;
  String? IcloudContainerId;

  AppStore(
      {this.url, this.appID, this.version, this.reviewUrl, this.forceUpdate,this.IcloudContainerId});

  AppStore.fromJson(Map<String, dynamic> json) {
    url = json['Url'];
    appID = json['AppID'];
    IcloudContainerId = json['IcloudContainerId'];
    version = json['Version'];
    reviewUrl = json['ReviewUrl'];
    updateMessage = json['UpdateMessage'];
    forceUpdate = json['ForceUpdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Url'] = this.url;
    data['AppID'] = this.appID;
    data['IcloudContainerId'] = this.IcloudContainerId;
    data['Version'] = this.version;
    data['ReviewUrl'] = this.reviewUrl;
    data['UpdateMessage'] = this.updateMessage;
    data['ForceUpdate'] = this.forceUpdate;
    return data;
  }
}


class AppLinks {
  String? supportEmail;
  String? supportUrl;
  String? privacy;
  String? userAgreement;
  String? contactPhone;

  AppLinks(
      {this.supportEmail,
        this.supportUrl,
        this.privacy,
        this.userAgreement,
        this.contactPhone});

  AppLinks.fromJson(Map<String, dynamic> json) {
    supportEmail = json['SupportEmail'];
    supportUrl = json['SupportUrl'];
    privacy = json['Privacy'];
    userAgreement = json['UserAgreement'];
    contactPhone = json['ContactPhone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SupportEmail'] = this.supportEmail;
    data['SupportUrl'] = this.supportUrl;
    data['Privacy'] = this.privacy;
    data['UserAgreement'] = this.userAgreement;
    data['ContactPhone'] = this.contactPhone;
    return data;
  }
}
