import 'package:flutter/material.dart';
import 'package:statistic_covid19/viewModels/ReportViewModel.dart';
import 'package:statistic_covid19/infrastructure/base/BaseView.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ReportView extends BaseView<ReportViewModel> {
  ReportView(ReportViewModel model) : super(model);

  @override
  State<StatefulWidget> createState() {
    return _ReportViewState();
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

class _ReportViewState extends State<ReportView> {
  _ReportViewState();

  @override
  Widget build(BuildContext context) {
    return WebView(
        initialUrl: 'https://www.cdc.gov/covid-data-tracker/#cases',
        javascriptMode: JavascriptMode.unrestricted);
  }
}
