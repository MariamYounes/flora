import 'package:flutter/material.dart';

import '../../elements/cart_element.dart';
import '../../elements/colors.dart';
import '../../elements/main_button.dart';
import '../../elements/text_area.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({super.key});

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  TextEditingController promo = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        const CartElement(),
        const CartElement(),
        const SizedBox(
          height: 20,
        ),
        total("السعر (2) منتج", "24 ريال"),
        total("التوصيل", "مجانا"),
        total("السعر الكلي", "24 ريال"),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            children: [
              Expanded(child: textField(context, promo, "إدخل الكوبون", TextInputType.text,maxLength: 8),),
              const SizedBox(width: 15,),
              Expanded(child: mainButton(context, "تحقق"),),
            ],
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: mainButton(context, "استمر"),
        ),
      ],
    );
  }
  total(txt,sub){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(txt,style: TextStyle(
                fontSize: 17,
                color: Constants.secondaryColor(),
              ),),
              const Expanded(child: SizedBox()),
              Text(sub,style: TextStyle(
                fontSize: 17,
                color: Constants.primaryColor(),
              ),),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
