import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';




class ListOfOrders extends StatelessWidget {
  const ListOfOrders({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandablePanel(
      header: Column(
        children: [
          Row(
            children: const [
              // HeightBox(20),
              Text(
                "Newly Transection are in your account",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Text(
                "15\$",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color:
                      Color.fromARGB(255, 78, 206, 113),
                ),
              ),
            ],
          ),
          HeightBox(5.0),
          const Padding(
            padding: EdgeInsets.only(bottom: 2),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Tuesday, 31 May 2022 at 10:00 AM",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                )),
          ),
        ],
      ),
      collapsed: Text(""),
      
      expanded: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            DetailsOfList(heading: "Supplier  ", name: "Abdullah",),
            HeightBox(5),
            DetailsOfList(heading: "Customer", name: "Mehru",),
            HeightBox(5),
            DetailsOfList(heading: "Item         ", name: "Apple",),
            HeightBox(5),
            DetailsOfList(heading: "Amount   ", name: "\$200",),
            HeightBox(5),
            
            HeightBox(20),
          ],
        ),
      ),
    );
  }
}



class DetailsOfList extends StatelessWidget {
  const DetailsOfList({
    Key? key, required this.heading, required this.name,
  }) : super(key: key);
  final String heading;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children:  [
        Text(heading, style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          
        ),),
        WidthBox(40),
        Text(name, style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          
        ),),
        
      ],
    );
  }
}