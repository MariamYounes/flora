import 'dart:convert';

import 'package:flora/screens/bottom_bar_screen/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/api_service.dart';
import '../../elements/alert.dart';
import '../../elements/app_bar.dart';
import '../../elements/main_button.dart';
import '../../elements/text_area.dart';

class VerifyAccount extends StatefulWidget {
  final String phoneNumber;
  const VerifyAccount({super.key, required this.phoneNumber});

  @override
  State<VerifyAccount> createState() => _VerifyAccountState();
}

class _VerifyAccountState extends State<VerifyAccount> {
  final TextEditingController codeController = TextEditingController();
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
                    height: 70,
                  ),

                  const Center(
                    child: Text(
                      "كود التفعيل",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Center(
                    child: Text(
                      "إدخل كود التفعيل الذي تم إرساله إلى هاتفك",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  textField(
                      context, codeController, "كود التفعيل", TextInputType.phone,maxLength: 8),

                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      if (codeController.value.text.isEmpty) {
                        showError("الكود مطلوب");
                      } else {
                        verify();
                      }
                    },
                    child: mainButton(
                      context,
                      "تحقق",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {

                      },
                      child: const Text(
                        "لم يصلك كود التفعيل ؟ إعادة إرسال",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
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

  String phone = '';

  String replaceArabicNumber(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(arabic[i], english[i]);
    }
    setState(() {
      phone = input;
    });
    return input;
  }

  dynamic verify() async {
    final SharedPreferences preferences= await SharedPreferences.getInstance();
    replaceArabicNumber(codeController.value.text);
    EasyLoading.show(
        status: "جاري الطلب ...", maskType: EasyLoadingMaskType.custom);
    final response = await checkCode(widget.phoneNumber, phone, );
    debugPrint("response.body.toString()");
    debugPrint(response.body.toString());
    var res = json.decode(response.body);
    if (res['response'] != 0) {
      EasyLoading.dismiss();
      showSuccess(
        res['status'],
      );
      preferences.setString("userId", res['id'].toString());
      preferences.setBool("isLog", true);
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PagesTestWidget(
            ),
          ),
        );
     }
    } else if (res['response'] == 0) {
      EasyLoading.dismiss();
      showError(res['status']);
    }
  }

}
