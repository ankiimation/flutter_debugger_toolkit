import 'package:bloc/bloc.dart';
import 'package:flutter_debugger_toolkit/src/dio_logger/application/c_url_logger_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'c_url_logger_cubit.freezed.dart';
part 'c_url_logger_state.dart';

class CUrlLoggerCubit extends Cubit<CUrlLoggerState> {
  static final instance = CUrlLoggerCubit._();
  CUrlLoggerCubit._() : super(const CUrlLoggerState(list: [])) {
    DioCurlLoggerService.instance.stream.listen((event) {
      _onCurlLoggerItem(event);
    });
  }

  void _onCurlLoggerItem(CurlLoggerItem item) {
    var currentList = [
      item,
      ...state.list.where((element) => element.requestId != item.requestId)
    ];

    currentList.sort((a, b) => b.requestTime.compareTo(a.requestTime));
    emit(
      state.copyWith(
        list: [
          ...currentList,
        ],
      ),
    );
  }

  void clear() {
    emit(state.copyWith(
      list: [],
    ));
  }
}
