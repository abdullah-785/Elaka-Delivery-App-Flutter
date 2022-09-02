import 'package:flutter/foundation.dart';

class OrderModel{
  String? productImage;
  String? productName;
  String? groceryName;
  String? weight;
  String? price;
  String? description;
  String? createdAt;


  OrderModel({
  this.productImage,
  this.productName,
  this.groceryName,
  this.weight,
  this.price,
  this.description,
  this.createdAt,
});



factory OrderModel.fromMap(map){
  return OrderModel(
    productImage: map['productImage'],
    productName: map['productName'],
    groceryName: map['groceryName'],
    weight: map['weight'],
    price: map['price'],
    description: map['description'],
    createdAt: map['createdAt'],
  );
}


Map<String, dynamic> toMap(){
  return {
    'productImage': productImage,
    'productName': productName,
    'groceryName': groceryName,
    'weight': weight,
    'price': price,
    'description': description,
    'createdAt': createdAt,
  };
}
  
}

