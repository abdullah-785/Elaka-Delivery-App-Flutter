// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    Welcome({
        required this.status,
        required this.message,
        required this.data,
    });

    String status;
    String message;
    Data data;

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.drivingLicense,
        required this.vehicalNumber,
        required this.dob,
        required this.slug,
        required this.country,
        required this.phoneNumber,
        required this.email,
        required this.emailVerifiedAt,
        required this.conferenceRegistered,
        required this.photo,
        required this.cv,
        required this.designation,
        required this.desc,
        required this.otpLogin,
        required this.forgotToken,
        required this.isPasswordChange,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    String firstName;
    String lastName;
    String drivingLicense;
    String vehicalNumber;
    DateTime dob;
    String slug;
    String country;
    String phoneNumber;
    String email;
    dynamic emailVerifiedAt;
    String conferenceRegistered;
    dynamic photo;
    dynamic cv;
    dynamic designation;
    dynamic desc;
    String otpLogin;
    String forgotToken;
    String isPasswordChange;
    DateTime createdAt;
    DateTime updatedAt;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        drivingLicense: json["driving_license"],
        vehicalNumber: json["vehical_number"],
        dob: DateTime.parse(json["dob"]),
        slug: json["slug"],
        country: json["country"],
        phoneNumber: json["phone_number"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        conferenceRegistered: json["conference_registered"],
        photo: json["photo"],
        cv: json["cv"],
        designation: json["designation"],
        desc: json["desc"],
        otpLogin: json["otp_login"],
        forgotToken: json["forgot_token"],
        isPasswordChange: json["is_password_change"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "driving_license": drivingLicense,
        "vehical_number": vehicalNumber,
        "dob": "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
        "slug": slug,
        "country": country,
        "phone_number": phoneNumber,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "conference_registered": conferenceRegistered,
        "photo": photo,
        "cv": cv,
        "designation": designation,
        "desc": desc,
        "otp_login": otpLogin,
        "forgot_token": forgotToken,
        "is_password_change": isPasswordChange,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
