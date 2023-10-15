import 'package:flora/elements/colors.dart';
import 'package:flutter/material.dart';

import '../../elements/app_bar.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const BackTitleAppBar(title: "الإشعارات"),
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
                        height: 15,
                      ),
                      Container(
                        height: 1,
                        color: Constants.secondaryColor().withOpacity(.2),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                  //physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Constants.primaryColor(),
                          ),
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/images/local_offer-2.png",
                            height: 24,
                            width: 24,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            "ﻫﺬااﻟﻨﺺ ﻫﻮ ﻣﺜﺎل ﻟﻨﺺ ﻳﻤﻜﻦ  اﻟﻤﺴﺎﺣﺔ ﻫﺬااﻟﻨﺺ ﻫﻮ ﻣﺜﺎل ﻟﻨﺺ ﻳﻤﻜﻦ  اﻟﻤﺴﺎﺣﺔ",
                            style: TextStyle(
                              color: Constants.secondaryColor(),
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "15/10",
                          style: TextStyle(
                            color: Constants.secondaryColor().withOpacity(.4),
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    );
                  },
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
}
