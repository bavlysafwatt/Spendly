import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

void showSnackBar(BuildContext context, String message, Color color) {
  showSimpleNotification(
    Text(
      message,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 18,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    background: color,
    elevation: 0,
    duration: const Duration(seconds: 2),
  );
}
