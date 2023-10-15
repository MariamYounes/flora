import 'dart:convert';

import 'package:flora/api/api_service.dart';
import 'package:flora/elements/colors.dart';
import 'package:flora/screens/home/all_suggest.dart';
import 'package:flutter/material.dart';

import '../../elements/home_element.dart';
import '../categories/product_details.dart';

class HomeSuggest extends StatefulWidget {
  const HomeSuggest({super.key});

  @override
  State<HomeSuggest> createState() => _HomeSuggestState();
}
List sliderList = [];

class _HomeSuggestState extends State<HomeSuggest> {

  bool sliderLoading = false;

  @override
  void initState() {
    getSlider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                "المقترحة لك",
                style: TextStyle(
                  color: Constants.secondaryColor(),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  const AllSuggestScreen(),
                    ),
                  );
                },
                child: Text(
                  "المزيد",
                  style: TextStyle(
                    color: Constants.secondaryColor(),
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          sliderLoading
              ? Center(
            child: Container(
              height: 117,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
              ),
            ),
          )
              : sliderList.isNotEmpty
              ?  SizedBox(
            height: 260,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  ProductDetails(
                          productDetails: sliderList[index],
                        ),
                      ),
                    );
                  },child: productForListView(sliderList[index])),
              separatorBuilder: (context, index) => const SizedBox(
                width: 15,
              ),
              itemCount:sliderList.length > 4 ?4:sliderList.length,
            ),
          ): const Center(
            child: Text(
              "لا يوجد منتجات حالية",
              // textDirection: TextDirection.ltr,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future getSlider() async {
    setState(() {
      sliderList = [];
      sliderLoading = true;
    });
    final homeResponse = await getSuggestList();
    debugPrint("response.body.toString()");
    debugPrint(homeResponse.body.toString());
    var res = json.decode(homeResponse.body);
    if (res == null || res.isEmpty) {
      setState(() {
        sliderList = [];
        sliderLoading = false;
      });
    } else {
      for (var item in res) {
        if (mounted) {
          setState(() {
            sliderList.add(item);
          });
        }
      }
    }
    if (mounted) {
      setState(() {
        sliderLoading = false;
      });
    }
  }
}
