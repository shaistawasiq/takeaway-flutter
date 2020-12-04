import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Preview extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Preview> {
  bool valuefirst = false;
  bool valuesecond = false;
  bool valuethird = false;
  bool valueforth = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          'Add new address',
          style: TextStyle(
              color: Colors.black,
              fontFamily: "Product Sans",
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Add address',
                  style: GoogleFonts.lato(fontSize: 14, color: Colors.grey)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text('NAME',
                        style:
                            GoogleFonts.lato(fontSize: 12, color: Colors.grey)),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: new InputDecoration(
                    hintText: 'Farhan Fauzan',
                    hintStyle: TextStyle(fontSize: 16),
                    fillColor: Colors.white,

                    //fillColor: Colors.green
                  ),
                  keyboardType: TextInputType.emailAddress,
                  style: new TextStyle(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                    child: Text('ADDRESS',
                        style:
                            GoogleFonts.lato(fontSize: 12, color: Colors.grey)),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: new InputDecoration(
                    hintText: 'Enter your address',
                    hintStyle: TextStyle(fontSize: 16),
                    fillColor: Colors.white,

                    //fillColor: Colors.green
                  ),
                  keyboardType: TextInputType.emailAddress,
                  style: new TextStyle(),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 10, right: 10),
                padding: EdgeInsets.only(top: 10),
                height: 90,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/gradBanner.png'),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(
                      color: Colors.grey,
                      width: 0.8,

                    ),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: 10, bottom: 10),
                            child: Image.asset('assets/images/locationMarker.png')),
                        Padding(
                            padding: EdgeInsets.only(left: 10, bottom: 10),
                            child: Text(
                              'Add pin point',
                              style: GoogleFonts.lato(fontSize: 14),
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 20, bottom: 10),
                          child:  IconButton(icon: Icon(Icons.arrow_forward_ios_sharp,color: Colors.black,), onPressed: (){
                              Navigator.pushNamed(context, '/TrackUserOrder');
                            })
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text('PHONE',
                        style:
                            GoogleFonts.lato(fontSize: 12, color: Colors.grey)),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: new InputDecoration(
                    hintText: 'Enter phone number',
                    hintStyle: TextStyle(fontSize: 16),
                    fillColor: Colors.white,

                    //fillColor: Colors.green
                  ),
                  keyboardType: TextInputType.number,
                  style: new TextStyle(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//  Future navigateToQuickSurveyTwo(context) async {
//   Navigator.push(context, MaterialPageRoute(builder: (context) => QuickSurveyTwo()));
// }
