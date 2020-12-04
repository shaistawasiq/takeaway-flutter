import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:toast/toast.dart';

import 'ChangePassword.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<ForgetPassword> {
  String userEmail;
  FirebaseAuth _auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  ProgressDialog pr;
  var _controller = TextEditingController();

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
      resizeToAvoidBottomPadding: false,
      body: Form(
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
                  Text('Forgot', style: GoogleFonts.lato(fontSize: 34.0)),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text('Password?', style: GoogleFonts.lato(fontSize: 34.0)),
                ],
              ),
              SizedBox(
                height: 100.0,
              ),
              Text('EMAIL',
                  style: GoogleFonts.lato(fontSize: 14.0, color: Colors.grey)),
              TextFormField(
                controller: _controller,
                onChanged: (value) {
                  setState(() {
                    userEmail = value;
                  });
                },
                decoration: new InputDecoration(
                  hintText: "Farhanpoozan@gmail.com",
                  hintStyle: TextStyle(color: Colors.black, fontSize: 14.0),
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
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                    'Please provide your email to reset your password, please don’t'
                    ' share any data to other people.',
                    style: GoogleFonts.lato(fontSize: 14.0, color: Colors.grey)),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 30.0),
                  child: FlatButton(
                    minWidth: size.width,
                    height: 60.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: BorderSide(color: Color(0xFFFFBD2F))),
                    color: Color(0xFFFFBD2F),
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();
                        forgotPassword();
                        _controller.clear();
                      }                  },
                    child: Text('Reset Password',
                        style: GoogleFonts.lato(fontSize: 18.0)),
                  )),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Remember now? ',
                        style: GoogleFonts.lato(
                          fontSize: 18,
                        )),
                    Text('Login here',
                        style: GoogleFonts.lato(
                          fontSize: 18,
                        ))
                  ],
                ),
              ),
              Spacer(),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Text('Need help?',
                      style: GoogleFonts.lato(
                        fontSize: 18,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void showProgress(bool isShow) async {
    if (isShow) {
      await pr.show();
    } else {
      await pr.hide();
    }
  }
  Future<void> forgotPassword() async{
    showProgress(true);
    await _auth.sendPasswordResetEmail(email: userEmail).
    then((value){
    showProgress(false);
    Toast.show(
        "Reset password link is send to your account.",
        context,
        duration: Toast.LENGTH_LONG,
        gravity: Toast.CENTER);
    });
  }
  }

Future navigateToChangePassword(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => ChangePassword()));
}
