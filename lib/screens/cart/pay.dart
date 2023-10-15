import 'package:flora/screens/cart/confirm_order.dart';
import 'package:flutter/material.dart';

import '../../elements/colors.dart';
import '../../elements/main_button.dart';

class PayScreen extends StatefulWidget {
  const PayScreen({super.key});

  @override
  State<PayScreen> createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {
  String pay = "cash";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            children: [
              payCardElement(pay =="cash"?true:false, "عند الإستلام","cash"),
              const SizedBox(
                width: 20,
              ),
              payCardElement(pay =="pal"?true:false,"باي بال","pal"),
              const SizedBox(
                width: 20,
              ),
              payCardElement(pay =="mada"?true:false, "مدى","mada"),
            ],
          ),
        ),
        const SizedBox(
          height: 70,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ConfirmOrderScreen(),
                ),
              );
            },
            child: mainButton(context, "استمر"),
          ),
        ),
      ],
    );
  }

  payCardElement(filled, txt,pay1) {
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            pay = pay1;
          });
        },
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: filled == true ? Constants.primaryColor() : Colors.white,
            border: Border.all(
              color: Constants.primaryColor(),
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            txt,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: filled == true ? Colors.white : Constants.primaryColor(),
            ),
          ),
        ),
      ),
    );
  }
}
