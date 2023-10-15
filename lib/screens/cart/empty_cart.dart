import 'package:flora/elements/colors.dart';
import 'package:flora/elements/main_button.dart';
import 'package:flutter/material.dart';

import '../bottom_bar_screen/pages.dart';

class EmptyCartScreen extends StatelessWidget {
  const EmptyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("عربة التسوق فارغة!",style: TextStyle(
            color: Constants.primaryColor(),
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),),
          const SizedBox(height: 10,),
          Text(" ﻳﺴﺘﺒﺪل  ﻫﺬا اﻟﻨﺺ ﻫﻮ ﻣﺜﺎل ﻟﻨﺺ ﻳﻤﻜﻦأن  اﻟﻤﺴﺎﺣﺔ ﻳﺴﺘﺒﺪل  ﻫﺬااﻟﻨﺺ ﻫﻮ ﻣﺜﺎل ﻟﻨﺺ ﻳﻤﻜﻦ أن  اﻟﻤﺴﺎﺣﺔ  ﻳﺴﺘﺒﺪل  ﻫﺬااﻟﻨﺺ ﻫﻮ ﻣﺜﺎل ﻟﻨﺺ ﻳﻤﻜﻦأن  اﻟﻤﺴﺎﺣﺔ",style: TextStyle(
              color: Constants.secondaryColor(),
              fontWeight: FontWeight.normal,
              fontSize: 16
          ),),
          const SizedBox(height: 30,),
          InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  PagesTestWidget(
                      currentTab: 0,
                    ),
                  ),
                );
              },
              child: mainButton(context, "أستمر في التسوق")),
        ],
      ),
    );
  }
}
