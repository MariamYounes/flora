import 'package:flutter/material.dart';

import 'colors.dart';

Widget userAddressListElement() {
  return Row(
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "عنوان المنزل",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Constants.secondaryColor(),
              ),
            ),
            Text(
              "التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل التفاصيل",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Constants.secondaryColor(),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(
        width: 20,
      ),
      Container(
        height: 25,
        width: 25,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Constants.primaryColor(),
        ),
        alignment: Alignment.center,
        child: const Icon(
          Icons.check,
          color: Colors.white,
        ),
      ),
    ],
  );
}
