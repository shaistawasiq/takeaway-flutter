import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodes/FoodDetails/FoodMenuItemsDetailsScreen.dart';
import 'package:foodes/Models/CartItemDetails.dart';
import 'package:google_fonts/google_fonts.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<FoodItemsList> foodItems = [
    FoodItemsList(id: 1,foodName: 'Fresh Tamagoyaki',img:"assets/images/foodItem.png",deliveryTime: 'Free',foodPrice: 6 ),
    FoodItemsList(id: 2,foodName: 'Okonomiyaki',img:"assets/images/foodItem1.png",deliveryTime: 'Free',foodPrice: 10 ),
    FoodItemsList(id: 3,foodName: 'Sushite',img:"assets/images/foodItem2.png",deliveryTime: 'Free',foodPrice: 12 ),
    FoodItemsList(id: 4,foodName: 'Fresh Tamagoyaki',img:"assets/images/foodItem.png",deliveryTime: 'Free',foodPrice: 6 ),

  ];


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return   Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        title: Text('Foodies',
          style: GoogleFonts.lato(
            fontSize: 18.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),),
        leading: IconButton(
          onPressed: (){},
          icon: ImageIcon(
            AssetImage("assets/images/navIcon.png"),
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Good morning Husnain',
                style: TextStyle(
                  fontFamily: "Product Sans",
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),),
              SizedBox(height: 12.0,),
              Text('Happy Freeyay!',
                style: TextStyle(
                  fontFamily: "Product Sans",
                  fontSize: 32.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: TextFormField(
                  onChanged: (value) {},
                  decoration: new InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    labelText: "Search food",
                      hintStyle: TextStyle(
                          fontFamily: "Product Sans",
                          fontSize: 16.0,
                          color: Colors.grey),
                    fillColor: Colors.grey[200],
                      filled: true,

                    prefixIcon: Icon(Icons.search,color: Colors.black,)

                    //fillColor: Colors.green
                  ),
                  keyboardType: TextInputType.text,
                  style: new TextStyle(),
                ),
              ),
              SizedBox(height: 30.0,),

              // tabBar
              Container(
                height: size.height,
                width: size.width,
                margin: EdgeInsets.only(bottom: 25.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: _tabSection(context),
                ),
              ),





            ],
          ),
        ),
      ),
    );
  }
}
// Home Screen Navigation
Widget _tabSection(BuildContext context) {
  final List<FoodItemsList> foodItems = [
    FoodItemsList(id: 1,foodName: 'Fresh Tamagoyaki',img:"assets/images/foodItem.png",deliveryTime: 'Free',foodPrice: 6 ),
    FoodItemsList(id: 2,foodName: 'Okonomiyaki',img:"assets/images/foodItem1.png",deliveryTime: 'Free',foodPrice: 10 ),
    FoodItemsList(id: 3,foodName: 'Sushite',img:"assets/images/foodItem2.png",deliveryTime: 'Free',foodPrice: 12 ),
    FoodItemsList(id: 4,foodName: 'Fresh Tamagoyaki',img:"assets/images/foodItem.png",deliveryTime: 'Free',foodPrice: 6 ),

  ];

  return DefaultTabController(
    length: 4,
    child: Column(
      children: <Widget>[
        Container(
          height: 40,
          child: TabBar(
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(60.0),
                color: Colors.orangeAccent,
                /*image: DecorationImage(
                  image: AssetImage('assets/images/Any.png'),
                  alignment: Alignment.topLeft,
                  scale: 0.75,
                )*/
              ),
              // indicatorSize: TabBarIndicatorSize.label,
              unselectedLabelColor: Colors.grey,
              labelColor:  Colors.black,
              labelStyle: TextStyle(
                fontSize: 18.0
              ),
              isScrollable: true,
              indicatorWeight: 4,
              indicatorColor: Colors.blue[100],
              tabs: [
                new Container(
                  width: 120.0,
                  child: Padding(
                    padding: const EdgeInsets.only(top:6.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 6.0,top: 4.0,bottom: 5.0),
                          child: Center(child: Image.asset('assets/images/tabBarIcon.png')),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 6.0,top: 4.0,bottom: 5.0),
                          child: new Tab(text: 'Breakfast',),
                        ),
                      ],
                    ),
                  ),
                ),

                new Container(
                  width: 100.0,
                  child: Padding(
                    padding: const EdgeInsets.only(top:6.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(child: Image.asset('assets/images/tabBarIcon.png')),
                        Padding(
                          padding: const EdgeInsets.only(left: 6.0),
                          child: new Tab(text: 'Lunch'),
                        ),
                      ],
                    ),
                  ),
                ),
                new Container(
                  width: 100.0,
                  child: Padding(
                    padding: const EdgeInsets.only(top:6.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(child: Image.asset('assets/images/tabBarIcon.png')),
                        Padding(
                          padding: const EdgeInsets.only(left: 6.0),
                          child: new Tab(text: 'Dinner'),
                        ),
                      ],
                    ),
                  ),
                ),
                new Container(
                  width: 100.0,
                  child: Padding(
                    padding: const EdgeInsets.only(top:6.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(child: Image.asset('assets/images/tabBarIcon.png')),
                        Padding(
                          padding: const EdgeInsets.only(left: 6.0),
                          child: new Tab(text: 'Snack'),
                        ),
                      ],
                    ),
                  ),
                ),



              ]),
        ),
        Expanded(
          //Add this to give height
          // height: MediaQuery.of(context).size.height,
          child: TabBarView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.0,),
                    Row(
                      children: [
                        Text('Suggestions for you',
                          style: TextStyle(
                              fontFamily: "Product Sans",
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold
                          ),),
                        Text(' (Japanese food)',
                          style: TextStyle(
                              fontFamily: "Product Sans",
                              color: Colors.grey,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold
                          ),),
                      ],
                    ),
                    SizedBox(height: 15.0,),
                    Container(
                      height: 350.0,
                      child: ListView.builder(

                        itemCount: foodItems.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index){
                          return InkWell(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FoodMenuItemsDetailsScreen(
                                          foodItemList: foodItems,index: index,

                                        )));
                              },
                              child: FoodMenuItems(foodItemName: foodItems[index].foodName,img: foodItems[index].img,));
                        },
                      ),
                    ),

                   /* SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          FoodMenuItems(foodItemName: 'Fresh Tamagoyaki',img: "assets/images/foodItem.png",),
                          FoodMenuItems(foodItemName: 'Okonomiyaki',img: "assets/images/foodItem1.png",),
                          FoodMenuItems(foodItemName: 'Sushite',img: "assets/images/foodItem2.png",),
                          FoodMenuItems(foodItemName: 'Fresh Tamagoyaki',img: "assets/images/foodItem.png",),

                        ],
                      ),
                    ),*/
                    SizedBox(height: 25.0,),
                   Row(
                     children: [
                       Text('Big discount resto',
                         style: TextStyle(
                             fontFamily: "Product Sans",
                             color: Colors.black,
                             fontSize: 20.0,
                             fontWeight: FontWeight.w500
                         ),),
                       Text(' (near by)',
                         style: TextStyle(
                             fontFamily: "Product Sans",
                             color: Colors.grey,
                             fontSize: 20.0,
                             fontWeight: FontWeight.bold
                         ),),
                     ],
                   ),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          BottomBannerWidget(),
                          BottomBannerWidget(),
                          BottomBannerWidget(),
                          BottomBannerWidget(),

                        ],
                      ),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  child: Wrap(
                    children: [
                      Container(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(height: 20.0,),
                              Container(),
                              Container(),
                              Container(),


                            ],
                          ),
                        ),
                      ),                ],
                  ),
                ),
                SingleChildScrollView(
                  child: Wrap(
                    children: [
                      Container(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(height: 20.0,),
                              Container(),
                              Container(),
                              Container(),


                            ],
                          ),
                        ),
                      ),                ],
                  ),
                ),
                SingleChildScrollView(
                  child: Wrap(
                    children: [
                      Container(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(height: 20.0,),
                              Container(),
                              Container(),
                              Container(),


                            ],
                          ),
                        ),
                      ),                ],
                  ),
                ),

              ]),
        ),
      ],
    ),
  );
}

