import 'dart:async';
import 'dart:io';
import 'package:asset_management/router.dart';
import 'package:asset_management/services/shared/appconfig_service.dart';
import 'package:asset_management/services/shared/dialog_service.dart';
import 'package:asset_management/services/shared/environment_service.dart';
import 'package:asset_management/services/shared/navigator_service.dart';
import 'package:asset_management/services/shared/network_service.dart';
import 'package:asset_management/services/shared/preference_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
 import 'core/res/styles.dart';
import 'helper/dialog_manager.dart';
import 'helper/firebase_remote_helper.dart';
import 'helper/logger.dart';
import 'helper/update_checker.dart';
import 'locator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<Null> main() async {

  setupLocator();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await configureLogger();
  await locator<EnvironmentService>().init();

  FlutterError.onError = (FlutterErrorDetails details) {
    Logger.e(details.toString(), s: StackTrace.current);
  };

  runZoned<Future<void>>(() async {
    // await SentryFlutter.init(
    //       (options) {
    //     options.dsn = 'https://3c5fabfe40314924815160d0e73df20c@o1234501.ingest.sentry.io/6383871';
    //     options.tracesSampleRate = 1.0;
    //   },
      // appRunner: () => runApp(MyApp()),
    // );
    runApp(MyApp());
  }, onError: (Object obj, StackTrace stack) {
    Logger.e("Zoned Error", e: obj, s: stack);
  });
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final navigationService = locator<NavigationService>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }



  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            Platform.isIOS ? Brightness.light : Brightness.dark));

    return MultiProvider(
      providers: [
        Provider<AppConfig?>(create: (context) => locator<AppConfigService>().config),
      ],
      child: ScreenUtilInit(
        designSize: Size(360, 640),
        builder:(BuildContext context,_)=> MaterialApp(
          title: "",
          theme: AppStyle.appTheme,
          builder: _setupDialogManager,
          initialRoute:  '/',
          debugShowCheckedModeBanner: false,
          navigatorKey: navigationService.navigatorKey,
          onGenerateRoute: (settings) => AppRouter.generateRoute(settings),
          // navigatorObservers: [FirebaseAnalyticsObserver(analytics: analytics)],
        ),
      ),
    );
  }

  Widget _setupDialogManager(context, widget) {
    return Navigator(
      key: locator<DialogService>().dialogNavigationKey,
      onGenerateRoute: (settings) => MaterialPageRoute(builder: (context) {
        final MediaQueryData data = MediaQuery.of(context);
        return DialogManager(
          child: MediaQuery(
            data: data.copyWith(textScaleFactor: 1.0),
            child: widget,
          ),
        );
      }),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
