import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodes/Screens/HomeScreen.dart';
class FoodStyleDetails extends StatefulWidget {
  @override
  _FoodStyleDetailsState createState() => _FoodStyleDetailsState();
}

class _FoodStyleDetailsState extends State<FoodStyleDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        title: Text('Food Style',
          style: TextStyle(
            fontFamily: "Product Sans",
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){

              },
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/addIcon.png')
                      )
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [

              Center(child: SvgPicture.asset('assets/svg/banner.svg')),
              SizedBox(height: 20.0,),
              Row(
                children: [
                  Text('Breakfast',
                    style: TextStyle(
                        fontFamily: "Product Sans",
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500
                    ),),
                  Text(' (Fastest food)',
                    style: TextStyle(
                        fontFamily: "Product Sans",
                        color: Colors.grey,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500
                    ),),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    FoodMenuItems(foodItemName: 'Fresh Tamagoyaki',img: "assets/images/foodItem.png",),
                    FoodMenuItems(foodItemName: 'Okonomiyaki',img: "assets/images/foodItem1.png",),
                    FoodMenuItems(foodItemName: 'Sushite',img: "assets/images/foodItem2.png",),
                    FoodMenuItems(foodItemName: 'Fresh Tamagoyaki',img: "assets/images/foodItem.png",),

                  ],
                ),
              ),
              Row(
                children: [
                  Text('Lunch',
                    style: TextStyle(
                        fontFamily: "Product Sans",
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500
                    ),),
                  Text(' (Japanese food)',
                    style: TextStyle(
                        fontFamily: "Product Sans",
                        color: Colors.grey,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500
                    ),),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    FoodMenuItems(foodItemName: 'Okonomiyaki',img: "assets/images/foodItem1.png",),
                    FoodMenuItems(foodItemName: 'Sushite',img: "assets/images/foodItem2.png",),
                    FoodMenuItems(foodItemName: 'Fresh Tamagoyaki',img: "assets/images/foodItem.png",),


                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
