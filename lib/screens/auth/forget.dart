import 'dart:convert';

import 'package:flora/api/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../elements/alert.dart';
import '../../elements/app_bar.dart';
import '../../elements/colors.dart';
import '../../elements/main_button.dart';
import '../../elements/text_area.dart';

class ForgetPassword extends StatelessWidget {
   ForgetPassword({super.key});

  final TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 24),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BackAppBar(),
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: Image.asset(
                      Constants.logo,
                      height: 180,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    "إسترجاع كلمة المرور",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "الرجاء قم بكتابة بريدك الإلكتروني لإسترجاع كلمة المرور",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  textField(
                      context, phoneController, "البريد الإلكتروني", TextInputType.emailAddress,maxLength: 70),

                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      if (phoneController.value.text.isEmpty) {
                        showError("البريدالإلكتروني مطلوب");
                      } else {
                        forget(context);
                      }
                    },
                    child: mainButton(
                      context,
                      "إرسال",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

   dynamic forget(context) async {
     EasyLoading.show(
         status: "جاري الطلب ...", maskType: EasyLoadingMaskType.custom);
     final response = await forgetPassMethod(phoneController.value.text);
     debugPrint("response.body.toString()");
     debugPrint(response.body.toString());
     var res = json.decode(response.body);
     if (res['respond'] != 0) {
       EasyLoading.dismiss();
       showSuccess(
         res['status'],
       );
       Navigator.pop(context);
     } else if (res['respond'] == 0) {
       EasyLoading.dismiss();
       showError(res['status']);
     }
   }

}
