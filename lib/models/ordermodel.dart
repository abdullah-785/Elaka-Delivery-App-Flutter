// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

class Order {
  Order({
    required this.status,
    required this.message,
    required this.data,
  });

  String status;
  String message;
  List<Datum>? data;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
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
    required this.id,
    required this.orderNumber,
    required this.orderDate,
    required this.customerId,
    required this.amount,
    required this.zoneId,
    required this.deliveryDate,
    required this.supplierId,
    required this.deliveryId,
    required this.status,
    required this.ratting,
    required this.createdAt,
    required this.updatedAt,
    required this.prodname,
    required this.customerData,
    required this.supplierData,
    required this.orderItems,
  });

  int? id;
  String orderNumber;
  String? orderDate;
  String? customerId;
  String? amount;
  dynamic? zoneId;
  DateTime? deliveryDate;
  String? supplierId;
  String? deliveryId;
  String? status;
  String? ratting;
  dynamic? createdAt;
  dynamic? updatedAt;
  String? prodname;
  ErData? customerData;
  ErData? supplierData;
  List<OrderItem>? orderItems;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        orderNumber: json["order_number"],
        orderDate: json["order_date"] == null ? null : json["order_date"],
        customerId: json["customer_id"] == null ? null : json["customer_id"],
        amount: json["amount"] == null ? null : json["amount"],
        zoneId: json["zone_id"],
        deliveryDate: json["delivery_date"] == null
            ? null
            : DateTime.parse(json["delivery_date"]),
        supplierId: json["supplier_id"] == null ? null : json["supplier_id"],
        deliveryId: json["delivery_id"] == null ? null : json["delivery_id"],
        status: json["status"] == null ? null : json["status"],
        ratting: json["ratting"] == "" ? "" : json["ratting"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        prodname: json["prodname"] == null ? null : json["prodname"],
        customerData: json["customer_data"] == null
            ? null
            : ErData.fromJson(json["customer_data"]),
        supplierData: json["supplier_data"] == null
            ? null
            : ErData.fromJson(json["supplier_data"]),
        orderItems: json["order_items"] == null
            ? null
            : List<OrderItem>.from(
                json["order_items"].map((x) => OrderItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "order_number": orderNumber == null ? null : orderNumber,
        "order_date": orderDate == null ? null : amount,
        "customer_id": customerId == null ? null : customerId,
        "amount": amount == null ? null : amount,
        "zone_id": zoneId,
        "delivery_date": deliveryDate == null ? null : deliveryDate,
        "order_date": orderDate == null ? null : orderDate,
        "customer_id": customerId == null ? null : customerId,
        "amount": amount == null ? null : amount,
        "zone_id": zoneId,
        "delivery_date": deliveryDate == null ? null : deliveryDate,
        "supplier_id": supplierId == null ? null : supplierId,
        "delivery_id": deliveryId == null ? null : deliveryId,
        "status": status == null ? null : status,
        "ratting": ratting == null ? null : ratting,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "prodname": prodname == null ? null : prodname,
        "customer_data": customerData == null ? null : customerData?.toJson(),
        "supplier_data": supplierData == null ? null : supplierData?.toJson(),
        "customer_data": customerData == null ? null : customerData!.toJson(),
        "supplier_data": supplierData == null ? null : supplierData!.toJson(),
        "order_items": orderItems == null
            ? null
            : List<dynamic>.from(orderItems!.map((x) => x.toJson())),
      };
}

class ErData {
  ErData({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.drivingLicense,
    required this.vehicalNumber,
    @required this.dob,
    @required this.slug,
    @required this.country,
    required this.phoneNumber,
    required this.email,
    @required this.emailVerifiedAt,
    required this.businessAddress,
    required this.photo,
    required this.catId,
    required this.radius,
    @required this.desc,
    required this.otpLogin,
    @required this.forgotToken,
    @required this.isPasswordChange,
    @required this.isFeatured,
    @required this.status,
    @required this.vehicle,
    @required this.rangeKm,
    @required this.businessZone,
    @required this.balance,
    @required this.contractType,
    @required this.drivingLicencesImage,
    @required this.location,
    @required this.lat,
    @required this.lng,
    @required this.percentage,
    @required this.amount,
    @required this.parentId,
    @required this.createdAt,
    @required this.updatedAt,
  });

  int? id;
  String? firstName;
  String? lastName;
  String? drivingLicense;
  String? vehicalNumber;
  dynamic? dob;
  dynamic? slug;
  dynamic? country;
  String? phoneNumber;
  String? email;
  dynamic? emailVerifiedAt;
  String? businessAddress;
  String? photo;
  String? catId;
  String? radius;
  dynamic? desc;
  String? otpLogin;
  String? forgotToken;
  String? isPasswordChange;
  dynamic? isFeatured;
  String? status;
  dynamic? vehicle;
  dynamic? rangeKm;
  dynamic? businessZone;
  dynamic? balance;
  dynamic? contractType;
  dynamic? drivingLicencesImage;
  dynamic? location;
  String? lat;
  String? lng;
  dynamic? percentage;
  dynamic? amount;
  dynamic? parentId;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory ErData.fromJson(Map<String, dynamic> json) => ErData(
        id: json["id"] == null ? null : json["id"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        drivingLicense:
            json["driving_license"] == null ? null : json["driving_license"],
        vehicalNumber:
            json["vehical_number"] == null ? null : json["vehical_number"],
        dob: json["dob"],
        slug: json["slug"],
        country: json["country"],
        phoneNumber: json["phone_number"] == null ? null : json["phone_number"],
        email: json["email"] == null ? null : json["email"],
        emailVerifiedAt: json["email_verified_at"],
        businessAddress:
            json["business_address"] == null ? null : json["business_address"],
        photo: json["photo"] == null ? null : json["photo"],
        catId: json["cat_id"] == null ? null : json["cat_id"],
        radius: json["radius"] == null ? null : json["radius"],
        desc: json["desc"],
        otpLogin: json["otp_login"] == null ? null : json["otp_login"],
        forgotToken: json["forgot_token"] == null ? null : json["forgot_token"],
        isPasswordChange: json["is_password_change"] == null
            ? null
            : json["is_password_change"],
        isFeatured: json["is_featured"],
        status: json["status"] == null ? null : json["status"],
        vehicle: json["vehicle"],
        rangeKm: json["range_km"],
        businessZone: json["business_zone"],
        balance: json["balance"],
        contractType: json["contract_type"],
        drivingLicencesImage: json["driving_licences_image"],
        location: json["location"],
        lat: json["lat"],
        lng: json["lng"],
        percentage: json["percentage"],
        amount: json["amount"],
        parentId: json["parent_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "first_name": firstName == null ? null : firstName,
        "last_name": lastName == null ? null : lastName,
        "driving_license": drivingLicense == null ? null : drivingLicense,
        "vehical_number": vehicalNumber == null ? null : vehicalNumber,
        "dob": dob,
        "slug": slug,
        "country": country,
        "phone_number": phoneNumber == null ? null : phoneNumber,
        "email": email == null ? null : email,
        "email_verified_at": emailVerifiedAt,
        "business_address": businessAddress == null ? null : businessAddress,
        "photo": photo == null ? null : photo,
        "cat_id": catId == null ? null : catId,
        "radius": radius == null ? null : radius,
        "desc": desc,
        "otp_login": otpLogin == null ? null : otpLogin,
        "forgot_token": forgotToken == null ? null : forgotToken,
        "is_password_change":
            isPasswordChange == null ? null : isPasswordChange,
        "is_featured": isFeatured,
        "status": status == null ? null : status,
        "vehicle": vehicle,
        "range_km": rangeKm,
        "business_zone": businessZone,
        "balance": balance,
        "contract_type": contractType,
        "driving_licences_image": drivingLicencesImage,
        "location": location,
        "percentage": percentage,
        "amount": amount,
        "parent_id": parentId,
        "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}

class OrderItem {
  OrderItem({
    @required this.id,
    @required this.orderId,
    @required this.productId,
    @required this.qty,
    @required this.basePrice,
    @required this.createdAt,
    @required this.updatedAt,
    @required this.productData,
  });

  int? id;
  String? orderId;
  String? productId;
  String? qty;
  String? basePrice;
  dynamic? createdAt;
  dynamic? updatedAt;

  ProductData? productData;

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        id: json["id"] == null ? null : json["id"],
        orderId: json["order_id"] == null ? null : json["order_id"],
        productId: json["product_id"] == null ? null : json["product_id"],
        qty: json["qty"] == null ? null : json["qty"],
        basePrice: json["base_price"] == null ? null : json["base_price"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        productData: json["product_data"] == null
            ? null
            : ProductData.fromJson(json["product_data"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "order_id": orderId == null ? null : orderId,
        "product_id": productId == null ? null : productId,
        "qty": qty == null ? null : qty,
        "base_price": basePrice == null ? null : basePrice,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "product_data": productData == null ? null : productData?.toJson(),
      };
}

class ProductData {
  ProductData({
    @required this.id,
    @required this.supplierId,
    @required this.image,
    @required this.proTitle,
    @required this.zone,
    @required this.price,
    @required this.sku,
    @required this.catId,
    @required this.weight,
    @required this.size,
    @required this.promoCode,
    @required this.shop,
    @required this.description,
    @required this.isStock,
    @required this.addPromotions,
    @required this.isFeatured,
    @required this.featuredStartDate,
    @required this.featuredEndDate,
    @required this.createdAt,
    @required this.updatedAt,
  });

  int? id;
  String? supplierId;
  String? image;
  String? proTitle;
  dynamic? zone;
  String? price;
  dynamic? sku;
  dynamic? catId;
  String? weight;
  dynamic? size;
  dynamic? promoCode;
  dynamic? shop;
  String? description;
  dynamic? isStock;
  String? addPromotions;
  dynamic? isFeatured;
  dynamic? featuredStartDate;
  dynamic? featuredEndDate;
  dynamic? createdAt;
  dynamic? updatedAt;

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
        id: json["id"] == null ? null : json["id"],
        supplierId: json["supplier_id"] == null ? null : json["supplier_id"],
        image: json["image"] == null ? null : json["image"],
        proTitle: json["pro_title"] == null ? null : json["pro_title"],
        zone: json["zone"],
        price: json["price"] == null ? null : json["price"],
        sku: json["sku"],
        catId: json["cat_id"],
        weight: json["weight"] == null ? null : json["weight"],
        size: json["size"],
        promoCode: json["promo_code"],
        shop: json["shop"],
        description: json["description"] == null ? null : json["description"],
        isStock: json["is_stock"],
        addPromotions:
            json["add_promotions"] == null ? null : json["add_promotions"],
        isFeatured: json["is_featured"],
        featuredStartDate: json["featured_start_date"],
        featuredEndDate: json["featured_end_date"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "supplier_id": supplierId == null ? null : supplierId,
        "image": image == null ? null : image,
        "pro_title": proTitle == null ? null : proTitle,
        "zone": zone,
        "price": price == null ? null : price,
        "sku": sku,
        "cat_id": catId,
        "weight": weight == null ? null : weight,
        "size": size,
        "promo_code": promoCode,
        "shop": shop,
        "description": description == null ? null : description,
        "is_stock": isStock,
        "add_promotions": addPromotions == null ? null : addPromotions,
        "is_featured": isFeatured,
        "featured_start_date": featuredStartDate,
        "featured_end_date": featuredEndDate,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
