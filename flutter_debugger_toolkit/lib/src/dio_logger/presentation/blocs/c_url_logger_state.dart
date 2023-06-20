part of 'c_url_logger_cubit.dart';

@freezed

///[CUrlLoggerState]
class CUrlLoggerState with _$CUrlLoggerState {
  ///[CUrlLoggerState]
  const factory CUrlLoggerState({
    required List<CurlLoggerItem> list,
  }) = _CUrlLoggerState;
  const CUrlLoggerState._();
}
