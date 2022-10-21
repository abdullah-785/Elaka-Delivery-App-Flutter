import 'package:elaka_delivery_app/pages/available_shift.dart';
import 'package:elaka_delivery_app/pages/current_no_order.dart';
import 'package:elaka_delivery_app/pages/next_shift.dart';
import 'package:elaka_delivery_app/pages/setting.dart';
import 'package:elaka_delivery_app/pages/wallet.dart';
import 'package:elaka_delivery_app/widgets/available_shift.dart';
import 'package:elaka_delivery_app/widgets/calender.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:velocity_x/velocity_x.dart';

class BookedShift extends StatefulWidget {
  const BookedShift({Key? key}) : super(key: key);

  // final String userId;
  // Shift(this.userId);

  @override
  State<BookedShift> createState() => _BookedShiftState();
}

class _BookedShiftState extends State<BookedShift> {
  int currentIndex = 0;
  bool isChecked1 = false;

  // List<String> categories = ["Avalibale Shift", "Booked Shift"];

  CalendarFormat format = CalendarFormat.week;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  TextEditingController _eventController = TextEditingController();

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
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Available Shift",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
                      TableCalendar(
                        focusedDay: selectedDay,
                        firstDay: DateTime(1990),
                        lastDay: DateTime(2050),
                        calendarFormat: format,
                        onFormatChanged: (CalendarFormat _format) {
                          setState(() {
                            format = _format;
                          });
                        },
                        startingDayOfWeek: StartingDayOfWeek.sunday,
                        daysOfWeekVisible: true,
                
                        //Day Changed
                        onDaySelected: (DateTime selectDay, DateTime focusDay) {
                          setState(() {
                            selectedDay = selectDay;
                            focusedDay = focusDay;
                          });
                          print(focusedDay);
                        },
                        selectedDayPredicate: (DateTime date) {
                          return isSameDay(selectedDay, date);
                        },
                
                        // eventLoader: _getEventsfromDay,
                
                        //To style the Calendar
                        calendarStyle: CalendarStyle(
                          isTodayHighlighted: true,
                          selectedDecoration: BoxDecoration(
                            color: Color.fromARGB(255, 78, 206, 113),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          selectedTextStyle: TextStyle(color: Colors.white),
                          todayDecoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          defaultDecoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          weekendDecoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        headerStyle: HeaderStyle(
                          formatButtonVisible: true,
                          titleCentered: true,
                          formatButtonShowsNext: false,
                          formatButtonDecoration: BoxDecoration(
                            color: Color.fromARGB(255, 78, 206, 113),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          formatButtonTextStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      HeightBox(30),
                      GestureDetector(
                        onTap: (){
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => BookedShift()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 60),
                          child: Card(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AvailableShift()));
                                    },
                                    child: const Text("Avalibale Shift", style: TextStyle(
                                      color: Colors.black,
                                    )),
                                  ),
                                ),
                                const WidthBox(5),
                                TextButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(
                                          Color.fromARGB(255, 78, 206, 113)),
                                    ),
                                  onPressed: () {},
                                  child: const Text(
                                    "Booked Shift",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          // fontWeight: FontWeight.bold,
                                    )
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      HeightBox(20),
                      Container(
                        child: Center(
                          child: Text("No Booked Shift"),
                        ),
                      )
                      
                    ],
                  ),
                )),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromARGB(255, 23, 69, 103),
        unselectedItemColor: const Color.fromARGB(255, 23, 69, 103),
        iconSize: 30,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Setting()));
                },
                child: const Icon(Icons.settings)),
            label: 'Setting',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CurrentNoOrder("")));
              },
              child: const FaIcon(
                FontAwesomeIcons.gift,
                size: 26,
              ),
            ),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Wallet()));
                },
                child: const Icon(Icons.account_balance_wallet)),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) =>  Shift()));
                },
                child: const Icon(Icons.shuffle)),
            label: 'Shift',
          ),
        ],
      ),
    );
  }
}


