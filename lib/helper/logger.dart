import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import 'package:intl/intl.dart';
import '../core/enum/environment.dart';
import '../locator.dart';
import '../services/shared/appconfig_service.dart';

configureLogger() {

  if (!kReleaseMode || locator<AppConfigService>().appEnvironment != AppEnvironment.PRODUCTION) {
    // Add standard log output only on debug builds
    Logger.addClient(DebugLoggerClient());
  } else {
    // Pass all uncaught errors from the framework to Crashlytics.
    //FlutterError.onError = Crashlytics.instance.recordFlutterError;
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    Logger.addClient(CrashlyticsLoggerClient());
  }
}

class Logger {
  static final _clients = <LoggerClient>[];
  /// Debug level logs
  static d(
      String message, {
        dynamic e,
        StackTrace? s,
      }) {
    _clients.forEach((c) => c.onLog(
      level: LogLevel.debug,
      message: message,
      e: e,
      s: s ?? StackTrace.current,
    ));
  }
  // Warning level logs
  static w(
      String message, {
        dynamic e,
         StackTrace? s,
      }) {
    _clients.forEach((c) => c.onLog(
      level: LogLevel.warning,
      message: message,
      e: e,
      s: s ?? StackTrace.current,
    ));
  }
  /// Error level logs
  /// Requires a current StackTrace to report correctly on Crashlytics
  /// Always reports as non-fatal to Crashlytics
  static e(
      String message, {
        dynamic e,
        StackTrace? s,
      }) {
    _clients.forEach((c) => c.onLog(
      level: LogLevel.error,
      message: message,
      e: e,
      s: s ?? StackTrace.current,
    ));
  }
  static addClient(LoggerClient client) {
    _clients.add(client);
  }
}
enum LogLevel { debug, warning, error }
abstract class LoggerClient {
  onLog({
    LogLevel level,
    String message,
    dynamic e,
    StackTrace s,
  });
}
/// Debug logger that just prints to console
class DebugLoggerClient implements LoggerClient {
  static final dateFormat = DateFormat("HH:mm a");
  String _timestamp() {
    return dateFormat.format(DateTime.now());
  }
  @override
  onLog({
    LogLevel? level,
    String? message,
    dynamic e,
    StackTrace? s,
  }) {

    String tag = "";

    switch (level!) {
      case LogLevel.debug:
        tag = "[DEBUG]";
        debugPrint("${_timestamp()} [DEBUG]  $message");

        if (e != null) {
          debugPrint(e.toString());
          debugPrint(s.toString() );
        }

        break;
      case LogLevel.warning:
        tag = "[WARNING]";

        debugPrint("${_timestamp()} [WARNING]  $message");
        if (e != null) {
          debugPrint(e.toString());
          debugPrint(s.toString());
        }
        break;
      case LogLevel.error:
        tag = "[ERROR]";

        debugPrint("${_timestamp()} [ERROR]  $message");
        if (e != null) {
          debugPrint(e.toString());
        }
        // Errors always show a StackTrace
        debugPrint(s.toString());
        break;
    }

    locator<LogService>().log(tag, message ?? '', _timestamp());

    if (level == LogLevel.error){
      locator<LogService>().log("", s.toString(), _timestamp());
    }

    if (e != null) {
      locator<LogService>().log("", e.toString(), _timestamp());
      locator<LogService>().log("", s.toString(), _timestamp());
    }
  }
}

/// Logger that reports to Crashlytics/Firebase
class CrashlyticsLoggerClient implements LoggerClient {
  @override
  onLog({
    LogLevel? level,
    String? message,
    dynamic e,
    StackTrace? s,
  }) {
    // final instance = Crashlytics.instance;
    final instance = FirebaseCrashlytics.instance;
    switch (level!) {
      case LogLevel.debug:
        break;
      case LogLevel.warning:
        instance.log("[WARNING] $message");
        if (e != null) {
          instance.log(e.toString());
          instance.log(s.toString());
        }
        break;
      case LogLevel.error:
        instance.log("[ERROR] $message");
        // Always report a non-fatal for errors
        if (e != null) {
          instance.recordError(e, s);
        } else {
          instance.recordError(Exception(message), s);
        }
        break;
    }
  }
}


class LogService {

  List<LogServiceParam> _logHistory = <LogServiceParam>[];

  List<LogServiceParam> get logHistory => _logHistory;

  log(String type, String message, String time){
    _logHistory.insert(0, LogServiceParam(type, message, time));
  }

  clear(){
    _logHistory.clear();
  }

}

class LogServiceParam {

  String type;
  String message;
  String time;
  bool expanded = false;

  Color get color {
    print(type);

    switch(type){
      case "[DEBUG]":
        return Colors.blue;
      case "[WARNING]":
        return Colors.yellow;
      case "[ERROR]":
        return Colors.red;
      default:
        return Colors.black;
    }

  }

  LogServiceParam(this.type, this.message, this.time);
}
