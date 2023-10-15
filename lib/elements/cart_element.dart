import 'package:flutter/material.dart';

import 'colors.dart';

class CartElement extends StatefulWidget {
  const CartElement({super.key});

  @override
  State<CartElement> createState() => _CartElementState();
}

class _CartElementState extends State<CartElement> {
  int counter = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 12),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 90,
            child: Row(
              children: [
                Image.asset(
                  "assets/images/Rectangle -1.png",
                  height: 80,
                  width: 80,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            "ورد جوري أحمر",
                            style: TextStyle(
                              color: Constants.secondaryColor(),
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          Icon(
                            Icons.delete_outline_outlined,
                            color: Constants.secondaryColor().withOpacity(.7),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          Text(
                            "12 ريال",
                            style: TextStyle(
                              color: Constants.primaryColor(),
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Constants.primaryColor(),
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              children: [
                                Expanded(child: InkWell(
                                  onTap: (){
                                    if(counter>1) {
                                      setState(() {
                                      counter--;
                                    });
                                    }
                                  },
                                  child: Container(
                                    height: 30,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "-",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Constants.primaryColor(),
                                      ),
                                    ),
                                  ),
                                ),),
                                Expanded(child: Container(
                                  height: 30,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Constants.primaryColor().withOpacity(.5),
                                    border: Border(
                                      left: BorderSide(
                                        color: Constants.primaryColor(),
                                      ),
                                      right:  BorderSide(
                                        color: Constants.primaryColor(),
                                      ),
                                    )
                                  ),
                                  child: Text(
                                    "$counter",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),),
                                Expanded(child: InkWell(
                                  onTap: (){
                                    setState(() {
                                      counter++;
                                    });
                                  },
                                  child: Container(
                                    height: 30,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "+",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Constants.primaryColor(),
                                      ),
                                    ),
                                  ),
                                ),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 1,
          color: Constants.lightGreyColor().withOpacity(.7),
        ),
      ],
    );
  }
}

Widget addressListElement(){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 10),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Constants.secondaryColor().withOpacity(.6),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("محمد علي",style: TextStyle(
                  fontSize: 16,
                  color: Constants.secondaryColor(),
                ),),
                const Expanded(child:  SizedBox()),
                Image.asset("assets/images/edit.png",height: 30,width: 30,),
              ],
            ),
            const SizedBox(height: 10,),
            Text("العنوان العنوان العنوان العنوان العنوان ",style: TextStyle(
              fontSize: 16,
              color: Constants.secondaryColor(),
            ),),
            const SizedBox(height: 10,),
            Text("+201236547890",style: TextStyle(
              fontSize: 16,
              color: Constants.secondaryColor(),
            ),),
            const SizedBox(height: 10,),
            Text("الكود 1140 ",style: TextStyle(
              fontSize: 16,
              color: Constants.secondaryColor(),
            ),),
          ],
        ),
      ),
    ),
  );
}
