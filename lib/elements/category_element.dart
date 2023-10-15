import 'package:cached_network_image/cached_network_image.dart';
import 'package:flora/elements/colors.dart';
import 'package:flutter/material.dart';

Widget categoryElement(isEven,item){
  return Container(
    decoration: BoxDecoration(
      border:Border(
        bottom: BorderSide(
          color: Constants.secondaryColor().withOpacity(.5),
        ),
        left: BorderSide(
          color:isEven? Constants.secondaryColor().withOpacity(.5):Colors.transparent,
        ),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 12),
      child: Column(
        children: [
          Expanded(
            child:CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: item['pic'] ?? "",
              // color: Colors.black12,
              // colorBlendMode: BlendMode.softLight,
              placeholder: (context, url) => Image.asset(
                'assets/images/loading.gif',
                fit: BoxFit.fill,
                height: 150,
                width: MediaQuery.of(context).size.width,
              ),
              errorWidget: (context, url, error) => Image.asset(
                'assets/images/loading.gif',
                fit: BoxFit.fill,
                height: 150,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Text(
           item['title'],
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Constants.secondaryColor(),
            ),
          ),
        ],
      ),
    ),
  );
}