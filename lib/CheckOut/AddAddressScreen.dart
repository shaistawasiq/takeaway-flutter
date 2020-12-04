import 'package:flutter/material.dart';
import 'package:foodes/AuthScreens/RegisterSuccessful.dart';


 
class AddAddressScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}
 
class _State extends State<AddAddressScreen> {
  String userEmail,userPassword;
 
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
        
        body: Column(
        
          children: [
            Container(
              width: size.width,
              height: 120,
              child: InkWell(
                child: Row(
                  
                  children: [
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10),
                    child: Image.asset('assets/images/Any.png'),
                    ),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Padding(padding: EdgeInsets.only(left:10,top: 35),
                     child:  Text('Totsuki Elite'),),
                     Padding(padding: EdgeInsets.only(left:10,top: 5),
                     child:  Text('Black Friday 50%')),
                     
                     ],
                   ),
                      ],
                    ),
                    
                  ],
                ),
                
              ),
            ),
          ],
        ),
    );
  }
}
 Future navigateToRegisterSuccessful(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterSuccess()));
}