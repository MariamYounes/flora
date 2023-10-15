import 'dart:convert';

import 'package:flora/elements/home_element.dart';
import 'package:flora/screens/categories/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../api/api_service.dart';
import '../../elements/app_bar.dart';
import '../../elements/colors.dart';

class ServicesScreen extends StatefulWidget {
  final String secId;
  final String title;
  const ServicesScreen({super.key, required this.secId, required this.title});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

List sliderList = [];
Map? itemDetails;

class _ServicesScreenState extends State<ServicesScreen> {
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
             BackTitleAppBar(title:widget.title),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Constants.secondaryColor().withOpacity(.5),
                        ),
                        left: BorderSide(
                          color: Constants.secondaryColor().withOpacity(.5),
                        ),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "فلتر",
                          style: TextStyle(
                            fontSize: 16,
                            color: Constants.secondaryColor(),
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: Constants.secondaryColor(),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Constants.secondaryColor().withOpacity(.5),
                        ),
                        left: BorderSide(
                          color: Constants.secondaryColor().withOpacity(.5),
                        ),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "فرز حسب",
                          style: TextStyle(
                            fontSize: 16,
                            color: Constants.secondaryColor(),
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: Constants.secondaryColor(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child:sliderLoading
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
                  ?  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.builder(
                  padding: const EdgeInsets.all(0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                        details(sliderList[index]['langid'].toString());

                      },
                      child: productForListView(sliderList[index]),
                    );
                  },
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
    final homeResponse = await getServicesOfSectionList(widget.secId);
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

  dynamic details( serviceId) async {
    EasyLoading.show(
        status: "جاري الطلب ...", maskType: EasyLoadingMaskType.custom);
    final response = await getViewItemDetails( serviceId);
    var res = json.decode(response.body);

    setState(() {
      itemDetails = res;
    });
    EasyLoading.dismiss();
    if(mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>  ProductDetails(
            productDetails: itemDetails!,
          ),
        ),
      );
    }
  }
}
