import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elaka_delivery_app/models/userModel.dart';
import 'package:elaka_delivery_app/pages/circularProgress.dart';
import 'package:elaka_delivery_app/pages/new_password.dart';
import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:elaka_delivery_app/widgets/opt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pinput/pinput.dart';
// import 'package:velocity_x/velocity_x.dart';

class OptVerification extends StatefulWidget {
  const OptVerification({Key? key}) : super(key: key);

  @override
  State<OptVerification> createState() => _OptVerificationState();
}

class _OptVerificationState extends State<OptVerification> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());

      // OptVerification();
      setState(() {});
    });
  }

  late EmailAuth emailAuth;
  bool submitValid = false;
  final TextEditingController _optController = TextEditingController();

  void sendOtp() async {
    emailAuth = new EmailAuth(
      sessionName: "Ealaka App",
    );
    bool result = (await emailAuth.sendOtp(
        recipientMail: "${loggedInUser.email}", otpLength: 4));

    if (result) {
      setState(() {
        submitValid = true;
      });
    }
  }

  void verify() {
    bool result = emailAuth.validateOtp(
        recipientMail: "${loggedInUser.email}", userOtp: _optController.text);

    if (result == false) {
      Fluttertoast.showToast(msg: "OTP incorrect");
      // Navigator.push(context, MaterialPageRoute(builder: (context) => const OptVerification()));
    } else if (result == true && loggedInUser.oldUser == true) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ProgressBar()));
      Fluttertoast.showToast(msg: "Login Successfully");
    } else if (result == true && loggedInUser.oldUser == false) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const NewPassword()));
    }
  }

//  @override
//   void initState() {
//     super.initState();
//     // Initialize the package
//     emailAuth = new EmailAuth(
//       sessionName: "Ealaka App",
//     );

