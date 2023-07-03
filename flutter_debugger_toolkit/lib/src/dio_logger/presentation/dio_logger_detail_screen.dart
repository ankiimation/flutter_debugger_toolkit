part of 'dio_logger_screen.dart';

@Export()
class DioCURLLoggerDetailScreen extends StatefulWidget {
  final CurlLoggerItem item;
  const DioCURLLoggerDetailScreen({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  State<DioCURLLoggerDetailScreen> createState() =>
      _DioCURLLoggerDetailScreenState();
}

class _DioCURLLoggerDetailScreenState extends State<DioCURLLoggerDetailScreen> {
  void copyCurl(CurlLoggerItem item) {
    copy(item.curl);
  }

  void copy(String value) {
    Clipboard.setData(ClipboardData(text: value));
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'copied',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<CUrlLoggerCubit, CUrlLoggerState>(
      bloc: CUrlLoggerCubit.instance,
      builder: (context, state) {
        final item = state.list.firstWhere(
          (element) => element.requestId == widget.item.requestId,
          orElse: () => widget.item,
        );
        return Scaffold(
          appBar: AppBar(
            backgroundColor: item.isError ? Colors.red : Colors.green,
            title: Text(
              item.request.path,
            ),
            actions: [
              IconButton(
                onPressed: () {
                  copyCurl(item);
                },
                icon: const Icon(
                  Icons.copy,
                ),
              ),
            ],
          ),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Row(
                children: [
                  Container(
                    width: 60,
                    height: 30,
                    padding: const EdgeInsets.all(4),
                    margin: const EdgeInsets.all(4),
                    color:
                        item.requestMethod.requestMethodColor.withOpacity(0.2),
                    child: Center(
                      child: Text(
                        item.requestMethod,
                        style: TextStyle(
                          color: item.requestMethod.requestMethodColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Text(
                      item.request.path,
                    ),
                  ),
                ],
              ),
              if (item.displayRequestBody.isNotEmpty) ...[
                const Divider(),
                const Text(
                  'REQUEST DATA:',
                ),
                _buildResponse(
                  content: item.displayRequestBody,
                ),
              ],
              ...[
                const Divider(),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                            'RESPONSE (${item.response?.statusCode ?? '?'})')),
                    const SizedBox(
                      width: 8,
                    ),
                    CountUpTimer(
                      begin: item.requestTime,
                      end: item.responseTime,
                      builder: (duration) {
                        return Text(
                          '${(duration.inMilliseconds / 1000).toStringAsFixed(1)}(s)',
                          style: TextStyle(
                            fontSize: 12,
                            color: (duration >= CurlLoggerItem.trashDuration
                                    ? Colors.red
                                    : duration >= CurlLoggerItem.warningDuration
                                        ? Colors.orange
                                        : theme.colorScheme.onBackground)
                                .withOpacity(
                                    item.responseTime == null ? 0.2 : 1),
                          ),
                        );
                      },
                    )
                  ],
                ),
                if (item.requesting)
                  const Center(
                    child: CupertinoActivityIndicator(),
                  )
                else
                  _buildResponse(
                    content: item.responseBeauty,
                    // htmlContent: item.responseBeautyHTML,
                  ),
              ],
              ...[
                const Divider(
                  height: 32,
                ),
                const Text('CURL'),
                Stack(
                  children: [
                    _buildResponse(
                      content: item.curl,
                    ),
                    IgnorePointer(
                      child: Opacity(
                        opacity: 0.5,
                        child: Image.network(
                          'https://static.wixstatic.com/media/5922a2_856c3188261243d5a5bfce02aad36bca~mv2.gif',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  Widget _buildResponse({
    required String content,
  }) {
    return InkWell(
      onTap: () {
        copy(content);
      },
      child: Container(
        color: Colors.grey[200],
        padding: const EdgeInsets.all(16),
        child: Text(
          content,
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
