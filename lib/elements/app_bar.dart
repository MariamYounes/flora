import 'package:flora/elements/colors.dart';
import 'package:flora/screens/home/search.dart';
import 'package:flutter/material.dart';

class BackAppBar extends StatelessWidget {
  const BackAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: const Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
        size: 30,
      ),
    );
  }
}

class BackTitleAppBar extends StatelessWidget {
  final String title;
  const BackTitleAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      color: Constants.primaryColor(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            const Expanded(child: SizedBox()),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Expanded(child: SizedBox()),
            const Icon(
              Icons.arrow_back_ios,
              color: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.bottomCenter,
      color: Constants.primaryColor(),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: InkWell(
          onTap: (){
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) =>  const SearchScreen(),
            //   ),
            // );
          },
          child: Container(
            height: 52,
            width: MediaQuery.of(context).size.width * .9,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "عما تبحث ؟",
                style: TextStyle(color: Constants.secondaryColor(),
                fontWeight: FontWeight.normal,
                  fontSize: 17,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TitleAppBar extends StatelessWidget {
  final String title;
  const TitleAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      color: Constants.primaryColor(),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
