
import 'dart:async';

import 'package:connectivity/connectivity.dart';

import '../views/vgts_base_view_model.dart';

class NoNetworkViewModel extends VGTSBaseViewModel{

  late StreamSubscription<ConnectivityResult> subscription;

  init(){}

}