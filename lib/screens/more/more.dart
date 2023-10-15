import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flora/api/api_service.dart';
import 'package:flora/elements/colors.dart';
import 'package:flora/screens/more/address_list.dart';
import 'package:flora/screens/more/fav.dart';
import 'package:flora/screens/more/info.dart';
import 'package:flora/screens/more/notification.dart';
import 'package:flora/screens/more/orders.dart';
import 'package:flora/screens/more/setting.dart';
import 'package:flora/screens/profile/profile_data.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../auth/login.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

Map? profile;

class _MoreScreenState extends State<MoreScreen> {
  bool login = false;

  checkLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var log = pref.getBool("isLog") ?? false;
    setState(() {
      login = log;
    });
    if(login==true){
      getProfile();
    }
  }

  String name ="";
  String phone ="";
  String pic ="";

  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                login != true
                    ? Row(
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Constants.secondaryColor().withOpacity(.4),
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              "assets/images/profile.png",
                              color: Colors.white,
                              height: 40,
                              width: 40,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "تسجيل الدخول",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Constants.primaryColor(),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: const BoxDecoration(

                              shape: BoxShape.circle,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(300.0),
                              child: CachedNetworkImage(
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                                imageUrl: pic,
                                // color: Colors.black12,
                                // colorBlendMode: BlendMode.softLight,
                                placeholder: (context, url) => Image.asset(
                                  'assets/images/loading.gif',
                                  fit: BoxFit.fill,
                                  height: 100,
                                  width: 100,
                                ),
                                errorWidget: (context, url, error) => Image.asset(
                                  'assets/images/loading.gif',
                                  fit: BoxFit.fill,
                                  height: 100,
                                  width: 100,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Constants.secondaryColor(),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                               phone,
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Constants.secondaryColor(),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                const SizedBox(
                  height: 35,
                ),
                login != true
                    ? Container()
                    : InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  MyProfileData(
                                profile: profile!,
                              ),
                            ),
                          );
                        },
                        child: profileModel(Icons.person_outlined, "حسابي"),
                      ),
                login != true
                    ? Container()
                    : InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OrdersScreen(),
                            ),
                          );
                        },
                        child: profileModel(
                            Icons.access_time_outlined, "سجل الطلبات"),
                      ),
                login != true
                    ? Container()
                    : InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NotificationScreen(),
                            ),
                          );
                        },
                        child: profileModel(
                            Icons.notifications_outlined, "الإشعارات"),
                      ),
                login != true
                    ? Container()
                    : InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FavScreen(),
                            ),
                          );
                        },
                        child: profileModel(
                            Icons.favorite_border_outlined, "المفضلة"),
                      ),
                login != true
                    ? Container()
                    : InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddressesListScreen(),
                            ),
                          );
                        },
                        child: profileModel(
                            Icons.location_on_outlined, "عناوين توصيل"),
                      ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingScreen(),
                      ),
                    );
                  },
                  child: profileModel(Icons.settings_outlined, "الإعدادات"),
                ),
                InkWell(
                  onTap: () {},
                  child: profileModel(Icons.whatshot_outlined, "تواصل واتساب"),
                ),
                InkWell(
                  onTap: () {},
                  child: profileModel(Icons.star_border_outlined, "تقييم"),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const InfoScreen(),
                      ),
                    );
                  },
                  child: profileModel(Icons.info_outline, "حول"),
                ),
                InkWell(
                  onTap: () {
                    if (login != true) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    } else {
                      logout();
                    }
                  },
                  child: profileModel(
                      login != true
                          ? Icons.login_outlined
                          : Icons.logout_outlined,
                      login != true ? "تسجيل الدخول" : "تسجيل الخروج"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  profileModel(icon, txt) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: Constants.secondaryColor(),
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              txt,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Constants.secondaryColor(),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  logout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.clear().then((value) {
      Navigator.pushNamedAndRemoveUntil(
          context, "/Splash", (Route<dynamic> route) => false);
    });
  }

  dynamic getProfile() async {
    final response = await userProfileData();
    var res = json.decode(response.body);

    setState(() {
      profile = res;
      name = res['username'];
      phone = res['mobile'];
      pic = res['pic'];
    });
  }
}
