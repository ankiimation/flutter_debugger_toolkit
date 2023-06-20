library flutter_debugger_toolkit;

import 'package:flutter_debugger_toolkit/src/dio_logger/presentation/blocs/c_url_logger_cubit.dart';

export 'src/exports.dart_exporter.dart';

class FlutterDebuggerToolkit {
  FlutterDebuggerToolkit._();
  static final instance = FlutterDebuggerToolkit._();
  void initialize() {
    CUrlLoggerCubit.instance;
  }
}
