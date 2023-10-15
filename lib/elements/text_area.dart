import 'package:flutter/material.dart';

import 'colors.dart';

Widget textField(
    BuildContext context, controller, hint, TextInputType textInputType,
    {maxLength = 100, readOnly = false, secure = false}) {
  return Container(
    height: 52,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(
        color: Constants.primaryColor(),
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Container(
      alignment: Alignment.center,
      child: TextFormField(
        controller: controller,
        keyboardType: textInputType,
        obscureText: secure,
        textInputAction: TextInputAction.done,
        cursorColor: Constants.primaryColor(),
        maxLength: maxLength,
        readOnly: readOnly,
        decoration: InputDecoration(
          counterText: "",
          contentPadding: const EdgeInsets.all(12),
          hintText: hint,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
          border: InputBorder.none,
        ),
        //  inputFormatters: [new FilteringTextInputFormatter.allow(RegExp("[0-9]"))],
      ),
    ),
  );
}

Widget addressAddElement(context,txt,controller,hint,textInputType,{maxLength = 100}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        txt,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Constants.secondaryColor(),
        ),
      ),
      const SizedBox(height: 10,),
      Container(
        height: 40,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              color: Constants.secondaryColor().withOpacity(.5),
            ),
          ),
        ),
        child: Container(
          alignment: Alignment.center,
          child: TextFormField(
            controller: controller,
            keyboardType: textInputType,
            textInputAction: TextInputAction.done,
            cursorColor: Constants.primaryColor(),
            maxLength: maxLength,
            decoration: InputDecoration(
              counterText: "",
             // contentPadding: const EdgeInsets.only(bottom: 8),
              hintText: hint,
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
      const SizedBox(height: 15,),
    ],
  );
}
