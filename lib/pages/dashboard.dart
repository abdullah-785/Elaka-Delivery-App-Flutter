import 'package:elaka_delivery_app/models/postModel.dart';
import 'package:elaka_delivery_app/pages/wallet.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:housesales/models/postModel.dart';
// import 'package:housesales/pages/home_page.dart';
import 'package:uuid/uuid_util.dart';
// import 'home_page.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final Reference stroageref = FirebaseStorage.instance.ref();
final postRef = FirebaseFirestore.instance.collection("posts");

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List ListItem = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11"];
  String? bedroomsvar;
  String? bathroomsvar;
  String? garegevar;

  List propertyTypesList = [
    "House",
    "Plats",
    "Shops",
    "Factories",
    "Socities",
    "Flats"
  ];
  String? propertyType;

  TextEditingController _squareFootController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _locationController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  // UploadTask? task;
  File? file;
  String? imageUrl;

  var uuid;

  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? basename(file!.path) : "No file Selected";

    return Scaffold(
      appBar: AppBar(
        title: "Welcome To Dashboard".text.xl3.make().centered(),
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                HeightBox(15),
                GestureDetector(
                  onTap: () {
                    selectFile();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        image: DecorationImage(
                          image: file == null
                              ? AssetImage("images/uploadImageVector.jpg")
                              : Image.file(file!).image,
                          fit: BoxFit.fill,
                        )),
                  ),
                ),
                HeightBox(25),
                // "Post Now".text.xl4.fontWeight(FontWeight.bold).color(Colors.green).make().centered()
                TextFormField(
                  controller: _squareFootController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.square_foot),
                      label: Text("Square Foot"),
                      hintText: "1616",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      )),
                ),
                HeightBox(15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        // width: 10,
                        height: 90,
                        decoration: BoxDecoration(
                          // color: Color,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            "Bedrooms"
                                .text
                                .minFontSize(22)
                                .color(Colors.grey)
                                .fontWeight(FontWeight.bold)
                                .make(),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: DropdownButton(
                                dropdownColor: Colors.white,
                                icon: Icon(Icons.arrow_drop_down,
                                    color: Colors.grey),
                                iconSize: 36,
                                isExpanded: true,
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                                elevation: 10,
                                hint: "0".text.color(Colors.grey).make(),
                                value: bedroomsvar,
                                underline: Container(
                                  decoration: const ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: 1.0,
                                          style: BorderStyle.solid,
                                          color: Colors.grey),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                    ),
                                  ),
                                ),
                                onChanged: (newValue) {
                                  // valuechoose = newValue
                                  setState(() {
                                    bedroomsvar = newValue as String?;
                                    // print(bedroomsvar);
                                  });
                                },
                                items: ListItem.map((valueItem) {
                                  return DropdownMenuItem(
                                    value: valueItem,
                                    child: Text(valueItem),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      )),
                      WidthBox(10),

                      // Second Expanded
                      Expanded(
                          child: Container(
                        // width: 10,
                        height: 90,
                        decoration: BoxDecoration(
                          // color: Color.fromARGB(255, 81, 208, 85),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            "Bathrooms"
                                .text
                                .minFontSize(22)
                                .color(Colors.grey)
                                .fontWeight(FontWeight.bold)
                                .make(),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: DropdownButton(
                                dropdownColor: Colors.white,
                                icon: Icon(Icons.arrow_drop_down,
                                    color: Colors.grey),
                                iconSize: 36,
                                isExpanded: true,
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                                elevation: 10,
                                hint: "0".text.color(Colors.grey).make(),
                                value: bathroomsvar,
                                underline: Container(
                                  decoration: const ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: 1.0,
                                          style: BorderStyle.solid,
                                          color: Colors.grey),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                    ),
                                  ),
                                ),
                                onChanged: (newValue) {
                                  // valuechoose = newValue
                                  setState(() {
                                    bathroomsvar = newValue as String?;
                                  });
                                },
                                items: ListItem.map((valueItem) {
                                  return DropdownMenuItem(
                                    value: valueItem,
                                    child: Text(valueItem),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      )),

                      WidthBox(10),
                      // Third Expanded
                      Expanded(
                          child: Container(
                        // width: 10,
                        height: 90,
                        decoration: BoxDecoration(
                          // color: Color.fromARGB(255, 81, 208, 85),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            "Garege"
                                .text
                                .minFontSize(22)
                                .color(Colors.grey)
                                .fontWeight(FontWeight.bold)
                                .make(),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: DropdownButton(
                                dropdownColor: Colors.white,
                                icon: Icon(Icons.arrow_drop_down,
                                    color: Colors.grey),
                                iconSize: 36,
                                isExpanded: true,
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                                elevation: 10,
                                hint: "0".text.color(Colors.grey).make(),
                                value: garegevar,
                                underline: Container(
                                  decoration: const ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: 1.0,
                                          style: BorderStyle.solid,
                                          color: Colors.grey),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                    ),
                                  ),
                                ),
                                onChanged: (newValue) {
                                  // valuechoose = newValue
                                  setState(() {
                                    garegevar = newValue as String?;
                                  });
                                },
                                items: ListItem.map((valueItem) {
                                  return DropdownMenuItem(
                                    value: valueItem,
                                    child: Text(valueItem),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      )),
                    ],
                  ),
                ),

                HeightBox(30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: DropdownButton(
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.arrow_drop_down, color: Colors.grey),
                    iconSize: 36,
                    isExpanded: true,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    elevation: 10,
                    hint: "Select Property Type".text.color(Colors.grey).make(),
                    value: propertyType,
                    underline: Container(
                      decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              width: 1.0,
                              style: BorderStyle.solid,
                              color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                      ),
                    ),
                    onChanged: (newValue) {
                      // valuechoose = newValue
                      setState(() {
                        propertyType = newValue as String?;
                      });
                    },
                    items: propertyTypesList.map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                  ),
                ),

                const HeightBox(15),
                TextFormField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.price_check),
                      label: Text("Amount"),
                      hintText: "Enter Amount",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                ),
                HeightBox(15),
                TextFormField(
                  controller: _locationController,
                  keyboardType: TextInputType.multiline,
                  // maxLines: null,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.location_city_outlined),
                      label: Text("Location"),
                      hintText: "Enter Property Location",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                ),
                HeightBox(15),
                TextFormField(
                  controller: _descriptionController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: const InputDecoration(

                      // prefixIcon: Icon(Icons.price_check),
                      label: Text("Description"),
                      hintText: "Enter other details about your post",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                ),
                HeightBox(25),

                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                    onPressed: () async {
                      if (file == null) {
                        Fluttertoast.showToast(msg: "Please Select an Image");
                        return;
                      }

                      //  UploadTask uploadTask = stroageref.child("post_$postId.jpg").putFile(file!);
                      //  TaskSnapshot stroageSnapshot =  await uploadTask;
                      //  imageUrl =  await stroageSnapshot.ref.getDownloadURL();

                      //    final User? user = _auth.currentUser;
                      //     final _uid = user!.uid;

                      //  postRef.doc(user).collection("userPosts").doc(postId).

                      String postId = Uuid().v4();
                      try {
                        final ref = FirebaseStorage.instance
                            .ref()
                            .child("postImage")
                            .child(DateTime.now().toString());
                        await ref.putFile(file!);
                        imageUrl = await ref.getDownloadURL();

                        final User? user = _auth.currentUser;
                        final _uid = user!.uid;

                        PostModel postModel = PostModel();
                        DateTime now = DateTime.now();
                        String formattedDate = DateFormat.yMMMEd().format(now);

                        postModel.uid = user.uid;
                        postModel.postId = postId;
                        postModel.postImageUrl = imageUrl;
                        postModel.squareFoot = _squareFootController.text;
                        postModel.bedroomsvar = bedroomsvar;
                        postModel.bathroomsvar = bathroomsvar;
                        postModel.garegevar = garegevar;
                        postModel.propertyType = propertyType;
                        postModel.amount = _amountController.text;
                        postModel.description = _descriptionController.text;
                        postModel.address = _locationController.text;
                        postModel.createdAt = formattedDate;

                        FirebaseFirestore.instance
                            .collection("posts")
                            .doc(postId)
                            .set(postModel.toMap());
                        Fluttertoast.showToast(msg: "Post are Uploaded ");

                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Wallet()));

                        // FirebaseFirestore.instance.col
                        // FirebaseFirestore.instance
                        //     .collection('posts')
                        //     .doc(postId)
                        //     .set({
                        //   'id': _uid,
                        //   "postId": postId,
                        //   'userImage': imageUrl,
                        //   'squareFoot': _squareFootController.text,
                        //   'bedrooms': bedroomsvar,
                        //   'bathrooms': bathroomsvar,
                        //   'garege': garegevar,
                        //   'amount': _amountController.text,
                        //   'description': _descriptionController.text,
                        //   'createdAt': Timestamp.now(),
                        // });
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => HomeToo()));
                      } catch (error) {
                        Fluttertoast.showToast(msg: error.toString());
                        print(error.toString());
                      }
                    },
                    child: "Post".text.xl2.fontWeight(FontWeight.bold).make(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path!;

    setState(() => file = File(path));
  }
}
