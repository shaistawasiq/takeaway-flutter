import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodes/Models/UserModel.dart';
import 'package:foodes/widgets/IosAndroidChecks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:toast/toast.dart';

import 'Strings.dart';

class RegisterNewScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<RegisterNewScreen> {
  String userEmail, userPassword;
  final formKey = GlobalKey<FormState>();
  String phoneNumber;
  String userName;
  FirebaseAuth _auth = FirebaseAuth.instance;
  final fireStoreInstance = Firestore.instance;
  var _controller = TextEditingController();

  // progress bar
  bool isLoading = false;
  ProgressDialog pr;

  @override
  void initState() {
    super.initState();
    pr = ProgressDialog(context);
    pr = ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: false, showLogs: false);
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 80.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Register',
                        style: TextStyle(
                          fontFamily: "Product Sans",
                          fontSize: 32.0,
                          fontWeight: FontWeight.w500,
                        )),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text('New account',
                        style: TextStyle(
                          fontFamily: "Product Sans",
                          fontSize: 32.0,
                          fontWeight: FontWeight.w500,
                        )),
                  ],
                ),
                SizedBox(
                  height: 80.0,
                ),
                Text('FULL NAME',
                    style: TextStyle(
                      fontFamily: "Product Sans",
                      fontSize: 12.0,
                      color: Colors.grey,
                    )),
                TextFormField(
                  controller: _controller,
                  onChanged: (value) {
                    setState(() {
                      userName = value;
                    });
                  },
                  decoration: new InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        //  when the TextFormField in focused
                      ),
                      hintText: 'Farhan Fauzan',
                      hintStyle: TextStyle(
                          fontFamily: "Product Sans",
                          fontSize: 16.0,
                          color: Colors.black),
                      fillColor: Colors.white,
                    suffixIcon: new IconButton(
                      icon: new SvgPicture.asset('assets/svg/nameIcon.svg',width: 20.0,height: 20.0,),
                      onPressed: null,
                    ),

                      //fillColor: Colors.green
                      ),
                  validator: (val) {
                    if (val.isEmpty) {
                      return "name is not empty";
                    }
                    if (val.length < 3) {
                      return "name is not less than 3 characters";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.text,
                  style: new TextStyle(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Text('EMAIL',
                      style: TextStyle(
                        fontFamily: "Product Sans",
                        fontSize: 12.0,
                        color: Colors.grey,
                      )),
                ),
                TextFormField(
                  controller: _controller,
                  onChanged: (value) {
                    setState(() {
                      userEmail = value;
                    });
                  },
                  decoration: new InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        //  when the TextFormField in focused
                      ),
                      hintText: "Farhanpoozan@gmail.com",
                      hintStyle: TextStyle(
                          fontFamily: "Product Sans",
                          fontSize: 16.0,
                          color: Colors.black),
                      fillColor: Colors.white,
                    suffixIcon: new IconButton(
                      icon: new SvgPicture.asset('assets/svg/mailIcon.svg',width: 20.0,height: 20.0,),
                      onPressed: null,
                    ),

                      //fillColor: Colors.green
                      ),
                  validator: (emailValue) {
                    if (emailValue.isEmpty) {
                      return "Email cannot be empty";
                    }

                    String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
                        "\\@" +
                        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
                        "(" +
                        "\\." +
                        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
                        ")+";
                    RegExp regExp = new RegExp(p);

                    if (regExp.hasMatch(emailValue)) {
                      // So, the email is valid
                      return null;
                    }

                    return 'This is not a valid email';
                  },
                  keyboardType: TextInputType.emailAddress,
                  style: new TextStyle(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Text('PHONE',
                      style: TextStyle(
                        fontFamily: "Product Sans",
                        fontSize: 12.0,
                        color: Colors.grey,
                      )),
                ),
                TextFormField(
                  controller: _controller,
                  onChanged: (value) {
                    setState(() {
                      phoneNumber = value;
                    });
                  },
                  decoration: new InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        //  when the TextFormField in focused
                      ),
                      hintText: "Enter phone number",
                      hintStyle: TextStyle(
                          fontFamily: "Product Sans",
                          fontSize: 16.0,
                          color: Colors.black),
                      fillColor: Colors.white,
                      suffixIcon: Icon(Icons.phone_iphone_outlined,color: Colors.black,size: 24.0,)

                      //fillColor: Colors.green
                      ),
                  keyboardType: TextInputType.number,
                  style: new TextStyle(),
                  validator: (val) {
                    if (val.isEmpty) {
                      return "phone number is not empty";
                    }
                    if (val.length < 11) {
                      return "phone number is not less than 11 characters";
                    } else {
                      return null;
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Text('PASSWORD',
                      style: TextStyle(
                        fontFamily: "Product Sans",
                        fontSize: 12.0,
                        color: Colors.grey,
                      )),
                ),
                TextFormField(
                  controller: _controller,
                  onChanged: (pwdValue) {
                    setState(() {
                      userPassword = pwdValue;
                    });
                  },
                  decoration: new InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        //  when the TextFormField in focused
                      ),
                      hintText: "Enter Password",
                      hintStyle: TextStyle(
                          fontFamily: "Product Sans",
                          fontSize: 16.0,
                          color: Colors.black),
                      fillColor: Colors.white,
                    suffixIcon: new IconButton(
                      icon: new SvgPicture.asset('assets/svg/lockIcon.svg',width: 20.0,height: 20.0,),
                      onPressed: null,
                    ),                    //fillColor: Colors.green
                      ),
                  validator: (val) {
                    if (val.isEmpty) {
                      return "password is not empty";
                    }
                    if (val.length < 8) {
                      return "password is not less than 8 characters";
                    } else {
                      return null;
                    }
                  },
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  style: new TextStyle(),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: FlatButton(
                      minWidth: size.width,
                      height: 65.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: BorderSide(color: Color(0xFFFFBD2F))),
                      color: Color(0xFFFFBD2F),
                      onPressed: () {
                        if (formKey.currentState.validate()) {
                          formKey.currentState.save();
                          addNewUser(userEmail, userPassword);
                          _controller.clear();
                          print("create account");
                        }
                       // Navigator.pushReplacementNamed(context, '/LogIn');
                      },
                      child:
                          Text('Register', style: TextStyle(
                            fontFamily: "Product Sans",
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          )),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: FlatButton.icon(
                    minWidth: size.width,
                    height: 65.0,
                    onPressed: () {
                      //  navigateToResetPassword(context);
                    },
                    icon: Icon(
                      FontAwesomeIcons.facebook,
                      color: Colors.black,
                    ),
                    label: Text('Sign up with Facebook',
                        style: TextStyle(
                          fontFamily: "Product Sans",
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        )),

                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: BorderSide(color: Colors.grey)),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20, right: 10, bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have an account? ',
                              style: TextStyle(
                                fontFamily: "Product Sans",
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              )),
                          Material(
                              color: Colors.transparent,
                              child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Login',
                                      style: TextStyle(
                                        fontFamily: "Product Sans",
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      )),))
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  // loading bar
  void showProgress(bool isShow) async {
    if (isShow) {
      await pr.show();
    } else {
      await pr.hide();
    }
  }

  // create new user
Future<void> addNewUser(String email, String password) async{
  showProgress(true);
 await _auth
      .createUserWithEmailAndPassword(email: email, password: password)
      .then((authResult) async {
    showProgress(false);
    if (authResult.user.uid != null) {
      try {
        Toast.show(Strings.accountCreateSuccess, context,
            duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
        UserModelList user = UserModelList();
        user.userUid = authResult.user.uid;
        user.userName = userName;
        user.userEmail = userEmail;
        user.userNumber = phoneNumber;
        authResult.user.sendEmailVerification();
        Toast.show(Strings.emailVerificationSendAlert, context,
            duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
        fireStoreInstance
            .collection("users")
            .doc(authResult.user.uid)
            .set(user.toMap())
            .then((value) {
          showProgress(false);
          _auth.signOut();
        });
      } catch (e) {
        print(e.message);
      }
    }

    // home page
  }).catchError((err) {
    print(err.code);
    showProgress(false);
    Platform.isIOS
        ? showEmailVerificationIosAlert(context, err.message)
        : showEmailVerificationAndroidAlert(context, err.message);
  });
}}
