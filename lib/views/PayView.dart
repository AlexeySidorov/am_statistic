import 'package:flutter/material.dart';
import 'package:statistic_covid19/generated/i18n.dart';
import 'package:statistic_covid19/infrastructure/Styles/TextStyle.dart';
import 'package:statistic_covid19/infrastructure/Utils/ColorsApp.dart';
import 'package:statistic_covid19/infrastructure/base/BaseView.dart';
import 'package:statistic_covid19/viewModels/PayViewModel.dart';

class PayView extends BaseView<PayViewModel> {
  PayView(PayViewModel model) : super(model);

  @override
  State<StatefulWidget> createState() {
    return _PayViewState();
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

class _PayViewState extends State<PayView> {
  _PayViewState();

  @override
  void deactivate() {
    widget.$Model.deactive();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    widget.$Model.registryProperties(context);
    widget.$Model.init();

    var _ = WillPopScope(
      child: Scaffold(
          appBar: AppBar(
              backgroundColor: ColorsApp.primaryColor,
              title: Text(S.of(context).store)),
          body: Column(
            children: [
              /*  Container(
                width: double.infinity,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: Text("Приобрести полную версию:",
                        style: TextStyleApp.getTitleTextStore16ColorStyle()))),
            Container(
                width: double.infinity,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 4),
                    child: Text("1. Полное отключение рекламы.",
                        style: TextStyleApp.getTitleTextStore14ColorStyle()))),
            Container(
                width: double.infinity,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 4),
                    child: Text(
                        "2. Все следущие платные пакеты в приложении совершенно бесплатно.",
                        style: TextStyleApp.getTitleTextStore14ColorStyle()))),
            Container(
                margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
                width: double.infinity,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 4),
                    child: Center(
                        child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Цена:",
                            style: TextStyleApp.getStylePrimaryText18Color()),
                        Container(
                            margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
                            child: Text(widget.$Model.price,
                                style:
                                    TextStyleApp.getStylePrimaryText18Color())),
                      ],
                    )))),
            Container(
                margin: EdgeInsets.fromLTRB(0, 24, 0, 24),
                width: 200,
                height: 40,
                child: RaisedButton(
                  color: ColorsApp.primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Center(
                    child:
                        Text('Buy', style: TextStyleApp.getStyleWhiteText16()),
                  ),
                  onPressed: widget.$Model.link(#pay, resetOnBefore: true),
                )),
            Container(
                width: double.infinity,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: Text("Уже приобрели полную версию?",
                        style: TextStyleApp.getTitleTextStore16ColorStyle()))),
            Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 24),
                width: 200,
                height: 40,
                child: RaisedButton(
                  color: ColorsApp.primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Center(
                    child: Text('Восстановить',
                        style: TextStyleApp.getStyleWhiteText16()),
                  ),
                  onPressed: widget.$Model.link(#restore, resetOnBefore: true),
                )),*/
              Container(
                  width: double.infinity,
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                      child: Text(S.of(context).store_message_disabled_ads_free,
                          style:
                              TextStyleApp.getTitleTextStore16ColorStyle()))),
              widget.$.watchFor<AsyncSnapshot<bool>>(#showAds,
                  builder: widget.$.builder1((visibility) => Visibility(
                      visible: visibility.data,
                      child: Container(
                          width: 200,
                          height: 40,
                          child: RaisedButton(
                            color: ColorsApp.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Center(
                              child: Text(S.of(context).video,
                                  style: TextStyleApp.getStyleWhiteText16()),
                            ),
                            onPressed: widget.$Model
                                .link(#videoads, resetOnBefore: true),
                          ))))),
              widget.$.watchFor<AsyncSnapshot<bool>>(#adsMessage,
                  builder: widget.$.builder1((visibility) => Visibility(
                      visible: visibility.data,
                      child: widget.$.watchFor<AsyncSnapshot<String>>(
                          #adsMessageTitle,
                          builder: widget.$.builder1((message) => Container(
                              margin: EdgeInsets.fromLTRB(12, 8, 12, 0),
                              child: Text(message.data,
                                  style: TextStyleApp
                                      .getStylePrimaryText14Color())))))))
            ],
          )),
      onWillPop: () async {
        widget.$Model.onBackButtonPressed();
        return true;
      },
    );

    widget.$Model.active();
    return _;
  }
}
