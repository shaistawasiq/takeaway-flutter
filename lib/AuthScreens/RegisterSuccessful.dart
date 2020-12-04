import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'QuickSurvey.dart';

class RegisterSuccess extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<RegisterSuccess> {
  String userEmail, userPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            SizedBox(
              height: 40.0,
            ),
            Text('Yeay! Ready to eat'
                ' everything?',
                style: TextStyle( fontFamily: "Product Sans",
                    fontSize: 32.0,
                    fontWeight: FontWeight.w500)),


            Padding(
              padding: EdgeInsets.only(top: 40),
              child: Image.asset(
                'assets/images/letStart.png',
                height: 250,
                width: 250,
                fit: BoxFit.contain,
              ),
            ),
            Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(right: 10, top: 80, left: 10,bottom: 30.0),
                    child: ButtonTheme(
                      minWidth: 250.0,
                      height: 50.0,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            side: BorderSide(color: Color(0xFFf5b358))),
                        color: Color(0xFFFFBD2F),
                        onPressed: () {
                          Navigator.pushNamed(context, '/BottomNavigation');
                        },
                        child: Text('Find food near you',
                            style: GoogleFonts.lato(fontSize: 18)),
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future navigateToQuickSurvey(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => QuickSurvey()));
}

