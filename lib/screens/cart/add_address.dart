import 'package:flora/elements/main_button.dart';
import 'package:flora/elements/text_area.dart';
import 'package:flutter/material.dart';

import '../../elements/app_bar.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children:  [
              const BackTitleAppBar(title: "العنوان"),
              const SizedBox(height: 20,),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      children: [
                        addressAddElement(context, "الأسم", nameController, "الأسم", TextInputType.text),
                        addressAddElement(context, "عنوان البناية", addressController, "عنوان البناية", TextInputType.text),
                        addressAddElement(context, "المدينة", cityController, "المدينة", TextInputType.text),
                        addressAddElement(context, "رقم الجوال", phoneController, "رقم الجوال", TextInputType.phone,maxLength: 11),
                        addressAddElement(context, "الكود", codeController, "الكود", TextInputType.number,maxLength: 6),
                        const SizedBox(height: 80,),
                        InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: mainButton(context, "أضف عنوان جديد"),
                        ),
                        const SizedBox(height: 20,),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
