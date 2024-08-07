// lib/transparent_app_bar.dart
import 'package:flutter/material.dart';

AppBar transparentAppBar({
  required String titleText,
  TextStyle? titleStyle,
  Gradient? backgroundGradient,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: backgroundGradient ??
            LinearGradient(
              colors: [Colors.transparent, Colors.transparent],
            ),
      ),
    ),
    title: Center(
      child: Text(
        titleText,
        style: titleStyle ?? TextStyle(color: Colors.black),
      ),
    ),
    iconTheme: IconThemeData(color: Colors.black),
  );
}
