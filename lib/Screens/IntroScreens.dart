import 'package:flutter/material.dart';
import 'package:foodes/AuthScreens/LoginScreen.dart';
import 'package:foodes/widgets/Buttons.dart';
class IntroScreens extends StatefulWidget {
  @override
  _IntroScreensState createState() => _IntroScreensState();
}

class _IntroScreensState extends State<IntroScreens> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/intro2.png")
                    ,
                  ),
                ),

              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MaterialButton(onPressed: (){
                        Navigator.pushReplacementNamed(context, '/IntroScreens1');
                      },color: Colors.white,
                      child: Text('Next',style: TextStyle(color: Colors.black,),),
                      ),
                    ],
                  ),
                )

              ],
            )
          ],
        ),
      ),
    );
  }
}

class Intro2 extends StatefulWidget {
  @override
  _Intro2State createState() => _Intro2State();
}

class _Intro2State extends State<Intro2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/intro2.png")
                    ,
                  ),
                ),

              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MaterialButton(onPressed: (){},color: Colors.white,
                        child: Text('Next',style: TextStyle(color: Colors.black,),),
                      ),
                    ],
                  ),
                )

              ],
            )
          ],
        ),
      ),
    );  }
}
