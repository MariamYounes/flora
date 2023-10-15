import 'package:flora/elements/colors.dart';
import 'package:flutter/material.dart';

import '../../elements/app_bar.dart';
import '../../elements/cart_element.dart';
import '../../elements/main_button.dart';
import '../bottom_bar_screen/pages.dart';

class ConfirmOrderScreen extends StatefulWidget {
  const ConfirmOrderScreen({super.key});

  @override
  State<ConfirmOrderScreen> createState() => _ConfirmOrderScreenState();
}

class _ConfirmOrderScreenState extends State<ConfirmOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BackTitleAppBar(title: "تأكيد الطلب"),
          const SizedBox(height: 20,),
          const CartElement(),
          const CartElement(),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text("عنوان التوصيل",style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Constants.primaryColor(),
            ),),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: [
                Expanded(
                  child: Text("ﻟﻤﻤﻠﻜﺔ اﻟﻌﺮﺑﻴﺔ اﻟﺴﻌﻮدﻳﺔ - اﻟﺮﻳﺎض - ﺷﺎرع اﻟﻄﺎﺑﻖ ١٢  اﻟﻤﻠﻚ ﻓﻬﺪ  ﻋﻤﺎرة اﻟﺪﻻل ﺷﻘﺔ رﻗﻢ اﻟﺜﺎﻧﻲ",style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Constants.secondaryColor(),
                  ),),
                ),
                const SizedBox(width: 10,),
                Column(
                  children: [
                    Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Constants.primaryColor(),
                      ),
                      alignment: Alignment.center,
                      child: const Icon(Icons.check,color: Colors.white,),
                    ),
                    const SizedBox(width: 10,),
                    Text("تغيير",style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Constants.primaryColor(),
                    ),),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            height: 1,
            color: Constants.lightGreyColor().withOpacity(.7),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text("الدفع",style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Constants.primaryColor(),
            ),),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: [
                Expanded(
                  child: Text("سوف يتم الدفع كاش",style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Constants.secondaryColor(),
                  ),),
                ),
                const SizedBox(width: 10,),
                Column(
                  children: [
                    Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Constants.primaryColor(),
                      ),
                      alignment: Alignment.center,
                      child: const Icon(Icons.check,color: Colors.white,),
                    ),
                    const SizedBox(width: 10,),
                    Text("تغيير",style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Constants.primaryColor(),
                    ),),
                  ],
                ),
              ],
            ),
          ),
          const Expanded(child:  SizedBox(width: 10,)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>   PagesTestWidget(
                        currentTab: 0,
                      ),
                    ),
                  );
                },
                child: mainButton(context, "استمر"),),
          ),
          const SizedBox(height: 20,),
        ],
      ),
    );
  }
}
