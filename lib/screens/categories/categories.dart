import 'dart:convert';

import 'package:flora/api/api_service.dart';
import 'package:flora/elements/app_bar.dart';
import 'package:flora/elements/category_element.dart';
import 'package:flora/screens/categories/services.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

List sliderList = [];

class _CategoriesScreenState extends State<CategoriesScreen> {
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
            const TitleAppBar(title: "التصنيفات"),
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
                      ? GridView.builder(
                          padding: const EdgeInsets.all(0),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1,
                            crossAxisCount: 2,
                            crossAxisSpacing: 0.0,
                            mainAxisSpacing: 0.0,
                          ),
                          shrinkWrap: true,
                          //physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: sliderList.length,
                          itemBuilder: (context, index) {
                            bool isEven = index % 2 == 0;
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ServicesScreen(
                                      secId: sliderList[index]['id'].toString(),
                                      title:
                                          sliderList[index]['title'].toString(),
                                    ),
                                  ),
                                );
                              },
                              child: categoryElement(
                                isEven,
                                sliderList[index],
                              ),
                            );
                          },
                        )
                      : const Center(
                          child: Text(
                            "لا يوجد أقسام",
                            // textDirection: TextDirection.ltr,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
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
    final homeResponse = await getSectionsItems();
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
