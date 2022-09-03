class UserModel{
  String? uid;
  String? email;
  String? password;
  // String? phoneNumber;
  // String? userLocation;
  bool? oldUser;


  
UserModel({
  this.uid,
  this.email,
  this.password,
  // this.phoneNumber,
  // this.userLocation,
  this.oldUser,
});


factory UserModel.fromMap(map){
  return UserModel(
    uid: map['uid'],
    email: map['email'],
    password: map['password'],
    // phoneNumber: map['phoneNumber'],
    // userLocation: map['userLocation'],
    oldUser: map['oldUser'],
  );
}


Map<String, dynamic> toMap(){
  return {
    'uid': uid,
    'email': email,
    'password': password,
    // 'phoneNumber': phoneNumber,
    // 'userLocation': userLocation,
    'oldUser': oldUser,
  };
}

}
