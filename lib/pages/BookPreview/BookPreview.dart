import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BookPreview extends StatefulWidget {
  const BookPreview({super.key});

  @override
  State<BookPreview> createState() => _BookPreviewState();
}

class _BookPreviewState extends State<BookPreview> {
  late WebViewController webController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final String url = (ModalRoute.of(context)!.settings.arguments
            as Map<String, String>)["url"]
        .toString();

    webController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..loadRequest(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: WebViewWidget(controller: webController),
    );
  }
}
