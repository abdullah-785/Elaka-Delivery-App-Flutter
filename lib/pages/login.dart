import 'dart:developer';

import 'package:elaka_delivery_app/models/LoginModel.dart';
import 'package:elaka_delivery_app/pages/progress_bar.dart';
import 'package:elaka_delivery_app/pages/opt_verification.dart';
import 'package:elaka_delivery_app/pages/reset_password.dart';
import 'package:elaka_delivery_app/pages/wallet.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:elaka_delivery_app/widgets/opt.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:email_auth/email_auth.dart';
import '/services/Auth.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isLoading = false;

  //final _auth = FirebaseAuth.instance;

  // getPrefranceData() async{
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   String? sharedPreferencesEmail = sharedPreferences.getString("email");
  //   return sharedPreferencesEmail;
  // }

  // setPrefranceData() async{
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   pref.setString("email", "AlreadyLogedIn");
  //   // print( _emailController.text);

  // }

  // checkPrefranceData(){
  //   setState(() {
  //   getPrefranceData() != null ? ProgressBar(): Login();
  //   });

  // }

  // @override
  // void initState() {
  //   super.initState();
  //   checkPrefranceData();

  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 247, 255),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                const HeightBox(85),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      // height: 30,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(150),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                blurRadius: 35,
                                spreadRadius: 30,
                                offset: const Offset(3, 3))
                          ]),
                      child: const Image(
                        image: AssetImage("images/logo.png"),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
            // height: 30,
            width: MediaQuery.of(context).size.width * 1,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
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
                  (isLoading)
                      ? const SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            color: Colors.green,
                            strokeWidth: 2,
                          ))
                      : const SizedBox(
                          height: 40,
                        ),
                  // const Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 16),
                  //   child: Align(
                  //     alignment: Alignment.topLeft,
                  //     child: Text("Email",
                  //         style: TextStyle(
                  //           fontSize: 18,
                  //           fontWeight: FontWeight.bold,
                  //         )),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                            label: const Text(
                              "Email",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            hintText: "Enter Email",
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
                                Icons.email,
                                color: Colors.white,
                                size: 30,
                              ),
                            ))),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // const Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 16),
                  //   child: Align(
                  //     alignment: Alignment.topLeft,
                  //     child: Text("Password",
                  //         style: TextStyle(
                  //           fontSize: 18,
                  //           fontWeight: FontWeight.bold,
                  //         )),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                        controller: _passwordController,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                        obscureText: _obscureText,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            label: const Text(
                              "Passsword",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            hintText: "Enter Password",
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
                            ))),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResetPassword()));
                    },
                    child: const Text("Forget Password?",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 78, 206, 113),
                            fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(
                    height: 28,
                  ),

                  // TextFormField(
                  //   // controller: _optController,
                  // ),
                  // ElevatedButton(onPressed: (){
                  //   // verify();
                  // }, child: Text("verify")),

                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 78, 206, 113),
                          onPrimary: Colors.white,
                        ),
                        onPressed: () async {
                          callAPi();

                          // _auth
                          //     .signInWithEmailAndPassword(
                          //         email: _emailController.text,
                          //         password: _passwordController.text)
                          //     .then((uid) => {
                          //           // Fluttertoast.showToast(
                          //           //     msg: ""),
                          //           //  setPrefranceData(),
                          //           Navigator.push(
                          //               context,
                          //               MaterialPageRoute(
                          //                   builder: (context) =>
                          //                       const OptVerification())),
                          //         })
                          //     .catchError((e) {
                          //   Fluttertoast.showToast(msg: e!.message);
                          // });

                          // final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                          // sharedPreferences.setString("email", _emailController.text);
                          // Navigator.push(
                          //               context,
                          //               MaterialPageRoute(
                          //                   builder: (context) =>
                          //                       Wallet()));
                        },
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        )),
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }

  void callAPi() async {
    setState(() {
      isLoading = true;
    });
    var res = await login(_emailController.text, _passwordController.text)
        .then((resp) => {
              //    print(resp)

              handleResp(resp)
            });
  }

  void handleResp(LoginUser? user) {
    setState(() {
      isLoading = false;
    });

    if (user?.status == "true") {
      Fluttertoast.showToast(msg: user?.message ?? "");
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OptVerification(_emailController.text)));
    } else {
      Fluttertoast.showToast(msg: user?.message ?? "");
    }
  }
}
