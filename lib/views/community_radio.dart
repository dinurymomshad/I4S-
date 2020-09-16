import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CommunityRadio extends StatefulWidget {
  @override
  _CommunityRadioState createState() => _CommunityRadioState();
}

class _CommunityRadioState extends State<CommunityRadio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl:
        "https://www.gov.za/about-government/contact-directory/community-radio",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
