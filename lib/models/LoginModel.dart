// import 'dart:ffi';

class LoginUser {
  String? status;
  String? message;
  Data? data;

  LoginUser({this.status, this.message, this.data});

  LoginUser.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? firstName;
  String? lastName;
  String? drivingLicense;
  String? vehicalNumber;
  String? dob;
  String? slug;
  String? country;
  String? phoneNumber;
  String? email;
  String? emailVerifiedAt;
  String? businessAddress;
  String? photo;
  String? catId;
  String? radius;
  String? desc;
  String? otpLogin;
  dynamic forgotToken;
  String? isPasswordChange;
  String? isFeatured;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.firstName,
      this.lastName,
      this.drivingLicense,
      this.vehicalNumber,
      this.dob,
      this.slug,
      this.country,
      this.phoneNumber,
      this.email,
      this.emailVerifiedAt,
      this.businessAddress,
      this.photo,
      this.catId,
      this.radius,
      this.desc,
      this.otpLogin,
      this.forgotToken,
      this.isPasswordChange,
      this.isFeatured,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    drivingLicense = json['driving_license'];
    vehicalNumber = json['vehical_number'];
    dob = json['dob'];
    slug = json['slug'];
    country = json['country'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    businessAddress = json['business_address'];
    photo = json['photo'];
    catId = json['cat_id'];
    radius = json['radius'];
    desc = json['desc'];
    otpLogin = json['otp_login'];
    forgotToken = json['forgot_token'];
    isPasswordChange = json['is_password_change'];
    isFeatured = json['is_featured'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['driving_license'] = this.drivingLicense;
    data['vehical_number'] = this.vehicalNumber;
    data['dob'] = this.dob;
    data['slug'] = this.slug;
    data['country'] = this.country;
    data['phone_number'] = this.phoneNumber;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['business_address'] = this.businessAddress;
    data['photo'] = this.photo;
    data['cat_id'] = this.catId;
    data['radius'] = this.radius;
    data['desc'] = this.desc;
    data['otp_login'] = this.otpLogin;
    data['forgot_token'] = this.forgotToken;
    data['is_password_change'] = this.isPasswordChange;
    data['is_featured'] = this.isFeatured;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
