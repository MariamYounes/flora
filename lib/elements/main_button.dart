import 'package:flutter/material.dart';

import 'colors.dart';

Widget mainButton(BuildContext context, text) {
  return Container(
    alignment: Alignment.center,
    height: 52,
    width: MediaQuery.of(context).size.width,
    decoration:  BoxDecoration(
      color: Constants.primaryColor(),
      borderRadius: BorderRadius.circular(12.0),
    ),
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );
}

Widget borderButton(BuildContext context, text, textColor, borderColor) {
  return Container(
    alignment: Alignment.center,
    height: 52,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(
        color: borderColor,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(28.0),
      ),
    ),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 16,
        color: textColor,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
