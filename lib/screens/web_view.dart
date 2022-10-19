import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tech_news_2/utils/app_colors.dart';
import 'package:tech_news_2/utils/app_extras.dart';
import 'package:tech_news_2/widgets/custom_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RssWebViewPage extends StatefulWidget {
  final String url;
  const RssWebViewPage({super.key, required this.url});

  @override
  State<RssWebViewPage> createState() => _RssWebViewPageState();
}

class _RssWebViewPageState extends State<RssWebViewPage> {
  @override
  void initState() {
    super.initState();
    WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        color: Colors.transparent,
        elevation: 0,
        leading: Container(
          color: AppColors.whiteColor,
          padding: const EdgeInsets.all(12),
          child: IconButton(
            onPressed: () => AppExtras.pop(context),
            icon: FaIcon(
              FontAwesomeIcons.arrowLeft,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 42),
        child: WebView(initialUrl: widget.url),
      ),
    );
  }
}
