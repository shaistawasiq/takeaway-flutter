import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodes/Models/Const.dart';
import 'package:foodes/Models/UserModel.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final fireStoreInstance = Firestore.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 1500), ()  {
      final User user = _auth.currentUser;
      if (user != null && user.emailVerified) {
        fireStoreInstance
            .collection('users')
            .document(user.uid)
            .get()
            .then((querySnapshot) {
          if (querySnapshot.data == null) {
            Navigator.pushReplacementNamed(context, '/LogIn');
          }
          UserModelList userModelList = UserModelList.mapToUser(querySnapshot.data());
          Const.currentUser = userModelList;
          Navigator.pushReplacementNamed(context, '/BottomNavigation');

        });
      }
      else{
        Navigator.pushReplacementNamed(context, '/LogIn');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/img.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
