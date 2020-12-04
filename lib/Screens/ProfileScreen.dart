import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodes/Constants.dart';
import 'package:foodes/Models/Const.dart';
import 'package:foodes/Models/UserModel.dart';
import 'package:foodes/widgets/ImagePicker.dart';
import 'package:foodes/widgets/Progressbar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission/permission.dart';
class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final fireStoreInstance = Firestore.instance;
  Future<File> imageFile;
  UserModelList userModelList;
  File image;
  final picker = ImagePicker();

  void pickImage(ImageSource imageSource) async {
    PickedFile galleryImage =
    await picker.getImage(source: imageSource, imageQuality: 40);
    setState(() {
      image = File(galleryImage.path);
    });
    updateImage();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        title: Text("Profile",style: TextStyle(fontFamily: "Product Sans",color: Colors.black),),

      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  InkWell(
                    onTap: (){
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              color: Color(0xFF737373),
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).canvasColor,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10)),
                                  ),
                                  child: CameraGalleryBottomSheet(
                                    cameraClick: () =>
                                        pickImage(ImageSource.camera),
                                    galleryClick: () =>
                                        pickImage(ImageSource.gallery),
                                  )),
                            );
                          });
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: image == null
                            ? CachedNetworkImage(
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                          imageUrl:
                          Const.currentUser?.userImage ?? "",
                          placeholder: (context, url) =>
                              NativeProgress(),
                          errorWidget: (context, url, error) =>
                              ClipRRect(
                                  child: Icon(
                                    Icons.person,
                                    size: 50,
                                  )),
                        )
                            : Image.file(
                          image,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(Const.currentUser.userName.toUpperCase(),style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Product Sans",
                            fontSize: 26.0
                        ),),
                        Text('Supreme',style: TextStyle(
                          color: Colors.grey,
                          fontFamily: "Product Sans",
                        )),

                      ],
                    ),
                  ),
                ],
              ),


              SizedBox(height: 10.0,),
              Text('Personal',style: TextStyle(
                  fontFamily: "Product Sans",
                  color: Colors.grey,
                fontSize: 18.0
              )),
              SizedBox(height: 10.0,),

              SettingsListTile(
                icon: "assets/svg/Location.svg",
                title: "Location",
                onTap: () {
                  /* Navigator.pushNamed(context, '/Terms_Conditions');*/
                },
              ),
              SettingsListTile(
                icon: "assets/svg/Payment.svg",
                title: "Payment",
                onTap: () {
                  /* Navigator.pushNamed(context, '/Terms_Conditions');*/
                },
              ),
              SettingsListTile(
                icon: "assets/svg/Info.svg",
                title: "Information",
                onTap: () {
                   Navigator.pushNamed(context, '/UserDetailsScreen');
                },
              ),
              SettingsListTile(
                icon: "assets/svg/Security.svg",
                title: "Security",
                onTap: () {
                  /* Navigator.pushNamed(context, '/Terms_Conditions');*/
                },
              ),
              Text('Notifications'),
              SizedBox(height: 20.0,),
              LogOutTile(
                iconData: FontAwesomeIcons.percentage,
                title: "Discount",
                onTap: () {
                  /* Navigator.pushNamed(context, '/Terms_Conditions');*/
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
  void updateImage() async {
    final User user = _auth.currentUser;
    FirebaseStorage.instance
        .ref()
        .child("user_image/" + user.uid)
        .putFile(image)
        .then((value) async {
      final String downloadUrl = await value.ref.getDownloadURL();
      UserModelList user = Const.currentUser;
      user.userImage = downloadUrl;
      Const.currentUser = user;
      updateUser();
    });
  }
  void updateUser() async {
    UserModelList user = Const.currentUser;
    Firestore.instance
        .collection("users")
        .document(user.userUid)
        .setData(user.toMap())
        .then((value) {})
        .catchError((error) {});
  }
}

// ignore: must_be_immutable
class SettingsListTile extends StatelessWidget {
  String icon;
  String title;
  Function onTap;

  SettingsListTile({this.icon, this.title, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        child: InkWell(
          onTap: onTap,
          child: Column(
            children: <Widget>[
              ListTile(
                leading:  SvgPicture.asset(icon),

                title: Text(
                  title,
                  style: TextStyle(
                      fontFamily: "Product Sans",
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500

                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 12.0, right: 12.0),
                child: Divider(
                  color: Colors.grey.withOpacity(0.3),
                ),
              )
            ],
          ),
        ),
        color: Colors.transparent,
      ),
      color: Colors.white,
    );
  }

}


// ignore: must_be_immutable
class LogOutTile extends StatelessWidget {
  IconData iconData;
  String title;
  Function onTap;
  bool status = true;


  LogOutTile({this.iconData, this.title, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          ListTile(
            leading:SvgPicture.asset("assets/svg/discIcon.svg"),
            title: Text(
              title,
              style: TextStyle(
                  fontFamily: "Product Sans",
                  color: Colors.black,                  fontSize: 18.0,
                  fontWeight: FontWeight.w500

              ),
            ),
            trailing: SizedBox(
              width: 60,
              height: 80,
              child: Switch(activeColor: KButtonColor,
                value: status,
                onChanged: (value) {
                  print("VALUE : $value");
                 /* setState(() {
                    status = value;
                  });*/
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12.0, right: 12.0),
            child: Divider(
              color: Colors.grey.withOpacity(0.3),
            ),
          )
        ],
      ),
      color: Colors.white,
    );
  }

}