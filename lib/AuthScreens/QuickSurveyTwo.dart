import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodes/Constants.dart';
import 'package:google_fonts/google_fonts.dart';

import 'QuickSurveyThree.dart';

class QuickSurveyTwo extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<QuickSurveyTwo> {
  bool valuefirst = false;
  bool valuesecond = false;
  bool valuethird = false;
  bool valueforth = false;
  Color borderColorBt1 = Colors.grey;
  Color borderColorBt2 = Colors.grey;
  Color borderColorBt3 = Colors.grey;
  Color borderColorBt4 = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 80.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('What is your',
                        style: TextStyle(fontFamily: "Product Sans",fontSize: 34.0)),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text('Favorite food?',
                        style: TextStyle(fontFamily: "Product Sans",fontSize: 34.0)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('2/3', style: TextStyle(fontFamily: "Product Sans",fontSize: 18)),
                  ],
                ),
                SizedBox(
                  width: 10,
                  height: 50,
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  height: 90,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: borderColorBt1,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CheckboxListTile(
                        activeColor: Colors.orange,
                        secondary: Image.asset('assets/images/japani.png'),
                        title: const Text('Spicy Food',style: TextStyle(fontFamily: "Product Sans",),),
                        subtitle:
                            Text('Burn your day with spicy delicious food.',style: TextStyle(fontFamily: "Product Sans",),),
                        value: this.valuefirst,
                        onChanged: (bool value) {
                          setState(() {
                            this.valuefirst = value;
                            value ?  borderColorBt1=KButtonColor : borderColorBt1 = Colors.grey;
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
                        color: borderColorBt2,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CheckboxListTile(
                        activeColor: Colors.orange,
                        secondary: Image.asset('assets/images/burg.png'),
                        title: const Text('Tasteful food',style: TextStyle(fontFamily: "Product Sans",),),
                        subtitle: Text('Fill your lunch with various flavors.',style: TextStyle(fontFamily: "Product Sans",),),
                        value: this.valuesecond,
                        onChanged: (bool value) {
                          setState(() {
                            this.valuesecond = value;
                            value ?  borderColorBt2=KButtonColor : borderColorBt2 = Colors.grey;


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
                        color: borderColorBt3,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CheckboxListTile(
                        activeColor: Colors.orange,
                        secondary: Image.asset('assets/images/sweet.png'),
                        title: const Text('Sweat food',style: TextStyle(fontFamily: "Product Sans",),),
                        subtitle: Text('Make your day always sweet.',style: TextStyle(fontFamily: "Product Sans",),),
                        value: this.valuethird,
                        onChanged: (bool value) {
                          setState(() {
                            this.valuethird = value;
                            value ?  borderColorBt3=KButtonColor : borderColorBt3 = Colors.grey;


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
                        color: borderColorBt4,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CheckboxListTile(
                        activeColor: Colors.orange,
                        secondary: Image.asset('assets/images/Any.png'),
                        title: const Text('Any Food',style: TextStyle(fontFamily: "Product Sans",),),
                        subtitle:
                            Text('Try a variety of typical Indonesian food.',style: TextStyle(fontFamily: "Product Sans",),),
                        value: this.valueforth,
                        onChanged: (bool value) {
                          setState(() {
                            this.valueforth = value;
                            value ?  borderColorBt4=KButtonColor : borderColorBt4 = Colors.grey;


                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                  height: 50,
                ),
                Row(
                  children: [
                    Text('Skip for now',
                        style:
                            TextStyle(fontFamily: "Product Sans",fontSize: 18, color: Colors.grey)),
                    Spacer(),
                    ButtonTheme(
                      minWidth: 160,
                      height: 50.0,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            side: BorderSide(color: Color(0xFFf5b358))),
                        color: Color(0xFFFFBD2F),
                        onPressed: () {
                          navigateToQuickSurveyThree(context);
                        },
                        child:
                            Text('Next', style: TextStyle(fontFamily: "Product Sans",fontSize: 18)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future navigateToQuickSurveyThree(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => QuickSurveyThree()));
}
