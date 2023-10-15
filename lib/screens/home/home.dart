import 'package:flora/elements/app_bar.dart';
import 'package:flora/screens/home/home_best_seller.dart';
import 'package:flora/screens/home/home_slider.dart';
import 'package:flora/screens/home/home_suggest.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const   SearchAppBar(),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  HomeSlider(),
                  HomeSuggest(),
                  HomeBestSeller(),
                  SizedBox(
                    height: 110,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
