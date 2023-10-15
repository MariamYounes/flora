import 'package:flora/elements/colors.dart';
import 'package:flora/screens/more/conditions.dart';
import 'package:flora/screens/more/fqa.dart';
import 'package:flora/screens/more/privacy.dart';
import 'package:flutter/material.dart';

import '../../elements/app_bar.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool vibration = true;
  bool sound = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BackTitleAppBar(title: "الإعدادات"),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "الإشعارات",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Constants.secondaryColor(),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: [
                  Text(
                    "الصوت",
                    style: TextStyle(
                      fontSize: 16,
                      color: Constants.secondaryColor(),
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  Switch(
                      value: sound,
                      activeColor: Colors.white,
                      activeTrackColor: Constants.grad2Color(),
                      onChanged: (val) {
                        setState(() {
                          sound = val;
                        });
                      }),
                ],
              ),
            ),
            Container(
              height: 1,
              color: Constants.secondaryColor().withOpacity(.3),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: [
                  Text(
                    "الإهتزاز",
                    style: TextStyle(
                      fontSize: 16,
                      color: Constants.secondaryColor(),
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  Switch(
                      value: vibration,
                      activeColor: Colors.white,
                      activeTrackColor: Constants.grad2Color(),
                      onChanged: (val) {
                        setState(() {
                          vibration = val;
                        });
                      }),
                ],
              ),
            ),
            Container(
              height: 1,
              color: Constants.secondaryColor().withOpacity(.3),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FQAScreen(),
                  ),
                );
              },
              child: settingModel("الأسئلة الشائعة"),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ConditionsScreen(),
                  ),
                );
              },
              child: settingModel("شروط الاستخدام"),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PrivacyScreen(),
                  ),
                );
              },
              child: settingModel("الخصوصية"),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  settingModel(txt) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            txt,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Constants.secondaryColor(),
            ),
          ),
        ),
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
    );
  }
}
