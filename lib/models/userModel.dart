class UserModel{
  String? uid;
  String? email;
  String? password;
  String? phoneNumber;
  String? userLocation;


  
UserModel({
  this.uid,
  this.email,
  this.password,
  this.phoneNumber,
  this.userLocation,
});


factory UserModel.fromMap(map){
  return UserModel(
    uid: map['uid'],
    email: map['email'],
    password: map['password'],
    phoneNumber: map['phoneNumber'],
    userLocation: map['userLocation'],
  );
}


Map<String, dynamic> toMap(){
  return {
    'uid': uid,
    'email': email,
    'password': password,
    'phoneNumber': phoneNumber,
    'userLocation': userLocation,
  };
}

}
