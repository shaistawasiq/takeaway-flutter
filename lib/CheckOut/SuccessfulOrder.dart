import 'package:flutter/material.dart';
import 'package:foodes/AuthScreens/RegisterSuccessful.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessfulOrder extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<SuccessfulOrder> {
  String userEmail, userPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  Text('Yeay! Your order is \n'
                      'on the way',
                      style: GoogleFonts.lato(fontSize: 32)),

                ],
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 40),
                child: Image.asset(
                  'assets/images/male.png',
                  height: 250,
                  width: 250,
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  width: 400.0,
                  height: 50.0,
                ),
                Padding(
                    padding: EdgeInsets.only(right: 10, top: 80, left: 10),
                    child: ButtonTheme(
                      minWidth: 250.0,
                      height: 50.0,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            side: BorderSide(color: Color(0xFFf5b358))),
                        color: Color(0xFFFFBD2F),
                        onPressed: () {
                          Navigator.pushNamed(context, '/OrderStatus');
                        },
                        child: Text('Get Started',
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

Future navigateToRegisterSuccessful(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => RegisterSuccess()));
}
