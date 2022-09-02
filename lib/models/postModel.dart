import 'package:flutter/material.dart';

class PostModel {
  String? uid;
  String? postId;
  String? postImageUrl;
  String? squareFoot;
  String? bedroomsvar;
  String? bathroomsvar;
  String? garegevar;
  String? propertyType;
  String? amount;
  String? description;
  String? address;
  String? createdAt;

  PostModel({
    this.uid, 
    this.postId, 
    this.postImageUrl, 
    this.squareFoot, 
    this.bedroomsvar, 
    this.bathroomsvar,
    this.garegevar, 
    this.propertyType,
    this.amount,
    this.description,
    this.address,
    this.createdAt,
    });

  // receiving data from server
  factory PostModel.fromMap(map) {
    return PostModel(
      uid: map['uid'],
      postId: map['postId'],
      postImageUrl: map['postImageUrl'],
      squareFoot: map['squareFoot'],
      bedroomsvar: map['bedroomsvar'],
      bathroomsvar: map['bathroomsvar'],
      garegevar: map['garegevar'],
      propertyType: map['propertyType'],
      amount: map['amount'],
      description: map['description'],
      address: map["address"],
      createdAt: map['createdAt'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'postId': postId,
      'postImageUrl': postImageUrl,
      'squareFoot': squareFoot,
      'bedroomsvar': bedroomsvar,
      'bathroomsvar': bathroomsvar,
      'garegevar': garegevar,
      'propertyType': propertyType,
      'amount': amount,
      'description': description,
      'address': address,
      'createdAt': createdAt,
      
    };
  }
}
