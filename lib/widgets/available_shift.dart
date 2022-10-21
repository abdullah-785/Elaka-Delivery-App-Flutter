import 'package:elaka_delivery_app/pages/booked_shift.dart';
import 'package:elaka_delivery_app/pages/next_shift.dart';
import 'package:elaka_delivery_app/pages/upcoming_shift.dart';
import 'package:flutter/material.dart';

class AvailableShiftRow extends StatelessWidget {
  const AvailableShiftRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => NextShift()));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
        child: Card(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  children: [
                    const Text("Baghdad",
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    Spacer(),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => UpcomingShift()));
                        },
                        child: const Text("Book Shift",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Color.fromARGB(255, 18, 21, 49))))
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15, bottom: 5),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "10:00 - 15:15 (5h 15m)",
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
