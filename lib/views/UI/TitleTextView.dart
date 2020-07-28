import 'package:flutter/cupertino.dart';
import 'package:statistic_covid19/infrastructure/Styles/TextStyle.dart';

Widget titleTextWidget(String text, FlexFit flexFit, TextOverflow overflow) {
  return Flexible(
      fit: flexFit,
      child: Text(text,
          overflow: overflow, style: TextStyleApp.getTitleText16ColorStyle()));
}

Widget subTitleTextWidget(String text, FlexFit flexFit, TextOverflow overflow) {
  return Flexible(
      fit: flexFit,
      child: Text(text,
          overflow: overflow,
          style: TextStyleApp.getSubTitleText14ColorStyle()));
}
