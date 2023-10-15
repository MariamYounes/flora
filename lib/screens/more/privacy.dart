import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import '../../api/api_service.dart';
import '../../elements/app_bar.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  String? content;
  @override
  void initState() {
    getPages();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                const BackTitleAppBar(title: "الخصوصية"),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
                  child: content == null || content!.isEmpty
                      ? Center(
                    child: Container(
                      height: 117,
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(
                        valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.pink),
                      ),
                    ),
                  )
                      : Text(_parseHtmlString(content!),),
                ),
              ],
            ),
          )),
    );
  }

  Future getPages() async {
    final homeResponse = await getPageDetails("2");
    debugPrint("response.body.toString()");
    debugPrint(homeResponse.body.toString());
    var res = json.decode(homeResponse.body);
    setState(() {
      content = res['content'];
    });
  }

  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString =
        parse(document.body!.text).documentElement!.text;

    return parsedString;
  }
}
