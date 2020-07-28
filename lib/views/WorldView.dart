import 'package:flutter/material.dart';
import 'package:statistic_covid19/generated/i18n.dart';
import 'package:statistic_covid19/infrastructure/Styles/TextStyle.dart';
import 'package:statistic_covid19/infrastructure/Utils/ColorsApp.dart';
import 'package:statistic_covid19/infrastructure/base/BaseView.dart';
import 'package:statistic_covid19/viewModels/WorldViewModel.dart';

class WorldView extends BaseView<WorldViewModel> {
  WorldView(WorldViewModel model) : super(model);

  @override
  State<StatefulWidget> createState() {
    return _WorldViewState();
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

class _WorldViewState extends State<WorldView> {
  _WorldViewState();

  @override
  void deactivate() {
    widget.$Model.deactive();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    widget.$Model.registryProperties(context);
    widget.$Model.init();

    var _ = SingleChildScrollView(
      child: Column(
        children: [
          Container(
              width: double.infinity,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: widget.$.watchFor<AsyncSnapshot<String>>(#country,
                      builder: widget.$.builder1((country) => Text(country.data,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyleApp
                              .getTitleTextStoreBold16ColorStyle()))))),
          Container(
              width: double.infinity,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 6),
                  child: Text(S.of(context).new_cases,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style:
                          TextStyleApp.getTitleTextStoreBold16ColorStyle()))),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new Flexible(
                        child: Card(
                            color: ColorsApp.mainBackgroundColor,
                            child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 12),
                                child: Column(children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 12),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(S.of(context).confirmed,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyleApp
                                                      .getStyleWhiteText14()),
                                              widget.$.watchFor<
                                                      AsyncSnapshot<String>>(
                                                  #countryConfirm,
                                                  builder: widget.$.builder1(
                                                      (confirmed) => Text(
                                                          confirmed.data,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyleApp
                                                              .getStyleWhiteText18Color()))),
                                            ],
                                          )
                                        ]),
                                  )
                                ]))),
                        flex: 1),
                    new Flexible(
                        child: Card(
                            color: ColorsApp.greenColor,
                            child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 12),
                                child: Column(children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 12),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(S.of(context).recovered,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyleApp
                                                      .getStyleWhiteText14()),
                                              widget.$.watchFor<
                                                      AsyncSnapshot<String>>(
                                                  #countryRecovered,
                                                  builder: widget.$.builder1(
                                                      (recovered) => Text(
                                                          recovered.data,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyleApp
                                                              .getStyleWhiteText18Color()))),
                                            ],
                                          )
                                        ]),
                                  )
                                ]))),
                        flex: 1),
                  ])),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new Flexible(
                        child: Card(
                            color: ColorsApp.redColor,
                            child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 12),
                                child: Column(children: [
                                  Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 12),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                        S.of(context).deaths,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyleApp
                                                            .getStyleWhiteText14())),
                                                widget.$.watchFor<
                                                        AsyncSnapshot<String>>(
                                                    #countryDeaths,
                                                    builder: widget.$.builder1(
                                                        (deaths) => Text(
                                                            deaths.data,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyleApp
                                                                .getStyleWhiteText18Color())))
                                              ],
                                            ),
                                          ])),
                                ]))),
                        flex: 1),
                  ])),
          Container(
              width: double.infinity,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Text(S.of(context).total_cases,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style:
                          TextStyleApp.getTitleTextStoreBold16ColorStyle()))),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new Flexible(
                        child: Card(
                            color: ColorsApp.mainBackgroundColor,
                            child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 12),
                                child: Column(children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 12),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(S.of(context).confirmed,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyleApp
                                                      .getStyleWhiteText14()),
                                              widget.$.watchFor<
                                                      AsyncSnapshot<String>>(
                                                  #countryTotalConfirm,
                                                  builder: widget.$.builder1(
                                                      (confirmed) => Text(
                                                          confirmed.data,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyleApp
                                                              .getStyleWhiteText18Color()))),
                                            ],
                                          )
                                        ]),
                                  )
                                ]))),
                        flex: 1),
                    new Flexible(
                        child: Card(
                            color: ColorsApp.orangeColor,
                            child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 12),
                                child: Column(children: [
                                  Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 12),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(S.of(context).active,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyleApp
                                                        .getStyleWhiteText14()),
                                                widget.$.watchFor<
                                                        AsyncSnapshot<String>>(
                                                    #countryTotalActive,
                                                    builder: widget.$.builder1(
                                                        (active) => Text(
                                                            active.data,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyleApp
                                                                .getStyleWhiteText18Color()))),
                                              ],
                                            ),
                                          ])),
                                ]))),
                        flex: 1)
                  ])),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new Flexible(
                        child: Card(
                            color: ColorsApp.greenColor,
                            child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 12),
                                child: Column(children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 12),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(S.of(context).recovered,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyleApp
                                                      .getStyleWhiteText14()),
                                              widget.$.watchFor<
                                                      AsyncSnapshot<String>>(
                                                  #countryTotalRecovered,
                                                  builder: widget.$.builder1(
                                                      (recovered) => Text(
                                                          recovered.data,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyleApp
                                                              .getStyleWhiteText18Color()))),
                                            ],
                                          )
                                        ]),
                                  )
                                ]))),
                        flex: 1),
                    new Flexible(
                        child: Card(
                            color: ColorsApp.redColor,
                            child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 12),
                                child: Column(children: [
                                  Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 12),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(S.of(context).deaths,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyleApp
                                                        .getStyleWhiteText14()),
                                                widget.$.watchFor<
                                                        AsyncSnapshot<String>>(
                                                    #countryTotalDeaths,
                                                    builder: widget.$.builder1(
                                                        (deaths) => Text(
                                                            deaths.data,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyleApp
                                                                .getStyleWhiteText18Color())))
                                              ],
                                            ),
                                          ])),
                                ]))),
                        flex: 1),
                  ])),
          Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Text(S.of(context).new_cases_world,
                      textAlign: TextAlign.center,
                      style:
                          TextStyleApp.getTitleTextStoreBold16ColorStyle()))),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Card(
                  color: ColorsApp.worldContainerColor,
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      child: Column(children: [
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(S.of(context).confirmed,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyleApp
                                              .getStyleMainText14()),
                                      widget.$.watchFor<AsyncSnapshot<String>>(
                                          #worldConfirm,
                                          builder: widget.$.builder1(
                                              (confirm) => Text(confirm.data,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyleApp
                                                      .getStyleMainText18Color())))
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(S.of(context).recovered,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyleApp
                                              .getStyleGreenText14()),
                                      widget.$.watchFor<AsyncSnapshot<String>>(
                                          #worldRecovered,
                                          builder: widget.$.builder1(
                                              (recovered) => Text(
                                                  recovered.data,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyleApp
                                                      .getStyleGreenText18Color())))
                                    ],
                                  ),
                                ])),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(S.of(context).deaths,
                                          overflow: TextOverflow.ellipsis,
                                          style:
                                              TextStyleApp.getStyleRedText14()),
                                      widget.$.watchFor<AsyncSnapshot<String>>(
                                          #worldDeaths,
                                          builder: widget.$.builder1((deaths) =>
                                              Text(deaths.data,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyleApp
                                                      .getStyleRedText18Color())))
                                    ],
                                  )
                                ])),
                      ])))),
          Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Text(S.of(context).total_cases_world,
                      textAlign: TextAlign.center,
                      style:
                          TextStyleApp.getTitleTextStoreBold16ColorStyle()))),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Card(
                  color: ColorsApp.worldContainerColor,
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      child: Column(children: [
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(S.of(context).confirmed,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyleApp
                                              .getStyleMainText14()),
                                      widget.$.watchFor<AsyncSnapshot<String>>(
                                          #worldTotalConfirm,
                                          builder: widget.$.builder1(
                                              (confirm) => Text(confirm.data,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyleApp
                                                      .getStyleMainText18Color())))
                                    ],
                                  ),
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(S.of(context).recovered,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyleApp
                                                .getStyleGreenText14()),
                                        widget.$.watchFor<
                                                AsyncSnapshot<String>>(
                                            #worldTotalRecovered,
                                            builder: widget.$.builder1(
                                                (recovered) => Text(
                                                    recovered.data,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyleApp
                                                        .getStyleGreenText18Color())))
                                      ]),
                                ])),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(S.of(context).deaths,
                                          overflow: TextOverflow.ellipsis,
                                          style:
                                              TextStyleApp.getStyleRedText14()),
                                      widget.$.watchFor<AsyncSnapshot<String>>(
                                          #worldTotalDeaths,
                                          builder: widget.$.builder1((deaths) =>
                                              Text(deaths.data,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyleApp
                                                      .getStyleRedText18Color())))
                                    ],
                                  )
                                ])),
                      ])))),
        ],
      ),
    );

    widget.$Model.active();

    return _;
  }
}
