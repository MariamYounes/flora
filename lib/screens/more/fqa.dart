import 'dart:convert';

import 'package:flora/api/api_service.dart';
import 'package:flora/elements/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../elements/app_bar.dart';

class FQAScreen extends StatefulWidget {
  const FQAScreen({super.key});

  @override
  State<FQAScreen> createState() => _FQAScreenState();
}

List sliderList = [];

class _FQAScreenState extends State<FQAScreen> {
  bool sliderLoading = false;
  bool login = false;

  checkLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var log = pref.getBool("isLog") ?? false;
    setState(() {
      login = log;
    });
    if(login==true){
      getSlider();
    }
  }

  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const BackTitleAppBar(title: "الأسئلة الشائعة"),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child:login !=true? const Center(
                child: Text(
                  "يجب عليك تسجيل الدخول اولا",
                  // textDirection: TextDirection.ltr,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ):  sliderLoading
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
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  //physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: sliderList.length,
                  itemBuilder: (context, index) {
                    return ExpansionTile(
                      //  leading: Icon(Icons.arrow_forward_ios,color: Constants.primaryColor(),),
                      title: Text(
                        sliderList[index]['title'],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Constants.primaryColor(),
                        ),
                      ),
                      children: [
                        Text(
                    sliderList[index]['content'],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Constants.secondaryColor(),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ): const Center(
                child: Text(
                  "لا يوجد أسئلة حالية",
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
    final homeResponse = await getQuestionsPage();
    debugPrint("fqa.body.toString()");
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
