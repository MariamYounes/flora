import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const String baseUrl = 'https://www.it4ds.com/FiftyRose.Com/api/';

Future<dynamic> phoneLogin(email,phone, pass) async {
  final bodyApi = {
    'email': email,
    'mobile': phone,
    'password': pass,
  };
  debugPrint(bodyApi.toString());
  http.Response response = await http.post(
    Uri.parse("${baseUrl}api.php/ar/login"),
    body: bodyApi,
  );
  return response;
}

Future<dynamic> createAccountMethod(name, email, phone, pass) async {
  final bodyApi = {
    'username': name,
    'email': email,
    'mobile': phone,
    'password': pass,
  };
  http.Response response = await http.post(
    Uri.parse("${baseUrl}api.php/ar/register"),
    body: bodyApi,
  );
  return response;
}

Future<dynamic> checkCode(phone, code) async {
  final bodyApi = {'mobile': phone, 'code': code};
  http.Response response = await http.post(
    Uri.parse("${baseUrl}api.php/ar/activation"),
    body: bodyApi,
  );
  return response;
}

Future<dynamic> resendCode(phone) async {
  http.Response response = await http.post(
    Uri.parse("${baseUrl}resend-phone-verification-code?phone=$phone"),
  );
  return response;
}

Future<dynamic> forgetPassMethod(email) async {
  final bodyApi = {
    'email': email,
  };
  http.Response response = await http.post(
    Uri.parse("${baseUrl}api.php/ar/lostpwd"),
    body: bodyApi,
  );
  return response;
}

Future<dynamic> sendFcmToken() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  String? tokenValue = pref.getString("token");
  String? fcmTokenValue = pref.getString("fcmTokenValue");
  final queryParameters = {
    'Authorization': 'Bearer ${tokenValue!}',
    //'Content-Type': 'application/json',
  };
  debugPrint("the fcm work start");
  debugPrint(fcmTokenValue);
  final bodyApi = {
    'token': fcmTokenValue,
  };
  http.Response response = await http.post(
    Uri.parse("${baseUrl}donor/fcm-token"),
    body: bodyApi,
    headers: queryParameters,
  );
  return response;
}

Future<dynamic> getSliderItems() async {
  http.Response response = await http.post(
    Uri.parse("${baseUrl}api.php/ar/slider"),
  );
  return response;
}

Future<dynamic> userProfileData() async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  String? userId = preferences.getString("userId");
  final bodyApi = {
    'userid': userId,
  };
  http.Response response = await http.post(
    Uri.parse("${baseUrl}api.php/ar/profile"),
    body: bodyApi,
  );
  return response;
}

Future<dynamic> getSectionsItems() async {
  final bodyApi = {
    'module': "products",
  };
  http.Response response = await http.post(
    Uri.parse("${baseUrl}api.php/ar/sections"),
    body: bodyApi,
  );
  return response;
}

Future<dynamic> getBestSelling() async {
  final bodyApi = {
    'module': "products",
    'hits': "1",
  };
  http.Response response = await http.post(
    Uri.parse("${baseUrl}api.php/ar/getData"),
    body: bodyApi,
  );
  return response;
}

Future<dynamic> getSuggestList() async {
  final bodyApi = {
    'module': "products",
    //'did': "1",
  };
  http.Response response = await http.post(
    Uri.parse("${baseUrl}api.php/ar/getData"),
    body: bodyApi,
  );
  return response;
}

Future<dynamic> getServicesOfSectionList(id) async {
  final bodyApi = {
    'module': "products",
    'did': id,
  };
  http.Response response = await http.post(
    Uri.parse("${baseUrl}api.php/ar/getData"),
    body: bodyApi,
  );
  return response;
}

Future<dynamic> getOffersList() async {
  final bodyApi = {
    'module': "products",
    'fixed': "1",
  };
  http.Response response = await http.post(
    Uri.parse("${baseUrl}api.php/ar/getData"),
    body: bodyApi,
  );
  return response;
}



Future<dynamic> getPageDetails(id) async {
  final bodyApi = {
    'pageid': id,
  };
  http.Response response = await http.post(
    Uri.parse("${baseUrl}api.php/ar/viewpage"),
    body: bodyApi,
  );
  return response;
}

Future<dynamic> getQuestionsPage() async {

  http.Response response = await http.post(
    Uri.parse("${baseUrl}api.php/ar/faqs"),
  );
  return response;
}

Future<dynamic> updateProfileDataMethod(name, email, phone, pass) async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  String? userId = preferences.getString("userId");
  final bodyApi = {
    'userid': userId,
    'username': name,
    'email': email,
    'mobile': phone,
  };
  http.Response response = await http.post(
    Uri.parse("${baseUrl}api.php/ar/editEmail"),
    body: bodyApi,
  );
  return response;
}

Future<dynamic> userFavList() async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  String? userId = preferences.getString("userId");
  final bodyApi = {
    'userid': userId,
  };
  http.Response response = await http.post(
    Uri.parse("${baseUrl}api.php/ar/myFavourites"),
    body: bodyApi,
  );
  return response;
}

Future<dynamic> userAddToFavList(id) async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  String? userId = preferences.getString("userId");
  final bodyApi = {
    'userid': userId,
    'langid': userId,
  };
  http.Response response = await http.post(
    Uri.parse("${baseUrl}api.php/ar/add2Favourite"),
    body: bodyApi,
  );
  return response;
}

Future<dynamic> userRemoveFromFavList(id) async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  String? userId = preferences.getString("userId");
  final bodyApi = {
    'userid': userId,
    'langid': userId,
  };
  http.Response response = await http.post(
    Uri.parse("${baseUrl}api.php/ar/removeFromFavourite"),
    body: bodyApi,
  );
  return response;
}

Future<dynamic> getViewItemDetails(id) async {
  final bodyApi = {
    'module': "products",
    'langid': id,
  };
  http.Response response = await http.post(
    Uri.parse("${baseUrl}api.php/ar/view"),
    body: bodyApi,
  );
  return response;
}

Future<dynamic> userAddressList() async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  String? userId = preferences.getString("userId");
  final bodyApi = {
    'userid': userId,
  };
  http.Response response = await http.post(
    Uri.parse("${baseUrl}api.php/ar/myAddress"),
    body: bodyApi,
  );
  return response;
}