import 'package:crypto_app/Colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CoinsScreen extends StatefulWidget {
  const CoinsScreen({Key? key}) : super(key: key);

  @override
  State<CoinsScreen> createState() => _CoinsScreenState();
}

class _CoinsScreenState extends State<CoinsScreen> {
  //var loadingPercentage = 0;
  late WebViewController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: 'https://www.investing.com/crypto/',
        onWebViewCreated: (controller) {
          this.controller = controller;
          controller.runJavascriptReturningResult("document.getElementsByTagName('header')[0].style.display='none'");
        },
        onPageStarted: (url){
          controller.evaluateJavascript(
              "document.getElementsByTagName('header')[0].style.display='none'"
          );
          controller.evaluateJavascript("document.getElementsByTagName('footer')[0].style.display='none'");
        },
        onProgress: (url){
          controller.evaluateJavascript(
              "document.getElementsByTagName('header')[0].style.display='none'"
          );
          controller.evaluateJavascript("document.getElementsByTagName('footer')[0].style.display='none'");
        },
        onPageFinished: (url) {
          controller.evaluateJavascript(
              "document.getElementsByTagName('header')[0].style.display='none'"
          );
          controller.evaluateJavascript("document.getElementsByTagName('footer')[0].style.display='none'");
        },
      ),
    );
  }
}

// Stack(
// children: [
// WebView(
// initialUrl: 'https://www.coingecko.com/',
// onPageStarted: (url) {
// setState(() {
// loadingPercentage = 0;
// });
// },
// onProgress: (progress) {
// setState(() {
// loadingPercentage = progress;
// });
// },
// onPageFinished: (url) {
// setState(() {
// loadingPercentage = 100;
// });
// },
// ),
// if (loadingPercentage < 100)
// LinearProgressIndicator(
// value: loadingPercentage / 100.0,
// color: Colors.purple,
// ),
// ],
// );