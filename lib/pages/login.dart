import 'package:elaka_delivery_app/pages/opt_verification.dart';
// import 'package:elaka_delivery_app/widgets/opt.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 247, 255),
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
                      offset: const Offset(3, 3)
                    )
                  ]
                ),
                child: const Image(image: AssetImage("images/logo.png"))),
                  ],
                )
                
              ],
             ),
           ),
          
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
                    height: 40,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("Email", style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                      controller: _emailController,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                        decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green)
                          ),
                            border: const OutlineInputBorder(),
                            prefixIcon: Container(
                              width: 50,
                              height: 50,
                              margin: const EdgeInsets.only(top: 11, bottom: 11, right: 8 ,left: 11,),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Icon(
                                Icons.email,
                                color: Colors.white,
                                size: 30,
                              ),
                            ))),
                  ),
                  const SizedBox(height: 15,),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("Password", style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                      controller: _passwordController,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                      obscureText: true,
                      keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green)
                          ),
                            border:const OutlineInputBorder(),
                            prefixIcon: Container(
                              width: 50,
                              height: 50,
                              margin: const EdgeInsets.only(top: 11, bottom: 11, right: 8 ,left: 11,),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Icon(
                                Icons.lock,
                                color: Colors.white,
                                size: 30,
                              ),
                            ))),
                  ),
                  const SizedBox(height: 15,),
                  const Text("Forget Password?", style: TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                    fontWeight: FontWeight.bold
                  ) ),
              
                  const SizedBox(height: 28,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        onPrimary: Colors.white,
                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const OptVerification()));
                      }, child: const Text("Sign In", style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                      ),)),
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
