import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'RegisterSuccessful.dart';

class Password extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Password> {
  String userEmail, userPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: 400.0,
            height: 50.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: Text('Password', style: GoogleFonts.lato(fontSize: 18)),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 400.0,
                height: 50.0,
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Image.asset(
                  'assets/images/Password.png',
                  height: 100,
                  width: 100,
                ),
              )
            ],
          ),
          Column(
            children: [
              SizedBox(
                width: 400.0,
                height: 50.0,
              ),
              Padding(
                  padding: EdgeInsets.only(right: 10, top: 30, left: 10),
                  child: ButtonTheme(
                    minWidth: 250.0,
                    height: 50.0,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          side: BorderSide(color: Color(0xFFf5b358))),
                      color: Color(0xFFFFBD2F),
                      onPressed: () {
                        navigateToRegisterSuccessful(context);
                      },
                      child: Text('Get Started',
                          style: GoogleFonts.lato(fontSize: 18)),
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

Future navigateToRegisterSuccessful(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => RegisterSuccess()));
}
