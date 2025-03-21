import 'package:flutter/material.dart';

final Color scaffoldBackgroundColor = Color(0xffEFEFEF);
final Color primaryColor = Color(0xFF4558C8);
final String names = "names";
final String expenses = "expenses";
final String goals = "goals";
final String wallet = "wallet";
final String spent = "spent";
final String exchange = "Exchange";
final String deposit = "Deposit";

dynamic truncateValue(double value) {
  return (value == value.truncate()) ? value.toInt() : value;
}

double responsiveFontSize(BuildContext context, double baseSize) {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;
  double scaleFactor = (screenWidth + screenHeight) / 1400;
  return baseSize * scaleFactor;
}

double responsiveSpacing(BuildContext context, double baseSpacing) {
  double screenWidth = MediaQuery.of(context).size.width;
  return baseSpacing * (screenWidth / 375);
}
