import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodes/Models/Const.dart';

import '../Constants.dart';
class EditUserDetailsScreen extends StatefulWidget {
  @override
  _EditUserDetailsScreenState createState() => _EditUserDetailsScreenState();
}

class _EditUserDetailsScreenState extends State<EditUserDetailsScreen> {
  String userName;
  String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Edit',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        leading: Center(
          child: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,

                ),
              ),
            ),
          ),
        ),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                'Save',
                style: TextStyle(
                  color: KButtonColor,
                  fontWeight: FontWeight.bold,

                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(bottom: 4.0),
                child: Text('Name',style: TextStyle(fontSize: 12,color: Colors.black)),
              ),
              TextFormField(
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
                  hintText: Const.currentUser.userName.toUpperCase(),
                  hintStyle: TextStyle(
                      fontFamily: "Product Sans",
                      fontSize: 16.0,
                      color: Colors.grey),
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
                child: Text('PHONE',
                    style: TextStyle(
                      fontFamily: "Product Sans",
                      fontSize: 12.0,
                      color: Colors.black,
                    )),
              ),
              TextFormField(
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
                    hintText: Const.currentUser.userNumber,
                    hintStyle: TextStyle(
                        fontFamily: "Product Sans",
                        fontSize: 16.0,
                        color: Colors.grey),
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
            ],
          ),
        ),
      ),
    );
  }
}
