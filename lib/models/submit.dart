// To parse this JSON data, do
//
//     final submitOrder = submitOrderFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SubmitOrder submitOrderFromJson(String str) =>
    SubmitOrder.fromJson(json.decode(str));

String submitOrderToJson(SubmitOrder data) => json.encode(data.toJson());

class SubmitOrder {
  SubmitOrder({
    @required this.status,
    @required this.message,
    @required this.data,
  });

  String? status;
  String? message;
  List<Datum>? data;

  factory SubmitOrder.fromJson(Map<String, dynamic> json) => SubmitOrder(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    @required this.id,
    @required this.orderNumber,
    @required this.orderDate,
    @required this.customerId,
    @required this.amount,
    @required this.zoneId,
    @required this.deliveryDate,
    @required this.supplierId,
    @required this.deliveryId,
    @required this.status,
    @required this.ratting,
    @required this.deliveryboyAmtCollected,
    @required this.createdAt,
    @required this.updatedAt,
  });

  int? id;
  String? orderNumber;
  DateTime? orderDate;
  String? customerId;
  String? amount;
  dynamic? zoneId;
  String? deliveryDate;
  String? supplierId;
  String? deliveryId;
  String? status;
  String? ratting;
  String? deliveryboyAmtCollected;
  dynamic? createdAt;
  String? updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        orderNumber: json["order_number"] == null ? null : json["order_number"],
        orderDate: json["order_date"] == null
            ? null
            : DateTime.parse(json["order_date"]),
        customerId: json["customer_id"] == null ? null : json["customer_id"],
        amount: json["amount"] == null ? null : json["amount"],
        zoneId: json["zone_id"],
        deliveryDate:
            json["delivery_date"] == null ? null : json["delivery_date"],
        supplierId: json["supplier_id"] == null ? null : json["supplier_id"],
        deliveryId: json["delivery_id"] == null ? null : json["delivery_id"],
        status: json["status"] == null ? null : json["status"],
        ratting: json["ratting"] == null ? null : json["ratting"],
        deliveryboyAmtCollected: json["deliveryboy_amt_collected"] == null
            ? null
            : json["deliveryboy_amt_collected"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"] == null ? null : json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "order_number": orderNumber == null ? null : orderNumber,
        "order_date": orderDate == null ? null : orderDate,
        "customer_id": customerId == null ? null : customerId,
        "amount": amount == null ? null : amount,
        "zone_id": zoneId,
        "delivery_date": deliveryDate == null ? null : deliveryDate,
        "supplier_id": supplierId == null ? null : supplierId,
        "delivery_id": deliveryId == null ? null : deliveryId,
        "status": status == null ? null : status,
        "ratting": ratting == null ? null : ratting,
        "deliveryboy_amt_collected":
            deliveryboyAmtCollected == null ? null : deliveryboyAmtCollected,
        "created_at": createdAt,
        "updated_at": updatedAt == null ? null : updatedAt,
      };
}
