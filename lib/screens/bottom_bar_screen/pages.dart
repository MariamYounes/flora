import 'package:animations/animations.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flora/elements/colors.dart';
import 'package:flora/screens/cart/cart.dart';
import 'package:flora/screens/categories/categories.dart';
import 'package:flora/screens/home/home.dart';
import 'package:flora/screens/more/more.dart';
import 'package:flora/screens/offers/offers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../Localization/localization_constants.dart';
import '../../elements/alert.dart';
import '../../models/route_argument.dart';

// ignore: must_be_immutable
class PagesTestWidget extends StatefulWidget {
  dynamic currentTab;
  dynamic currentBackPressTime;
  dynamic routeArgument;
  dynamic currentPage = const HomeScreen();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  PagesTestWidget({
    super.key,
    this.currentTab,
  }) {
    if (currentTab != null) {
      if (currentTab is RouteArgument) {
        routeArgument = currentTab;
        currentTab = int.parse(currentTab.id);
      }
    } else {
      currentTab = 0;
    }
  }
  @override
  State<PagesTestWidget> createState() => _PagesTestWidgetState();
}

Map profile = {};

class _PagesTestWidgetState extends State<PagesTestWidget>
    with TickerProviderStateMixin {
  bool login = false;
  String name = "";

  //int _page = 0;
  //GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  initState() {
    super.initState();
    _selectTab(widget.currentTab);
  }

  @override
  void didUpdateWidget(PagesTestWidget oldWidget) {
    _selectTab(oldWidget.currentTab);
    super.didUpdateWidget(oldWidget);
  }

  void _selectTab(int tabItem) {
    setState(() {
      widget.currentTab = tabItem; // == 3 ? 1 : tabItem;
      switch (tabItem) {
        case 0:
          widget.currentPage = const HomeScreen();
          break;
        case 1:
          widget.currentPage = const CategoriesScreen();
          break;
        case 2:
          widget.currentPage = const CartScreen();
          break;
        case 3:
          widget.currentPage = const OffersScreen();
          break;
        case 4:
          widget.currentPage = const MoreScreen();
          break;
      }
    });
  }

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
          extendBody: true,
          body: PageTransitionSwitcher(
            duration: const Duration(milliseconds: 800),
            transitionBuilder: (
              Widget child,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) {
              return FadeThroughTransition(
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                child: child,
              );
            },
            child: widget.currentPage,
          ),
          bottomNavigationBar: ConvexAppBar(
            backgroundColor: Colors.white,
            color: Constants.primaryColor(),
            activeColor: Constants.primaryColor(),
            style: TabStyle.fixedCircle,
            curveSize: 120,
            height: 70,
            top: -30,
            items: [
              TabItem(
                icon: Image.asset(
                  "assets/images/home-1.png",
                  color: index == 0
                      ? Constants.primaryColor()
                      : Constants.secondaryColor(),
                ),
                title: '',
              ),
              TabItem(
                icon: Image.asset(
                  "assets/images/apps-2.png",
                  color: index == 1
                      ? Constants.primaryColor()
                      : Constants.secondaryColor(),
                ),
                title: '',
              ),
              TabItem(
                icon: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Image.asset(
                    "assets/images/cart-1.png",
                    color: Colors.white,
                  ),
                ),
                title: '',
              ),
              TabItem(
                icon: Image.asset(
                  "assets/images/local_offer-2.png",
                  color: index == 3
                      ? Constants.primaryColor()
                      : Constants.secondaryColor(),
                ),
                title: '',
              ),
              TabItem(
                icon: Icon(
                  Icons.menu,
                  color: index == 4
                      ? Constants.primaryColor()
                      : Constants.secondaryColor(),
                ),
                title: '',
              ),
            ],
            onTap: (int i) {
              _selectTab(i);
              setState(() {
                index = i;
              });
            },
          )),
    );
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (widget.currentBackPressTime == null ||
        now.difference(widget.currentBackPressTime) >
            const Duration(seconds: 2)) {
      widget.currentBackPressTime = now;
      showSuccess(
        getTranslated(context, 'press')!,
      );
      return Future.value(false);
    }
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    return Future.value(true);
  }
}