// Home FoodItems List
class FoodMenuItems extends StatelessWidget {
  double padding = 8.0;
  double numItems = 1.45;
  final String img;
  final String foodItemName;
  FoodMenuItems({this.foodItemName,this.img});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: (width - padding * (numItems + 1)) / numItems,
            height: 180,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
                image: DecorationImage(
                    image: AssetImage(img),
                    fit: BoxFit.cover)),
          ),
          Container(
            width: (width - padding * (numItems + 1)) / numItems,
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25.0,),
                Text(
                  foodItemName,
                  style:TextStyle(
                      fontFamily: "Product Sans",
                      color: Colors.black,
                      fontSize: 20.0
                  ),
                ),
                SizedBox(height: 10.0,),

                Text(
                  "A delicious egg food from Japan.",
                  style: TextStyle(
                      color: Colors.grey,
                      fontFamily: "Product Sans",
                      fontSize: 12.0
                  ),
                ),
                SizedBox(height: 10.0,),
                Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: Row(
                    children: [
                     Row(
                       children: [
                         Icon(Icons.circle,size: 20,),
                         SizedBox(width: 10.0,),
                         Text('10',style: TextStyle(
                           color: Colors.black,
                           fontFamily: "Product Sans",
                         ),),
                       ],
                     ),
                      SizedBox(width: 20.0,),
                    Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          child: Icon(Icons.star,size: 20,),
                        ),
                        SizedBox(width: 10.0,),
                        Text('4',style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Product Sans",
                        ),),
                      ],
                    ),
                      SizedBox(width: 20.0,),
                  Row(
                        children: [
                         Container( width: 20,
                             height: 20,
                             child: Icon(FontAwesomeIcons.truck,size: 18.0,)),
                          SizedBox(width: 16.0,),
                          Text('Free',style: TextStyle(
                            fontFamily: "Product Sans",
                            color: Colors.black,
                          ),),
                        ],
                      ),


                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BottomBannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Row(
          children: [
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 10),
                  child: SvgPicture.asset('assets/svg/foodStyle.svg',width: 50.0,height: 60.0,),
                ),
                SizedBox(width: 8.0,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(left:10,top: 35,bottom: 5.0),
                      child: Text('Totsuki Elite',style: TextStyle(fontFamily: "Product Sans",),),),
                    Padding(padding: EdgeInsets.only(left:10,top: 5,bottom: 5.0),
                        child: Text('Black Friday 50%',style: TextStyle(fontFamily: "Product Sans",),)),
                    RatingBar(
                      initialRating: 3,
                      minRating: 1,
                      itemSize: 18.0,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),

                  ],
                ),
              ],
            ),

          ],
        ),
      ],
    );
  }
}
