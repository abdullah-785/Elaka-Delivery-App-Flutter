import 'package:elaka_delivery_app/models/ordermodel.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:elaka_delivery_app/services/constants.dart';

// Product Detial Widget
class ProductDetailWidget extends StatelessWidget {
  final Order? order;

  ProductDetailWidget(this.order);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: order?.data?.length ?? 0,
        physics: ScrollPhysics(),
        itemBuilder: (context, index) {
          var data = order!.data![index];
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Text(
                      data.supplierData?.firstName ?? "",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 78, 206, 113),
                      ),
                    ),
                  ],
                ),
              ),
              const HeightBox(10),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 38,
                decoration: const BoxDecoration(
                  // 12,21,100
                  color: Color.fromARGB(255, 12, 21, 100),
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.orderItems?.length ?? 0,
                  physics: ScrollPhysics(),
                  itemBuilder: (context, index) {
                    OrderItem item = data.orderItems![index];
                    return Column(
                      children: [_item(context, item)],
                    );
                  }),
            ],
          );
        });
  }

  Widget _item(BuildContext context, OrderItem item) {
    var imageUrl = item.productData?.image ?? "";
    var prodImage = productsImageUrl + imageUrl;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.15,
            height: 80,
            child: Image(image: NetworkImage(prodImage)),
          ),
          WidthBox(50),
          Column(
            children: [
              Text(
                item.productData?.proTitle ?? "",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.pinkAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                item.productData?.description ?? "",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              Text(
                '\$' + item.productData!.price!,
                style: TextStyle(
                    color: Color.fromARGB(255, 78, 206, 113),
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              )
            ],
          )
        ],
      ),
    );
  }
}
