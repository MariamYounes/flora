import 'dart:async';

import 'package:flora/screens/bottom_bar_screen/pages.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    Timer(
      const Duration(seconds: 1),
      () async {
        if (mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>  PagesTestWidget(),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: null,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Image.asset(
              "assets/images/logo.png",
              width: MediaQuery.of(context).size.width * .65,
            ),
          ),
        ),
      ),
    );
  }
}
