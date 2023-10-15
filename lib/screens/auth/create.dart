import 'dart:convert';

import 'package:flora/api/api_service.dart';
import 'package:flora/elements/colors.dart';
import 'package:flora/screens/auth/otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../elements/alert.dart';
import '../../elements/app_bar.dart';
import '../../elements/main_button.dart';
import '../../elements/text_area.dart';
import 'create_terms.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BackAppBar(),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Constants.lightGreyColor().withOpacity(.4),
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  textField(
                      context, nameController, "الأسم", TextInputType.text,
                      maxLength: 60),
                  const SizedBox(
                    height: 20,
                  ),
                  textField(context, emailController, "البريدالإلكتروني",
                      TextInputType.emailAddress,
                      maxLength: 60),
                  const SizedBox(
                    height: 20,
                  ),
                  textField(context, phoneController, "رقم الموبايل",
                      TextInputType.phone,
                      maxLength: 11),
                  const SizedBox(
                    height: 20,
                  ),
                  textField(
                    context,
                    passwordController,
                    "كلمة المرور",
                    TextInputType.text,
                    secure: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  textField(
                    context,
                    confirmPasswordController,
                    "تأكيد كلمة المرور",
                    TextInputType.text,
                    secure: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CreateAccountTerms(),
                        ),
                      );
                    },
                    child: const Text(
                      "أوافق على الشروط و الأحكام",
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      if (nameController.value.text.isEmpty) {
                        showError("الأسم مطلوب");
                      } else if (emailController.value.text.isEmpty) {
                        showError("البريدالإلكتروني مطلوب");
                      } else if (phoneController.value.text.isEmpty) {
                        showError("رقم الجوال مطلوب");
                      } else if (passwordController.value.text.isEmpty) {
                        showError("كلمة المرور مطلوبة");
                      } else if (passwordController.value.text !=
                          confirmPasswordController.value.text) {
                        showError("يجب ان تتطابق كلمة المرور");
                      } else {
                        create();
                      }
                    },
                    child: mainButton(
                      context,
                      "إنشاء",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "لديك حساب بالفعل ؟ قم بتسجيل الدخول",
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

  dynamic create() async {
    replaceArabicNumber(phoneController.value.text);
    EasyLoading.show(
        status: "جاري الطلب ...", maskType: EasyLoadingMaskType.custom);
    final response = await createAccountMethod(nameController.value.text,
        emailController.value.text, phone, passwordController.value.text);
    debugPrint("response.body.toString()");
    debugPrint(response.body.toString());
    var res = json.decode(response.body);
    if (res['response'] != 0) {
      EasyLoading.dismiss();
      showSuccess(
        res['status'],
      );
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VerifyAccount(
              phoneNumber: phone,
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
