import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodes/AuthScreens/QuickSurveyTwo.dart';
import 'package:foodes/widgets/Buttons.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Constants.dart';

class PaymentMethod extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<PaymentMethod> {

  bool valuefirst = false;
  bool valuesecond = false;
  bool valuethird = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0.0,
        title: Text(
          'Checkout order',
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Product Sans",
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {},
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/addIcon.png'))),
                ),
              ),
            ),
          )
        ],
      ),
      body: Container(
          padding: new EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                width: 10,
                height: 26,
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                height: 90,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 0.2,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CheckboxListTile(
                      activeColor: Colors.orange,
                      secondary:  SvgPicture.asset('assets/svg/paymentCash.svg'),
                      title: const Text(
                        'Pay cash on delivery',
                        style: TextStyle(fontSize: 18),
                      ),
                      subtitle:
                          Text('Fee: 0.00', style: TextStyle(fontSize: 12)),
                      value: this.valuefirst,
                      onChanged: (bool value) {
                        setState(() {
                          this.valuefirst = value;
                          this.valuesecond = false;
                          this.valuethird = false;

                        });
                      },
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.only(top: 10),
                height: 90,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 0.2,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CheckboxListTile(
                      activeColor: Colors.orange,
                      secondary:Icon( FontAwesomeIcons.creditCard,color: Colors.black,),
                      title: const Text(
                        'Credit Card',
                        style: TextStyle(fontSize: 18),
                      ),
                      subtitle:
                          Text('Fee: 1.20', style: TextStyle(fontSize: 12)),
                      value: this.valuesecond,
                      onChanged: (bool value) {
                        setState(() {
                          this.valuefirst = false;
                          this.valuesecond = value;
                          this.valuethird = false;


                        });
                      },
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.only(top: 10),
                height: 90,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 0.2,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CheckboxListTile(
                      activeColor: Colors.orange,
                      secondary:  SvgPicture.asset('assets/svg/paypal.svg'),
                      title: const Text(
                        'Paypal',
                        style: TextStyle(fontSize: 18),
                      ),
                      subtitle:
                          Text('Fee: 0.99', style: TextStyle(fontSize: 12)),
                      value: this.valuethird,
                      onChanged: (bool value) {
                        setState(() {
                          this.valuethird = value;
                          this.valuesecond = false;
                          this.valuefirst = false;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50.0,),
            valuefirst || valuesecond || valuethird ?? false ?
             RoundButton(text: 'Next', color: KButtonColor, textColor: Colors.white, function: (){
               Navigator.pushNamed(context, '/SuccessFullyOrder');



             })  : Container()
            ],
          )),
    );
  }
}

Future navigateToQuickSurveyTwo(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => QuickSurveyTwo()));
}
