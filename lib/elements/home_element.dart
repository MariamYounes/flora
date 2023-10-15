import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'colors.dart';

Widget productForListView(item) {
  return Container(
    height: 260,
    width: 180,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Constants.lightGreyColor().withOpacity(.5),
        )),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration:  BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(item['pic']),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 12.0, left: 16),
              child: Image.asset(
                "assets/images/fav-1.png",
                height: 26,
                width: 26,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            item['title'],
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Constants.secondaryColor(),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Text(
                item['price']+" ريال",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Constants.primaryColor(),
                ),
              ),
              const Expanded(child: SizedBox()),
              RatingBar(
                initialRating:double.parse(item['rating'].toString()),
                // initialRating: double.parse(
                //     widget.shopDetails['rating'].toString()),
                direction: Axis.horizontal,
                allowHalfRating: true,
                ignoreGestures: true,
                itemCount: 5,
                itemSize: 14,
                ratingWidget: RatingWidget(
                  full: const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  half: const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  empty: const Icon(
                    Icons.star_border,
                    color: Colors.yellow,
                  ),
                ),
                //itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                onRatingUpdate: (rating) {},
                updateOnDrag: false,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    ),
  );
}

Widget productForOfferListView() {
  return Container(
    height: 260,
    width: 180,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Constants.lightGreyColor().withOpacity(.5),
        )),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Product image.png"),
              ),
            ),
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 12.0,
              ),
              child: Container(
                height: 20,
                width: 50,
                decoration: BoxDecoration(
                    color: Constants.primaryColor(),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(6),
                      bottomLeft: Radius.circular(6),
                    )),
                alignment: Alignment.center,
                child: const Text(
                  "20%off",
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "حلم وردي",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Constants.secondaryColor(),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            children: [
              Text(
                "1200",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Constants.primaryColor(),
                ),
              ),
              const SizedBox(
                width: 3,
              ),
              Text(
                "1500",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.lineThrough,
                  color: Constants.secondaryColor(),
                ),
              ),
              const Expanded(child: SizedBox()),
              RatingBar(
                initialRating: 5.0,
                // initialRating: double.parse(
                //     widget.shopDetails['rating'].toString()),
                direction: Axis.horizontal,
                allowHalfRating: true,
                ignoreGestures: true,
                itemCount: 5,
                itemSize: 12,
                ratingWidget: RatingWidget(
                  full: const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  half: const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  empty: const Icon(
                    Icons.star_border,
                    color: Colors.yellow,
                  ),
                ),
                //itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                onRatingUpdate: (rating) {},
                updateOnDrag: false,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    ),
  );
}

Widget productForFavListView() {
  return Container(
    height: 260,
    width: 180,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Constants.lightGreyColor().withOpacity(.5),
        )),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Product image.png"),
              ),
            ),
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 12.0,
              ),
              child: Container(
                height: 20,
                width: 50,
                decoration: BoxDecoration(
                    color: Constants.primaryColor(),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(6),
                      bottomLeft: Radius.circular(6),
                    )),
                alignment: Alignment.center,
                child: const Text(
                  "20%off",
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "حلم وردي",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Constants.secondaryColor(),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            children: [
              Text(
                "1200",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Constants.primaryColor(),
                ),
              ),
              const SizedBox(
                width: 3,
              ),
              Text(
                "1500",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.lineThrough,
                  color: Constants.secondaryColor(),
                ),
              ),
              const SizedBox(width: 15,),
              Expanded(child: Row(
                children: [
                  Image.asset("assets/images/fav-2.png",height: 24,width: 24,),
                  const Expanded(child: SizedBox()),
                  Image.asset("assets/images/cart-1.png",height: 24,width: 24,color: Constants.secondaryColor().withOpacity(.5),),
                  const Expanded(child: SizedBox()),
                ],
              )),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    ),
  );
}
