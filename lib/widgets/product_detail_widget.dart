import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';




// Product Detial Widget
class ProductDetailWidget extends StatelessWidget {
  const ProductDetailWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: 80,
            child: Image(image: AssetImage("images/product1.png",)),
          ),
          WidthBox(50),
          
          Column(
            children: const [
              Text("United Grocery",style: TextStyle(
                fontSize: 16,
                color: Colors.pinkAccent,
                fontWeight: FontWeight.bold,
              ),),
              Text("Fresh carrots with leaves", style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),),
              Text("\$10.0", style: TextStyle(
                color: Color.fromARGB(255, 78,206,113),
                fontWeight: FontWeight.bold,
                fontSize: 17
              ),)
            ],
          )
          
        ],
      ),
    );
  }
}