//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 247, 255),
      body: Column(
        children: [
          const Expanded(child: Image(image: AssetImage("images/opt.png"))),
          Expanded(
              child: Container(
            height: 30,
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
                  const SizedBox(
                    height: 10,
                  ),
                  // Text("${loggedInUser.phoneNumber}"),
                  const Text(
                    "Enter OTP Code",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      textAlign: TextAlign.center,
                      "Ealaka needs a verify your identity to reset your password, OTP code sent to you through SMS please enter OTP code below and reset password.",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 32),
                  //   child: TextFormField(
                  //         controller: _optController,

                  //       ),
                  // ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                        controller: _optController,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                            label: const Text(
                              "OTP",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            hintText: "Enter OTP",
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 78, 206, 113))),
                            border: const OutlineInputBorder(),
                            prefixIcon: Container(
                              width: 40,
                              height: 40,
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
                                Icons.verified,
                                color: Colors.white,
                                size: 20,
                              ),
                            ))),
                  ),

                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // //First One
                      // SizedBox(
                      //   width: 50,
                      //   height: 50,
                      //   child: TextFormField(
                      //     keyboardType: TextInputType.number,
                      //     style: Theme.of(context).textTheme.headline6,
                      //     textAlign: TextAlign.center,
                      //     inputFormatters: [
                      //       LengthLimitingTextInputFormatter(1),
                      //       FilteringTextInputFormatter.digitsOnly
                      //     ],
                      //     onChanged: (value) {
                      //       if (value.length == 1) {
                      //         FocusScope.of(context).nextFocus();
                      //       }
                      //       if (value.isEmpty) {
                      //         FocusScope.of(context).previousFocus();
                      //       }
                      //     },
                      //     decoration: const InputDecoration(
                      //         // hintText: "",
                      //         border: UnderlineInputBorder(
                      //             borderSide: BorderSide(
                      //           color: Colors.green,
                      //         ))),
                      //   ),
                      // ),

                      // //second Input line
                      // SizedBox(
                      //   width: 50,
                      //   height: 50,
                      //   child: TextFormField(
                      //     keyboardType: TextInputType.number,
                      //     style: Theme.of(context).textTheme.headline6,
                      //     textAlign: TextAlign.center,
                      //     inputFormatters: [
                      //       LengthLimitingTextInputFormatter(1),
                      //       FilteringTextInputFormatter.digitsOnly
                      //     ],
                      //     onChanged: (value) {
                      //       if (value.length == 1) {
                      //         FocusScope.of(context).nextFocus();
                      //       }
                      //       if (value.isEmpty) {
                      //         FocusScope.of(context).previousFocus();
                      //       }
                      //     },
                      //     decoration: const InputDecoration(
                      //         // hintText: "0",
                      //         border: UnderlineInputBorder(
                      //             borderSide: BorderSide(
                      //           color: Colors.green,
                      //         ))),
                      //   ),
                      // ),

                      // //Three input line
                      // SizedBox(
                      //   width: 50,
                      //   height: 50,
                      //   child: TextFormField(
                      //     keyboardType: TextInputType.number,
                      //     style: Theme.of(context).textTheme.headline6,
                      //     textAlign: TextAlign.center,
                      //     inputFormatters: [
                      //       LengthLimitingTextInputFormatter(1),
                      //       FilteringTextInputFormatter.digitsOnly
                      //     ],
                      //     onChanged: (value) {
                      //       if (value.length == 1) {
                      //         FocusScope.of(context).nextFocus();
                      //       }
                      //       if (value.isEmpty) {
                      //         FocusScope.of(context).previousFocus();
                      //       }
                      //     },
                      //     decoration: const InputDecoration(
                      //         // hintText: "0",
                      //         border: UnderlineInputBorder(
                      //             borderSide: BorderSide(
                      //           color: Colors.green,
                      //         ))),
                      //   ),
                      // ),

                      // //Fourth input Line
                      // SizedBox(
                      //   width: 50,
                      //   height: 50,
                      //   child: TextFormField(
                      //     keyboardType: TextInputType.number,
                      //     style: Theme.of(context).textTheme.headline6,
                      //     textAlign: TextAlign.center,
                      //     inputFormatters: [
                      //       LengthLimitingTextInputFormatter(1),
                      //       FilteringTextInputFormatter.digitsOnly
                      //     ],
                      //     onChanged: (value) {
                      //       if (value.length == 1) {
                      //         FocusScope.of(context).nextFocus();
                      //       }
                      //       if (value.isEmpty) {
                      //         FocusScope.of(context).previousFocus();
                      //       }
                      //     },
                      //     decoration: const InputDecoration(
                      //         // hintText: "0",
                      //         border: UnderlineInputBorder(
                      //             borderSide: BorderSide(
                      //           color: Colors.green,
                      //         ))),
                      //   ),
                      // ),
                    ],
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 78, 206, 113),
                          onPrimary: Colors.white,
                        ),
                        onPressed: () {
                          try {
                            sendOtp();
                            Fluttertoast.showToast(
                                msg: "OTP Send Successfully");
                          } catch (e) {
                            Fluttertoast.showToast(msg: "${e}");
                          }
                        },
                        child: const Text(
                          "Send OTP",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 78, 206, 113),
                          onPrimary: Colors.white,
                        ),
                        onPressed: () {
                          verify();

                          // FirebaseFirestore firebaseFirestore =
                          //           FirebaseFirestore.instance;
                          //       User? user = _auth.currentUser;

                          //                 UserModel userModel = UserModel();

                          // if(loggedInUser.oldUser == true){
                          //   Navigator.push(context, MaterialPageRoute(builder: (context) => const ProgressBar()));

                          // }else if(loggedInUser.oldUser == false){
                          //   Navigator.push(context, MaterialPageRoute(builder: (context) => const NewPassword()));
                          // }
                        },
                        child: const Text(
                          "Submit",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        )),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      sendOtp();
                      Fluttertoast.showToast(msg: "OTP Send Successfully");
                    },
                    child: const Text("Resend OTP",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
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

  // _verifyPhone() async {
  //   await FirebaseAuth.instance.verifyPhoneNumber(
  //       phoneNumber: '${loggedInUser.phoneNumber}}',
  //       verificationCompleted: (PhoneAuthCredential credential) async {
  //         await FirebaseAuth.instance
  //             .signInWithCredential(credential)
  //             .then((value) async {
  //           if (value.user != null) {
  //             Navigator.pushAndRemoveUntil(
  //                 context,
  //                 MaterialPageRoute(builder: (context) => NewPassword()),
  //                 (route) => false);
  //           }
  //         });
  //       },
  //       verificationFailed: (FirebaseAuthException e) {
  //         print(e.message);
  //       },
  //       codeSent: (String? verficationID, int? resendToken) {
  //         setState(() {
  //           _verificationCode = verficationID;
  //         });
  //       },
  //       codeAutoRetrievalTimeout: (String verificationID) {
  //         setState(() {
  //           _verificationCode = verificationID;
  //         });
  //       },
  //       timeout: Duration(seconds: 120));
  // }

  // @override
  // void initState() {
  // TODO: implement initState
  // super.initState();
  // _verifyPhone();
  // }
}
