import 'dart:convert';

import 'package:flora/api/api_service.dart';
import 'package:flora/elements/home_element.dart';
import 'package:flutter/material.dart';

import '../../elements/app_bar.dart';
import '../categories/product_details.dart';

class AllBestSellingScreen extends StatefulWidget {
  const AllBestSellingScreen({super.key});

  @override
  State<AllBestSellingScreen> createState() => _AllBestSellingScreenState();
}

List sliderList = [];

class _AllBestSellingScreenState extends State<AllBestSellingScreen> {
  bool sliderLoading = false;

  @override
  void initState() {
    getSlider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const BackTitleAppBar(title: "المقترحة لك"),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: sliderLoading
                  ? Center(
                child: Container(
                  height: 117,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(
                    valueColor:
                    AlwaysStoppedAnimation<Color>(Colors.pink),
                  ),
                ),
              )
                  : sliderList.isNotEmpty
                  ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.builder(
                  padding: const EdgeInsets.all(0),
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: .8,
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 10.0,
                  ),
                  shrinkWrap: true,
                  //physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: sliderList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                             ProductDetails(
                               productDetails: sliderList[index],
                             ),
                          ),
                        );
                      },
                      child: productForListView(sliderList[index]),
                    );
                  },
                ),
              )
                  : const Center(
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
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Future getSlider() async {
    setState(() {
      sliderList = [];
      sliderLoading = true;
    });
    final homeResponse = await getBestSelling();
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
