import 'package:package_info/package_info.dart';

class EnvironmentService {

  String? _environment;


  String? get environment => _environment;


  init() async {

    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    if (packageInfo.packageName.endsWith(".dev")){
      this._environment = "DEV";
    } else if (packageInfo.packageName.endsWith(".stag")){
      this._environment = "STAGING";
    } else {
     this._environment = "PRODUCTION";
    }

  }


}