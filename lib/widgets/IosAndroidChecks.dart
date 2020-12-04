import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodes/Models/Const.dart';


void showProgressDialog(BuildContext context) {

  AlertDialog alert = AlertDialog(
    content: new Row(
      children: [
        CircularProgressIndicator(),
        Container(margin: EdgeInsets.only(left: 5), child: Text("Loading")),
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

void showEmailVerificationAndroidAlert(BuildContext context,String description) {
  // set up the buttons
  Widget continueButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Error"),
    content: Text(description),
    actions: [
      continueButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
void showEmailVerificationIosAlert(BuildContext context,String description){
  showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text('Error'),
          content:Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                description),
          ) ,
          actions: <Widget>[
            CupertinoDialogAction(

              child: Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      });
}

void showSignOutIosAlert(BuildContext context,String description){
  showCupertinoDialog(
      context: context,
      builder: (context) {
        FirebaseAuth _auth = FirebaseAuth.instance;


        return CupertinoAlertDialog(
          title: Text('Logout',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          content:Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Text(
                description),
          ),
          actions: <Widget>[
            CupertinoDialogAction(

              child: Text('Cancel',style: TextStyle(color: Colors.blue),),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            CupertinoDialogAction(

              child: Text('Logout',style: TextStyle(color: Colors.red),),
              onPressed: ()  async {
                //SharedPreferences prefs = await SharedPreferences.getInstance();
                _auth.signOut();
                Const.currentUser=null;
                Navigator.pushNamedAndRemoveUntil(context, '/welcome', (route) => false);
              },
            ),
          ],
        );
      });
}

void showSignOutAndroidAlert(BuildContext context,String description) {
  FirebaseAuth _auth = FirebaseAuth.instance;

  // set up the buttons
  Widget noButton = FlatButton(
    child: Text('Logout',style: TextStyle(color: Colors.red),),
    onPressed: () async{
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      _auth.signOut();
      Navigator.pushNamedAndRemoveUntil(context, '/welcome', (route) => false);
      Const.currentUser=null;
    },
  );
  Widget yesButton = FlatButton(
    child: Text('Cancel',style: TextStyle(color: Colors.blue),),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Logout"),
    content: Text(description),
    actions: [
      yesButton,
      noButton,

    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
/*
void showSignOutIosAlert(BuildContext context,String description){
  showCupertinoDialog(
      context: context,
      builder: (context) {
        FirebaseAuth _auth = FirebaseAuth.instance;
        final GoogleSignIn googleSignIn = new GoogleSignIn();
        final FacebookLogin facebookSignIn = new FacebookLogin();
        final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

        return CupertinoAlertDialog(
          title: Text('Logout',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          content:Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Text(
                description),
          ),
          actions: <Widget>[
            CupertinoDialogAction(

              child: Text('Cancel',style: TextStyle(color: Colors.blue),),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            CupertinoDialogAction(

              child: Text('Logout',style: TextStyle(color: Colors.red),),
              onPressed: ()  async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                _firebaseMessaging.unsubscribeFromTopic('SelfiNotification');
                prefs.setString(Constants.FACEBOOK_KEY, null);
                _auth.signOut();
                googleSignIn.signOut();
                Constants.currentUser=null;
                Constants.favoriteList=[];
                await facebookSignIn.logOut();
                Navigator.pushNamedAndRemoveUntil(context, '/welcome', (route) => false);
              },
            ),
          ],
        );
      });
}

void showSignOutAndroidAlert(BuildContext context,String description) {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final FacebookLogin facebookSignIn = new FacebookLogin();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();



  // set up the buttons
  Widget noButton = FlatButton(
    child: Text('Logout',style: TextStyle(color: Colors.red),),
    onPressed: () async{
     // SharedPreferences prefs = await SharedPreferences.getInstance();
      _firebaseMessaging.unsubscribeFromTopic('SelfiNotification');
      _auth.signOut();
      googleSignIn.signOut();
      await facebookSignIn.logOut();
      prefs.setString(Constants.FACEBOOK_KEY, null);
      Navigator.pushNamedAndRemoveUntil(context, '/welcome', (route) => false);
      Constants.currentUser=null;
      Constants.favoriteList=[];
    },
  );
  Widget yesButton = FlatButton(
    child: Text('Cancel',style: TextStyle(color: Colors.blue),),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Logout"),
    content: Text(description),
    actions: [
      yesButton,
      noButton,

    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

void showPermissionAndroidAlert(BuildContext context) {

  // set up the buttons
  Widget noButton = FlatButton(
    child: Text('ok',style: TextStyle(fontSize: 16.0,color: Colors.red),),
    onPressed: () {
      check();
    },
  );
  Widget yesButton = FlatButton(
    child: Text('Cancel',style: TextStyle(fontSize: 16.0,color: Colors.blue),),
    onPressed: () {
      Navigator.pushReplacementNamed(context, '/Home');
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Permission"),
    content:  Text('Camera permission is required.'),
    actions: [
      yesButton,
      noButton,

    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
void showPermissionIosAlert(BuildContext context){
  showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text('Permission?',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          content:Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child:  Text('Camera permission is required.'),
          ),
          actions: <Widget>[
            CupertinoDialogAction(

              child: Text('Cancel',style: TextStyle(fontSize: 16.0,color: Colors.blue),),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/Home');
              },
            ),
            CupertinoDialogAction(

              child: Text('ok',style: TextStyle(fontSize: 16.0,color: Colors.red),),
              onPressed: () {
                check();
              },
            ),
          ],
        );
      });
}
void showInvalidQRAndroidAlert(BuildContext context,String description) {
  // set up the buttons
  Widget continueButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context)=>CurrentOffersScreen() ));
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Error"),
    content: Text(description),
    actions: [
      continueButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
void showInvalidQRIosAlert(BuildContext context,String description){
  showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text('Error'),
          content:Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                description),
          ) ,
          actions: <Widget>[
            CupertinoDialogAction(

              child: Text('OK'),
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context)=>CurrentOffersScreen() ));
              },
            )
          ],
        );
      });
}


void check() async {
  openAppSettings();

}*/
