import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PortalTransparenciaScreen extends StatefulWidget {
  const PortalTransparenciaScreen({super.key});

  @override
  State<PortalTransparenciaScreen> createState() =>
      _PortalTransparenciaScreenState();
}

class _PortalTransparenciaScreenState extends State<PortalTransparenciaScreen> {
  final WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(NavigationDelegate(
      onProgress: (int progress) {},
      onPageStarted: (url) {},
      onPageFinished: (url) {},
      onWebResourceError: (error) {},
      onNavigationRequest: (NavigationRequest request) {
        return NavigationDecision.navigate;
      },
    ))
    ..loadRequest(Uri.parse(
        'http://portaldatransparencia.semas.pa.gov.br/#/visao-publica'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Stack(
          children: [
            WebViewWidget(
              controller: controller,
            ),
            Positioned(
              top: 8,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.grey,
                  size: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
