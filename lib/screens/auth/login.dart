import 'dart:convert';

import 'package:flora/elements/app_bar.dart';
import 'package:flora/elements/main_button.dart';
import 'package:flora/elements/text_area.dart';
import 'package:flora/screens/auth/create.dart';
import 'package:flora/screens/auth/forget.dart';
import 'package:flora/screens/bottom_bar_screen/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/api_service.dart';
import '../../elements/alert.dart';
import '../../elements/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

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
                  textField(
                      context, emailController, "البريد الإلكتروني", TextInputType.emailAddress,maxLength: 70),
                  const SizedBox(
                    height: 20,
                  ),
                  textField(
                      context, phoneController, "رقم الموبايل", TextInputType.phone,maxLength: 12),
                  const SizedBox(
                    height: 20,
                  ),
                  textField(
                      context, passwordController, "كلمة المرور", TextInputType.text,secure: true,),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  ForgetPassword(),
                        ),
                      );
                    },
                    child: const Text(
                      "هل نسيت كلمة المرور ؟",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      if (emailController.value.text.isEmpty) {
                        showError("البريدالإلكتروني مطلوب");
                      } else if (phoneController.value.text.isEmpty) {
                        showError("رقم الجوال مطلوب");
                      } else if (passwordController.value.text.isEmpty) {
                        showError("كلمة المرور مطلوبة");
                      }  else {
                        login();
                      }
                    },
                    child: mainButton(
                      context,
                      "تسجيل الدخول",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  const CreateAccount(),
                          ),
                        );
                      },
                      child: const Text(
                        "مستخدم جديد ؟ إنشاء حساب",
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

  dynamic login() async {
    final SharedPreferences preferences= await SharedPreferences.getInstance();
    replaceArabicNumber(phoneController.value.text);
    // EasyLoading.show(
    //     status: "جاري الطلب ...", maskType: EasyLoadingMaskType.custom);
    final response = await phoneLogin(
        emailController.value.text, phone, passwordController.value.text);
    debugPrint("response.body.toString()");
    debugPrint(response.body.toString());
    var res = json.decode(response.body);
    if (res['response'] != 0) {
      EasyLoading.dismiss();
      showSuccess(
        res['status'],
      );
      preferences.setString("userId", res['id'].toString());
      preferences.setString("name", res['id'].toString());
      preferences.setString("email", res['id'].toString());
      preferences.setString("phone", res['id'].toString());
      preferences.setBool("isLog", true);
      if(mounted) {
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
