import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodes/Models/Const.dart';
import 'package:foodes/Models/UserModel.dart';
import 'package:foodes/widgets/BottomNavigationBar.dart';
import 'package:foodes/widgets/IosAndroidChecks.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'ChangePassword.dart';
import 'ForgetPassword.dart';
import 'RegisterNewScreen.dart';
import 'Strings.dart';

class LoginScreen extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<LoginScreen> {
  String userEmail, userPassword;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final fireStoreInstance = Firestore.instance;
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  ProgressDialog pr;
  @override
  void initState() {
    super.initState();
    pr = ProgressDialog(context);
    pr = ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: false, showLogs: false);
  }

  void showProgress(bool isShow) async {
    if (isShow) {
      await pr.show();
    } else {
      await pr.hide();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                        Text('Login to ',
                            style: TextStyle(
                              fontFamily: "Product Sans",
                              fontSize: 32.0,
                              fontWeight: FontWeight.w500,
                            )),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text('find the best food',
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
                    Text('EMAIL',
                        style: TextStyle(
                          fontFamily: "Product Sans",
                          fontSize: 12.0,
                          color: Colors.grey,
                        )),
                    TextFormField(
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
                        hintText: 'Farhanpoozan@gmail.com',
                        hintStyle: TextStyle(
                            fontFamily: "Product Sans",
                            fontSize: 16.0,
                            color: Colors.black),
                        fillColor: Colors.white,
                        suffixIcon: new IconButton(
                          icon: new SvgPicture.asset(
                            'assets/svg/mailIcon.svg',
                            width: 20.0,
                            height: 20.0,
                          ),
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
                      child: Text('Password',
                          style: TextStyle(
                            fontFamily: "Product Sans",
                            fontSize: 12.0,
                            color: Colors.grey,
                          )),
                    ),
                    TextFormField(
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
                        hintText: '*************',
                        hintStyle: TextStyle(
                            fontFamily: "Product Sans",
                            fontSize: 16.0,
                            color: Colors.black),
                        fillColor: Colors.white,
                        suffixIcon: new IconButton(
                          icon: new SvgPicture.asset(
                            'assets/svg/lockIcon.svg',
                            width: 20.0,
                            height: 20.0,
                          ),
                          onPressed: null,
                        ),

//fillColor: Colors.green
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
                    SizedBox(
                      height: 12.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FlatButton(
                          onPressed: () {
                            navigateToForgetPassword(context);
                          },
                          child: Text(
                            "Forget Password?",
                            style: TextStyle(
                              fontFamily: "Product Sans",
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 10),
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
                              _signIn(email: userEmail, password: userPassword);


                              print("create account");
                            }
                            print('ontap');
                            //Navigator.pushNamed(context, '/QuickSurvey');
                          },
                          child: Text('Sign in',
                              style: TextStyle(
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
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(color: Colors.grey)),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10, left: 10),
                          child: Text('Dont have an account?',
                              style: TextStyle(
                                fontFamily: "Product Sans",
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              )),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                              top: 10,
                            ),
                            child: FlatButton(
                              onPressed: () {
                                navigateToResetPassword(context);
                              },
                              child: Text("Register",
                                  style: TextStyle(
                                    fontFamily: "Product Sans",
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  )),
                            ))
                      ],
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _signIn({String email, String password})  async{
    showProgress(true);
     _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((authResult) async {
      showProgress(false);
      if (authResult.user.uid == null) {
        return;
      }
      if (authResult.user.emailVerified) {
        final User user = _auth.currentUser;
        fireStoreInstance
            .collection("users")
            .doc(user.uid.toString())
            .get()
            .then((querySnapshot) {
          UserModelList userModelList =
              UserModelList.mapToUser(querySnapshot.data());
          Const.currentUser = userModelList;

          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => MyStatefulWidget()));
        });
        // do nothing

      } else {
        authResult.user.sendEmailVerification();
        Platform.isAndroid
            ? showEmailVerificationAndroidAlert(
                context, Strings.emailAlertNotVerify)
            : showEmailVerificationIosAlert(
                context, Strings.emailAlertNotVerify);
      }
    }).catchError((err) {
      showProgress(false);
      print(err.code);

      Platform.isAndroid
          ? showEmailVerificationAndroidAlert(context, err.message)
          : showEmailVerificationIosAlert(context, err.message);
    });
  }
}

Future navigateToForgetPassword(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => ForgetPassword()));
}

Future navigateToChangePassword(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => ChangePassword()));
}

Future navigateToResetPassword(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => RegisterNewScreen()));
}
