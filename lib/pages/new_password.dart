// import 'dart:html';

import 'package:badges/badges.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elaka_delivery_app/models/userModel.dart';
import 'package:elaka_delivery_app/pages/progress_bar.dart';
// import 'package:elaka_delivery_app/pages/circularProgress.dart';
import 'package:elaka_delivery_app/pages/login.dart';
import 'package:elaka_delivery_app/pages/notification_page.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:elaka_delivery_app/services/Auth.dart';
import 'package:elaka_delivery_app/models/LoginModel.dart';
import 'package:elaka_delivery_app/models/userModel.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:elaka_delivery_app/services/constants.dart';
import 'dart:convert' as convert;

import 'current_no_order.dart';

class NewPassword extends StatefulWidget {
  final String _email;
  NewPassword(this._email);

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  // FirebaseAuth _auth = FirebaseAuth.instance;
  // final currentUser = FirebaseAuth.instance.currentUser;
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  bool oldUser = false;
  bool isLoading = false;
  bool _obscureText = true;
  bool _obscureText2 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 247, 255),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 70,
              left: 16,
              right: 20,
            ),
            child: Row(
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_ios,
                        size: 28.0, color: Color.fromARGB(255, 23, 69, 103))),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  "Enter New Password?",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Badge(
                    badgeColor: const Color.fromARGB(255, 78, 206, 113),
                    animationType: BadgeAnimationType.slide,
                    badgeContent: const Padding(
                      padding: EdgeInsets.all(1.0),
                      child: Text(
                        "2",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const NotificationPage()));
                      },
                      child: const Icon(Icons.notifications,
                          size: 30, color: Color.fromARGB(255, 23, 69, 103)),
                    )),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width * 1,
              // height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 20,
                    blurRadius: 15,
                    offset: const Offset(0, 10), // changes position of shadow
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 90,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text("New Password",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: _newPasswordController,
                        obscureText: _obscureText,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 78, 206, 113))),
                          border: const OutlineInputBorder(),
                          prefixIcon: Container(
                            width: 50,
                            height: 50,
                            margin: const EdgeInsets.only(
                              top: 11,
                              bottom: 11,
                              right: 8,
                              left: 11,
                            ),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 78, 206, 113),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Icon(
                              Icons.lock,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Icon(
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: const Color.fromARGB(255, 78, 206, 113),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text("Confirm Password",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: _confirmPasswordController,
                        obscureText: _obscureText2,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 78, 206, 113))),
                          border: const OutlineInputBorder(),
                          prefixIcon: Container(
                            width: 50,
                            height: 50,
                            margin: const EdgeInsets.only(
                              top: 11,
                              bottom: 11,
                              right: 8,
                              left: 11,
                            ),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 78, 206, 113),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Icon(
                              Icons.lock,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureText2 = !_obscureText2;
                              });
                            },
                            child: Icon(
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: const Color.fromARGB(255, 78, 206, 113),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    (isLoading)
                        ? const SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(
                              color: Colors.green,
                              strokeWidth: 2,
                            ))
                        : SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 50,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary:
                                      const Color.fromARGB(255, 78, 206, 113),
                                  onPrimary: Colors.white,
                                ),
                                onPressed: () async {
                                  var pass = _newPasswordController.text;
                                  var conPass = _confirmPasswordController.text;
                                  if (pass == conPass) {
                                    setState(() {
                                      isLoading = true;
                                    });

                                    changePass(widget._email, pass)
                                        .then((value) => {apiCall(value)});
                                  }

                                  // await changePass(widget._email,
                                  //         _confirmPasswordController.text)
                                  //     .then((value) => {
                                  //           if (value!.status == "true")
                                  //             {
                                  //               // Fluttertoast.showToast(
                                  //               ///   msg: "Password Updated Successfully")

                                  //               Navigator.push(
                                  //                   context,
                                  //                   MaterialPageRoute(
                                  //                       builder: (context) =>
                                  //                           const ProgressBar()))
                                  //             }
                                  //         });

                                  // if (resp!.status == "true") {
                                  //   Fluttertoast.showToast(
                                  //       msg: "Password Updated Successfully");

                                  //   Navigator.push(
                                  //       context,
                                  //       MaterialPageRoute(
                                  //           builder: (context) =>
                                  //               const ProgressBar()));
                                  // }
                                },
                                child: const Text(
                                  "Submit",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void apiCall(LoginUser? user) async {
    setState(() {
      isLoading = false;
    });

    if (user?.status == "true") {
      //return userRes;
      var userid = user!.data!.id.toString();
      SharedPrefUtils.saveStr("userId", userid);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CurrentNoOrder(user!.data!.id.toString())));
    }
  }
}
