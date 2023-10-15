import 'package:flora/elements/cart_element.dart';
import 'package:flora/screens/cart/add_address.dart';
import 'package:flutter/material.dart';

import '../../elements/main_button.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        addressListElement(),
        addressListElement(),
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddAddressScreen(),
                ),
              );
            },
            child: mainButton(context, "أضف عنوان جديد"),
          ),
        ),
      ],
    );
  }
}
