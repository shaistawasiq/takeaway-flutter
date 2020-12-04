import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Password.dart';
 

 
class ChangePassword extends StatefulWidget {
  @override
  _State createState() => _State();
}
 
class _State extends State<ChangePassword> {
  String userEmail,userPassword;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        body: ListView(
          children: [
            Column(
          children: [
            Padding(padding: EdgeInsets.only(top:50,left:16),
                child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                            Text('Change ',style: GoogleFonts.lato(fontSize: 18,)),
                            Text('New Password',style: GoogleFonts.lato(fontSize: 18,)),

                           SizedBox(
                                     width: 400.0,
                                       height: 100.0,
                                         
                                       ),
                             Column(
                                         children: [
                                          Padding(padding: EdgeInsets.only(top:10,left: 20.0,),
                                          child: Text('NEW PASSWORD',style: GoogleFonts.lato(fontSize: 18,color: Colors.grey)),
                                          )
                                         ],
                                       ),
                         
                         
                             Padding(
                         padding: const EdgeInsets.only(
                              left: 20.0,
                         right: 20.0,
                           top: 10.0,
                          bottom: 16.0),
                       child: TextFormField(
                      onChanged: (pwdValue) {
                          setState(() {
                      userPassword = pwdValue;
                             });
                                 },
                        decoration: new InputDecoration(
                          hintText: 'Password2020',
                          hintStyle: TextStyle(color: Colors.black),
                          fillColor: Colors.white,
                          suffixIcon: SvgPicture.asset("assets/svg/mailbox.svg"),
                                    //fillColor: Colors.green
                          ),
                               validator: (val) {
                             if (val.isEmpty) {
                            return "password is not empty";
                            }
                               if (val.length < 8 ){
                                    return "password is not less than 8 characters";
                                  } else {
                               return null;
                              }
                             },
                          obscureText: true,
                       keyboardType: TextInputType.visiblePassword,
                           style: new TextStyle(),
                         ),
                   ),
                              
                             Column(
                                         children: [
                                          Padding(padding: EdgeInsets.only(top:10,left: 20.0,),
                                          child: Text('NEW PASSWORD',style: GoogleFonts.lato(fontSize: 18,color: Colors.grey)),
                                          )
                                         ],
                                       ),
                     Padding(
                         padding: const EdgeInsets.only(
                              left: 20.0,
                         right: 20.0,
                           top: 10.0,
                          bottom: 16.0),
                       child: TextFormField(
                      onChanged: (pwdValue) {
                          setState(() {
                      userPassword = pwdValue;
                             });
                                 },
                        decoration: new InputDecoration(
                          hintText: "Password2020",
                          hintStyle: TextStyle(color: Colors.black),
                          fillColor: Colors.white,
                          suffixIcon: Image.asset('assets/images/message.png')
                                    //fillColor: Colors.green
                          ),
                               validator: (val) {
                             if (val.isEmpty) {
                            return "password is not empty";
                            }
                               if (val.length < 8 ){
                                    return "password is not less than 8 characters";
                                  } else {
                               return null;
                              }
                             },
                          obscureText: true,
                       keyboardType: TextInputType.visiblePassword,
                           style: new TextStyle(),
                         ),
                   ),

                    Column(
                   
                   children: [
                     Padding(padding: EdgeInsets.only(top:20),
                  child:    Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Please provide your email to reset your password,please dont',style: GoogleFonts.lato(color: Colors.grey)),
                       
                    ],
                  ),
                     )
                   ],
                 ),
                
                  Column(
                   
                    children: [
                      Padding(padding: EdgeInsets.only(right:10,top:30),
                    child:   ButtonTheme(
                      minWidth: 380.0,
                       height: 50.0,
                          child: RaisedButton(
                   shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                     side: BorderSide(color: Color(0xFFf5b358))
                      ),
                      
                  color: Color(0xFFFFBD2F),
                   onPressed: () {
                               navigateToPassword(context);
                                },
                              child: Text('Change Password',style: GoogleFonts.lato(fontSize: 18)),
                                  ),
                         )
                      
                      
                      ),
                      
                    ],
                  ),
                   
                
                 ]
                 )
             )
              
             
          
            
          ],
        ),
          ],
        ),
      
    );
  }
}
 Future navigateToPassword(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Password()));
}