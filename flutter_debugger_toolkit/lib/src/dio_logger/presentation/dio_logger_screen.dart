import 'package:dart_exporter_annotation/dart_exporter_annotation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_debugger_toolkit/src/dio_logger/application/c_url_logger_service.dart';
import 'package:flutter_debugger_toolkit/src/dio_logger/presentation/blocs/c_url_logger_cubit.dart';

part 'dio_logger_detail_screen.dart';

@Export()
class DioCURLLoggerScreen extends StatefulWidget {
  final GlobalKey<NavigatorState>? navigatorKey;
  final Function(CurlLoggerItem)? onSelectItem;
  const DioCURLLoggerScreen({
    Key? key,
    this.navigatorKey,
    this.onSelectItem,
  }) : super(key: key);

  @override
  State<DioCURLLoggerScreen> createState() => _DioCURLLoggerScreenState();
}

class _DioCURLLoggerScreenState extends State<DioCURLLoggerScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return HeroControllerScope(
      controller: MaterialApp.createMaterialHeroController(),
      child: Navigator(
        key: widget.navigatorKey,
        onGenerateInitialRoutes: (_, __) => [
          MaterialPageRoute(
            builder: (context) => BlocBuilder<CUrlLoggerCubit, CUrlLoggerState>(
              bloc: CUrlLoggerCubit.instance,
              builder: (context, state) {
                return Scaffold(
                  appBar: AppBar(
                    title: const Text(
                      'REST API Debugger 💀',
                    ),
                    actions: [
                      IconButton(
                        onPressed: () async {
                          CUrlLoggerCubit.instance.clear();
                        },
                        icon: const Icon(
                          Icons.clear_all,
                        ),
                      ),
                    ],
                  ),
                  body: ListView.separated(
                    itemCount: state.list.length,
                    separatorBuilder: (_, __) => const Divider(
                      height: 0,
                    ),
                    itemBuilder: (context, index) {
                      final item = state.list[index];
                      final statusCode = item.response?.statusCode;
                      return ListTile(
                        onTap: () {
                          if (widget.onSelectItem != null) {
                            widget.onSelectItem?.call(item);
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DioCURLLoggerDetailScreen(item: item)));
                          }
                        },
                        tileColor:
                            item.isError ? Colors.red.withOpacity(0.1) : null,
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 60,
                              height: 30,
                              padding: const EdgeInsets.all(4),
                              margin: const EdgeInsets.all(4),
                              color: item.requestMethod.requestMethodColor
                                  .withOpacity(0.2),
                              child: Center(
                                child: Text(
                                  item.requestMethod,
                                  style: TextStyle(
                                    color:
                                        item.requestMethod.requestMethodColor,
                                  ),
                                ),
                              ),
                            ),
                            if (item.duration != null)
                              Expanded(
                                child: Text(
                                  '${(item.duration!.inMilliseconds / 1000).toStringAsFixed(1)}(s)',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: item.duration! >=
                                            CurlLoggerItem.trashDuration
                                        ? Colors.red
                                        : item.duration! >=
                                                CurlLoggerItem.warningDuration
                                            ? Colors.orange
                                            : null,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        trailing: item.requesting
                            ? const CupertinoActivityIndicator()
                            : item.isError
                                ? const Icon(
                                    Icons.error,
                                    color: Colors.red,
                                  )
                                : const Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  ),
                        title: Text(
                          item.request.path,
                        ),
                        subtitle: item.isError && statusCode != null
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Code: $statusCode',
                                    style: theme.textTheme.bodySmall,
                                  ),
                                  Text(
                                    '${item.response}',
                                    maxLines: 6,
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.textTheme.bodySmall,
                                  )
                                ],
                              )
                            : null,
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

extension _DebugStringExtension on String {
  Color get requestMethodColor {
    switch (this) {
      case 'POST':
        return Colors.green;
      case 'GET':
        return Colors.blue;
      case 'PUT':
        return Colors.orange;
      case 'DELETE':
        return Colors.red;
      default:
        return Colors.black;
    }
  }
}
