import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../api/api_service.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

List sliderList = [];

class _HomeSliderState extends State<HomeSlider> {
  bool sliderLoading = false;
  CarouselController buttonCarouselController = CarouselController();

  int currentIndex = 0;

  @override
  void initState() {
    getSlider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return sliderLoading
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
            ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: CarouselSlider(
                  items: sliderList.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return InkWell(
                          onTap: () {
                            launchUrl(i['url']);
                          },
                          child: Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: CachedNetworkImage(
                                height: 200,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover,
                                imageUrl: i['pic'] ?? "",
                                // color: Colors.black12,
                                // colorBlendMode: BlendMode.softLight,
                                placeholder: (context, url) => Image.asset(
                                  'assets/images/loading.gif',
                                  fit: BoxFit.fill,
                                  height: 150,
                                  width: MediaQuery.of(context).size.width,
                                ),
                                errorWidget: (context, url, error) => Image.asset(
                                  'assets/images/loading.gif',
                                  fit: BoxFit.fill,
                                  height: 150,
                                  width: MediaQuery.of(context).size.width,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                  carouselController: buttonCarouselController,
                  options: CarouselOptions(
                    onPageChanged: (index, _) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 5),
                    autoPlayAnimationDuration: const Duration(milliseconds: 500),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    viewportFraction: 1,
                    // aspectRatio: 16 / 8,
                    enableInfiniteScroll: true,
                    reverse: false,
                    initialPage: 0,
                  ),
                ),
            )
            : const Center(
                child: Text(
                  "لا يوجد إعلانات",
                  // textDirection: TextDirection.ltr,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              );
  }

  Future getSlider() async {
    setState(() {
      sliderList = [];
      sliderLoading = true;
    });
    final homeResponse = await getSliderItems();
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
