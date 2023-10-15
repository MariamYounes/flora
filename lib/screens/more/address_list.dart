import 'dart:convert';

import 'package:flora/api/api_service.dart';
import 'package:flutter/material.dart';

import '../../elements/address_element.dart';
import '../../elements/app_bar.dart';
import '../../elements/colors.dart';
import '../../elements/main_button.dart';
import '../cart/add_address.dart';

class AddressesListScreen extends StatefulWidget {
  const AddressesListScreen({super.key});

  @override
  State<AddressesListScreen> createState() => _AddressesListScreenState();
}

List sliderList = [];


class _AddressesListScreenState extends State<AddressesListScreen> {
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
            const BackTitleAppBar(title: "عنوان التوصيل"),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: ListView.separated(
                  separatorBuilder: (context, index) => Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 1,
                        color: Constants.secondaryColor().withOpacity(.3),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  //physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return userAddressListElement();
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddAddressScreen(),
                    ),
                  );
                },
                child: mainButton(
                  context,
                  "أضف عنوان جديد",
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
    final homeResponse = await userAddressList();
    debugPrint("address.body.toString()");
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
