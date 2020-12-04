import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodes/Screens/FoodStyleScreen.dart';
import 'package:foodes/Screens/HomeScreen.dart';
import 'package:foodes/Screens/OrderScreen.dart';
import 'package:foodes/Screens/ProfileScreen.dart';

import '../Constants.dart';

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  final tabs = [
    HomeScreen(),
    FoodStyleScreen(),
    OrderScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: tabs[_selectedIndex],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
              canvasColor: Colors.white,
              // sets the active color of the `BottomNavigationBar` if `Brightness` is light
              primaryColor: KButtonColor,
              textTheme: Theme.of(context)
                  .textTheme
                  .copyWith(caption: new TextStyle(color: Colors.grey))), //

          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            type: BottomNavigationBarType.fixed,

            items: [
              BottomNavigationBarItem(
                icon:ImageIcon(
                  AssetImage("assets/images/homeNav.png")
                ),
                title: Text(''),
              ),
              BottomNavigationBarItem(
                icon:ImageIcon(
                    AssetImage("assets/images/cartNav.png")
                ),
                title: Text(''),
              ),

              BottomNavigationBarItem(
                icon:ImageIcon(
    AssetImage("assets/images/foodNav.png")

                ),
                title: Text(''),
              ),
              BottomNavigationBarItem(
                  icon:ImageIcon(
                      AssetImage("assets/images/profileNav.png")
                  ),
                  title: Text(''),
                  backgroundColor: Colors.white
              ),
            ],
            onTap: (index) {
              /*if(index==2)
              {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context)=>LoyaltyPointsScan()
                ));

                return;

              }*/
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ));
  }


}