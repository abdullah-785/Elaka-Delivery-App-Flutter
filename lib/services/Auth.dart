import 'package:elaka_delivery_app/models/LoginModel.dart';
import 'package:elaka_delivery_app/models/userModel.dart';
import 'package:elaka_delivery_app/models/ordermodel.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'constants.dart';
import 'dart:convert' as convert;
import 'package:shared_preferences/shared_preferences.dart';

Future<LoginUser?> login(String email, String password) async {
  final _authority = "falconskintools.com";
  final _path = "/alaka/api/login";
  // final _params = {"email": email, "password": password};
  final _uri = Uri.https(_authority, _path);
  // var url = Uri.https(loginUrl);
  final http.Response response = await http.post(
    _uri,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{"email": email, "password": password}),
  );

  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    var status = jsonResponse['status'];

    if (status == "true") {
      LoginUser userRes = LoginUser.fromJson(json.decode(response.body));
      return userRes;
    }
    return null;
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    return null;
    throw Exception('Failed to signin');
  }
}

Future<LoginUser?> verifyOTPCall(String email, String otp) async {
  final _authority = baseURl;
  final _path = verifyOtp;
  //final _params = {"q": "dart"};
  final _uri = Uri.https(_authority, _path);
  // var url = Uri.https(loginUrl);
  final http.Response response = await http.post(
    _uri,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{"email": email, "otp": otp}),
  );

  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    var status = jsonResponse['status'];
    var message = jsonResponse['message'];

    if (status == "true") {
      LoginUser userRes = LoginUser.fromJson(json.decode(response.body));
      return userRes;
    }
    return null;
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    return null;
    throw Exception('Failed to signin');
  }
}

Future<LoginUser?> changePass(String email, String pass) async {
  final _authority = baseURl;
  final _path = changePAssword;
  //final _params = {"q": "dart"};
  final _uri = Uri.https(_authority, _path);
  // var url = Uri.https(loginUrl);
  final http.Response response = await http.post(
    _uri,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{"email": email, "password": pass}),
  );

  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    var status = jsonResponse['status'];

    if (status == "true") {
      LoginUser userRes = LoginUser.fromJson(json.decode(response.body));
      return userRes;
    }
    return null;
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    return null;
    throw Exception('Failed to signin');
  }
}

Future<LoginUser?> forgotPass(String email) async {
  final _authority = baseURl;
  final _path = forgotPassword;
  //final _params = {"q": "dart"};
  final _uri = Uri.https(_authority, _path);
  // var url = Uri.https(loginUrl);
  final http.Response response = await http.post(
    _uri,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{"email": email}),
  );

  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    var status = jsonResponse['status'];

    if (status == "true") {
      LoginUser userRes = LoginUser.fromJson(json.decode(response.body));
      return userRes;
    }
    return null;
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    return null;
    throw Exception('Failed to signin');
  }
}

Future<LoginUser?> getUserById(String userId) async {
  final _authority = baseURl;
  final _path = getUser + userId;

  final _uri = Uri.https(_authority, _path);

  final http.Response response = await http.get(
    _uri,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    // body: jsonEncode(<String, dynamic>{"email": email}),
  );

  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    var status = jsonResponse['status'];

    if (status == "true") {
      LoginUser userRes = LoginUser.fromJson(json.decode(response.body));
      return userRes;
    }
    return null;
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    return null;
    throw Exception('Failed to signin');
  }
}

Future<LoginUser?> updateProfile(
  String id,
  String fName,
  String lName,
  String email,
  String drlience,
  String vehNumber,
) async {
  final _authority = baseURl;
  final _path = updateProfileUrl;
  //final _params = {"q": "dart"};
  final _uri = Uri.https(_authority, _path);
  // var url = Uri.https(loginUrl);
  final http.Response response = await http.post(
    _uri,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      "id": id,
      "first_name": fName,
      "last_name": lName,
      "email": email,
      "driving_license": drlience,
      "vehical_number": vehNumber,
    }),
  );

  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    var status = jsonResponse['status'];

    if (status == "true") {
      LoginUser userRes = LoginUser.fromJson(json.decode(response.body));
      return userRes;
    }
    return null;
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    return null;
    throw Exception('Failed to signin');
  }
}

Future<Order?> getOrders(String userid) async {
  final _authority = "falconskintools.com";
  final _path = "/alaka/api/orders/deliveryboy";
  // final _params = {"email": email, "password": password};
  final _uri = Uri.https(_authority, _path);
  // var url = Uri.https(loginUrl);
  final http.Response response = await http.post(
    _uri,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{"delivery_id": userid}),
  );

  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    var status = jsonResponse['status'];

    if (status == "true") {
      Order userRes = Order.fromJson(json.decode(response.body));
      return userRes;
    }
    return null;
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    return null;
    throw Exception('Failed to signin');
  }
}

class SharedPrefUtils {
  static saveStr(String key, String message) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(key, message);
  }

  static saveInt(String key, int message) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt(key, message);
  }

  static readPrefStr(String key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(key);
  }

  static readPrefInt(String key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getInt(key);
  }
}
