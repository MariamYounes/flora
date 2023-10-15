import 'package:flora/elements/app_bar.dart';
import 'package:flora/elements/colors.dart';
import 'package:flora/elements/main_button.dart';
import 'package:flora/screens/cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:html/parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../elements/alert.dart';

class ProductDetails extends StatefulWidget {
  final Map productDetails;
  const ProductDetails({super.key, required this.productDetails});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int counter = 1;
  bool login = false;

  checkLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var log = pref.getBool("isLog") ?? false;
    setState(() {
      login = log;
    });
  }

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
        child: Column(
          children: [
             BackTitleAppBar(title:widget.productDetails['title']),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      Swiper(
                        itemBuilder: (context, index) {
                          return Image.network(
                            widget.productDetails['picslist'][index],
                            fit: BoxFit.cover,
                          );
                        },
                        itemCount: (widget.productDetails['picslist'] as List).length,
                        itemWidth: MediaQuery.of(context).size.width,
                        containerWidth: MediaQuery.of(context).size.width,
                        autoplay: false,
                        itemHeight: 200.0,
                        layout: SwiperLayout.TINDER,
                        axisDirection: AxisDirection.left,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              widget.productDetails['title'],
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Constants.secondaryColor(),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  "assets/images/share.png",
                                  width: 30,
                                  height: 30,
                                ),
                                Image.asset(
                                  "assets/images/cart-1.png",
                                  width: 30,
                                  height: 30,
                                ),
                                Image.asset(
                                  "assets/images/fav-1.png",
                                  width: 30,
                                  height: 30,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          Text(
                            widget.productDetails['price']+ " ريال ",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: Constants.primaryColor(),
                            ),
                          ),
                          Text(
                            "توصيل مجاني",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Constants.secondaryColor(),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          RatingBar(
                            initialRating: double.parse(widget.productDetails['rating'].toString()),
                            // initialRating: double.parse(
                            //     widget.shopDetails['rating'].toString()),
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            ignoreGestures: true,
                            itemCount: 5,
                            itemSize: 22,
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
                          const SizedBox(width: 5,),
                          Text(
                            widget.productDetails['rating'],
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Constants.secondaryColor(),
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          Text(
                            "عرض الكل",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: Constants.primaryColor(),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Text(
                        _parseHtmlString( widget.productDetails['content']??""),
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Constants.secondaryColor(),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          Expanded(child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "اللون",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: Constants.primaryColor(),
                                ),
                              ),
                              const SizedBox(height: 5,),
                              Container(
                                height: 52,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Constants.primaryColor(),
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ],
                          ),),
                          const Expanded(child: SizedBox()),
                          Expanded(child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "الكمية",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: Constants.primaryColor(),
                                ),
                              ),
                              const SizedBox(height: 5,),
                              Container(
                                height: 52,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Constants.primaryColor(),
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8),
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
                                          alignment: Alignment.center,
                                          child: Text(
                                            "-",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Constants.primaryColor(),
                                            ),
                                          ),
                                        ),
                                      ),),
                                      Expanded(child: Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "$counter",
                                          style:  TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Constants.secondaryColor(),
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
                                          alignment: Alignment.center,
                                          child: Text(
                                            "+",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Constants.primaryColor(),
                                            ),
                                          ),
                                        ),
                                      ),),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),),
                        ],
                      ),
                      const SizedBox(height: 30,),
                      InkWell(
                        onTap: (){
                          login != true?showError("يجب عليك تسجيل الدخول اولا"):  Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  const CartScreen(),
                            ),
                          );
                        },
                        child: mainButton(context, "شراء الأن"),
                      ),
                      const SizedBox(height: 30,),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString =
        parse(document.body!.text).documentElement!.text;

    return parsedString;
  }
}
