import 'dart:convert';

import 'package:flora/elements/home_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../api/api_service.dart';
import '../../elements/app_bar.dart';
import '../categories/product_details.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

List sliderList = [];
Map? itemDetails;

class _FavScreenState extends State<FavScreen> {
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
            const BackTitleAppBar(title: "المفضلة"),
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
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => const ProductDetails(),
                                  //   ),
                                  // );
                                },
                                child: productForFavListView(),
                              );
                            },
                          ),
                        )
                      : const Center(
                          child: Text(
                            "لا يوجد منتجات فالمفضلة",
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
    final homeResponse = await userFavList();
    debugPrint("fav.body.toString()");
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

  dynamic details(serviceId) async {
    EasyLoading.show(
        status: "جاري الطلب ...", maskType: EasyLoadingMaskType.custom);
    final response = await getViewItemDetails(serviceId);
    var res = json.decode(response.body);

    setState(() {
      itemDetails = res;
    });
    EasyLoading.dismiss();
    if (mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductDetails(
            productDetails: itemDetails!,
          ),
        ),
      );
    }
  }
}
