import 'package:flutter/material.dart';

import 'colors.dart';

Widget ordersElement(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("9 سبتمبر 2023",style: TextStyle(
        fontSize: 14,
        
        color: Constants.secondaryColor().withOpacity(.5),
      ),),
      const SizedBox(height: 7,),
      Card(
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("طلب رقم 123456789",style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Constants.secondaryColor(),
              ),),
              const SizedBox(height: 7,),
              Row(
                children: [
                  Text("12 ريال",style: TextStyle(
                    fontSize: 16,
                    color: Constants.primaryColor(),
                  ),),
                  const Expanded(child: SizedBox()),
                  Container(
                    height: 30,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    alignment: Alignment.center,
                    child: const Text("مكتمل",style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),),
                  ),
                  const Expanded(
                      flex: 2,
                      child: SizedBox()),
                ],
              ),
            ],
          ),
        ),
      ),
    ],
  );
}