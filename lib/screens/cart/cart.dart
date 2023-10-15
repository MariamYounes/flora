
import 'package:flora/screens/cart/address.dart';
import 'package:flora/screens/cart/pay.dart';
import 'package:flora/screens/cart/shopping.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../elements/app_bar.dart';
import '../../elements/colors.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  String step = "shopping";

  bool login = false;

  checkLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var log = pref.getBool("isLog") ?? false;
    setState(() {
      login = log;
    });
  }

  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TitleAppBar(title: "السلة"),
              const SizedBox(
                height: 10,
              ),
              login !=true? const SizedBox(
                height: 400,
                child: Center(
                  child: Text(
                    "يجب عليك تسجيل الدخول اولا",
                    // textDirection: TextDirection.ltr,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ):  Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              step = "shopping";
                            });
                          },
                          child: Container(
                            height: 35,
                            width: 35,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Constants.primaryColor(),
                              ),
                            ),
                            child: Container(
                              height: 20,
                              width: 20,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: step == "shopping"
                                    ? Constants.primaryColor()
                                    : Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Constants.primaryColor(),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              step = "address";
                            });
                          },
                          child: Container(
                            height: 35,
                            width: 35,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Constants.primaryColor(),
                              ),
                            ),
                            child: Container(
                              height: 20,
                              width: 20,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: step == "address"
                                    ? Constants.primaryColor()
                                    : Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Constants.primaryColor(),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              step = "pay";
                            });
                          },
                          child: Container(
                            height: 35,
                            width: 35,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Constants.primaryColor(),
                              ),
                            ),
                            child: Container(
                              height: 20,
                              width: 20,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: step == "pay"
                                    ? Constants.primaryColor()
                                    : Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      children: [
                        Text(
                          "التسوق",
                          style: TextStyle(
                              color: step == "shopping"
                                  ? Constants.secondaryColor().withOpacity(.7)
                                  : Constants.secondaryColor(),
                              fontWeight: step == "shopping"
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              fontSize: 16),
                        ),
                        const Expanded(child: SizedBox()),
                        Text(
                          "العنوان",
                          style: TextStyle(
                              color: step == "address"
                                  ? Constants.secondaryColor().withOpacity(.7)
                                  : Constants.secondaryColor(),
                              fontWeight: step == "address"
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              fontSize: 16),
                        ),
                        const Expanded(child: SizedBox()),
                        Text(
                          "الدفع",
                          style: TextStyle(
                              color: step == "pay"
                                  ? Constants.secondaryColor().withOpacity(.7)
                                  : Constants.secondaryColor(),
                              fontWeight:
                                  step == "pay" ? FontWeight.bold : FontWeight.normal,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  step == "shopping"?  const ShoppingScreen():Container(),
                  step == "address"?  const AddressScreen():Container(),
                  step == "pay"?  const PayScreen():Container(),
                ],
              ),

              //  Expanded(child: EmptyCartScreen()),
            ],
          ),
        ),
      ),
    );
  }


}
