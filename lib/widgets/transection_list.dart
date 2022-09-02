import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';




class TransectionList extends StatelessWidget {
  const TransectionList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 10),
              child: Row(
                children: const [
                  // HeightBox(20),
                  Text("Newly Transection are in your account", style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),),
                  Spacer(),
                  Text("15\$", style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                   color: Color.fromARGB(255, 78,206,113),
                  ),)
                ],
              ),
            ),
            
            const Padding(
              padding: EdgeInsets.symmetric(),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("Tuesday, 31 May 2022", style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),)),
            ),
            const HeightBox(20),
          ]),
      ),
    );
  }
}
