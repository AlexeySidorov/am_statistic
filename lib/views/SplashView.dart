import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:statistic_covid19/generated/i18n.dart';
import 'package:statistic_covid19/infrastructure/Styles/TextStyle.dart';
import 'package:statistic_covid19/infrastructure/Utils/ColorsApp.dart';
import 'package:statistic_covid19/infrastructure/base/BaseView.dart';
import 'package:statistic_covid19/viewModels/SplashViewModel.dart';

class SplashView extends BaseView<SplashViewModel> {
  SplashView(SplashViewModel model) : super(model);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
          Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                Align(
                    alignment: FractionalOffset.center,
                    child: Center(
                        child: Container(
                            width: 250,
                            height: 250,
                            child: Image(
                                fit: BoxFit.fill,
                                image: AssetImage('images/logo.png')))))
              ])),
          Expanded(
              child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 32,
                          height: 32,
                          margin: EdgeInsets.all(24),
                          child: CircularProgressIndicator(
                              valueColor: new AlwaysStoppedAnimation<Color>(
                                  ColorsApp.primaryColor)),
                        ),
                        Container(
                            child: Text(S.of(context).please_wait,
                                style: TextStyleApp.getStylePrimaryText14()))
                      ])))
        ])));
  }
}
