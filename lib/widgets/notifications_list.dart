import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class NotificationList extends StatelessWidget {
  const NotificationList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 40),
      child: Row(
        children: [
          const Padding(
              padding: EdgeInsets.all(0.0),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    "https://pbs.twimg.com/profile_images/685700874434314240/80T5j3HF_400x400.jpg"),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.75,
              child: Column(
                children: const [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Asim",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 78, 206, 113),
                        ),
                      )),
                  HeightBox(5),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Jonathan Smaith placed an order for freshbroccoli in zone 1.",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      )),
                  HeightBox(10),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Apr 12, 2022 at 10:41 AM",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
