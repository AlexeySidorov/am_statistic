import 'package:flutter/material.dart';
import 'package:statistic_covid19/infrastructure/Utils/ColorsApp.dart';
import 'package:statistic_covid19/infrastructure/base/BaseView.dart';
import 'package:statistic_covid19/viewModels/StatisticViewModel.dart';
import 'package:webview_flutter/webview_flutter.dart';

class StatisticView extends BaseView<StatisticViewModel> {
  StatisticView(StatisticViewModel model) : super(model);

  @override
  State<StatefulWidget> createState() {
    return _StatisticViewState();
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

class _StatisticViewState extends State<StatisticView> {
  _StatisticViewState();
  bool visibleProgressBar = false;
  WebViewController _webViewController;
  String _url;

  String getUrl(String url) {
    if (url.isNotEmpty && _url == null) {
      _url = url;
      _webViewController?.loadUrl(url);
    }

    return url;
  }

  @override
  Widget build(BuildContext context) {
    widget.$Model.registryProperties(context);
    widget.$Model.init();

    var _ = Stack(children: [
      widget.$.watchFor<AsyncSnapshot<String>>(#url,
          builder: widget.$.builder1((url) => WebView(
                initialUrl: getUrl(url.data),
                javascriptMode: JavascriptMode.unrestricted,
                onPageStarted: (String url) {
                  setState(() {
                    visibleProgressBar = true;
                  });
                },
                onPageFinished: (String url) {
                  setState(() {
                    visibleProgressBar = false;
                  });
                },
                onWebResourceError: (error) => {
                  setState(() {
                    visibleProgressBar = false;
                  })
                },
                gestureNavigationEnabled: true,
                onWebViewCreated: (controller) =>
                    {_webViewController = controller},
              ))),
      Visibility(
        visible: visibleProgressBar,
        child: Center(
            child: CircularProgressIndicator(
                valueColor:
                    new AlwaysStoppedAnimation<Color>(ColorsApp.primaryColor))),
      )
    ]);

    widget.$Model.active();

    return _;
  }
}
