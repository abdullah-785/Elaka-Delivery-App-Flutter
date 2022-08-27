import 'package:elaka_delivery_app/pages/new_password.dart';
// import 'package:elaka_delivery_app/widgets/opt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:velocity_x/velocity_x.dart';

class OptVerification extends StatefulWidget {
  const OptVerification({Key? key}) : super(key: key);

  @override
  State<OptVerification> createState() => _OptVerificationState();
}

class _OptVerificationState extends State<OptVerification> {
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //First One
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          style: Theme.of(context).textTheme.headline6,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                            if (value.isEmpty) {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                          decoration: const InputDecoration(
                              hintText: "0",
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.green,
                              ))),
                        ),
                      ),


                      //second Input line
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          style: Theme.of(context).textTheme.headline6,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                            if (value.isEmpty) {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                          decoration: const InputDecoration(
                              hintText: "0",
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.green,
                              ))),
                        ),
                      ),



                      //Three input line
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          style: Theme.of(context).textTheme.headline6,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                            if (value.isEmpty) {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                          decoration: const InputDecoration(
                              hintText: "0",
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.green,
                              ))),
                        ),
                      ),


                      //Fourth input Line
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          style: Theme.of(context).textTheme.headline6,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                            if (value.isEmpty) {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                          decoration: const InputDecoration(
                              hintText: "0",
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.green,
                              ))),
                        ),
                      ),
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
                          primary: Colors.green,
                          onPrimary: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const NewPassword()));
                        },
                        child: const Text(
                          "Submit",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      
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
}
