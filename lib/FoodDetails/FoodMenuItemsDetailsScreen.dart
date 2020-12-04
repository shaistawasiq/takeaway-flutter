import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodes/AuthScreens/Strings.dart';
import 'package:foodes/CheckOut/CheckOutScreen.dart';
import 'package:foodes/Constants.dart';
import 'package:foodes/Models/CartItemDetails.dart';
import 'package:foodes/Models/FoodCart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class FoodMenuItemsDetailsScreen extends StatefulWidget {
 final List<FoodItemsList> foodItemList;
 final int index;
  FoodMenuItemsDetailsScreen({this.foodItemList, this.index});
  @override
  _FoodMenuItemsDetailsScreenState createState() =>
      _FoodMenuItemsDetailsScreenState();
}

class _FoodMenuItemsDetailsScreenState
    extends State<FoodMenuItemsDetailsScreen> {

    CartItemDetails cartItemDetails;

  @override
  Widget build(BuildContext context) {
    return Consumer<FoodCart>(
      builder:(context,foodCart,child){
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            elevation: 0.0,
            title: Text(
              'Food Details',
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Product Sans",
                fontWeight: FontWeight.w500,
              ),
            ),
            actions: [
              IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: KButtonColor,
                  ),
                  onPressed: () {})
            ],
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                (Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: AssetImage(widget.foodItemList[widget.index].img),
                              fit: BoxFit.cover,
                            )),
                      ),
                      ListTile(
                        title: Text(
                          widget.foodItemList[widget.index].foodName,
                          style: TextStyle(
                            fontFamily: "Product Sans",
                            color: Colors.black,
                            fontSize: 26.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        trailing: Text(
                          '\$6.00',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Product Sans",
                            fontSize: 26.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16.0,8.0,8.0,8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            Text(
                              widget.foodItemList[widget.index].foodName,
                              style: TextStyle(
                                  fontFamily: "Product Sans",
                                  color: Colors.black,
                                  fontSize: 14.0),
                            ),
                            RatingBar(
                              initialRating: 3,
                              minRating: 1,
                              itemSize: 14.0,
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
                            Text(
                              '\$10.00',
                              style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey,
                                fontSize: 16.0,
                                fontFamily: "Product Sans",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        dense: true,
                        title: Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              '10 min',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                                fontFamily: "Product Sans",
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Icon(Icons.star,size: 20,),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              '4.5',
                              style: GoogleFonts.lato(
                                  color: Colors.black, fontSize: 14.0),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Icon(FontAwesomeIcons.truck,size: 18.0,),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              'Free delivery',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                                fontFamily: "Product Sans",
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Tamagoyaki is a type of Japanese omelette, which is'
                            ' made by rolling together several layers of cooked egg.'
                            'These are often prepared in a rectangular omelette pan'
                            'called a makiyakinabe or tamagoyakiki.',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                          height: 2.0,
                          fontFamily: "Product Sans",
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(16.0),
                            color: KButtonColor.withOpacity(0.29),
                            width: 70,
                            height: 30,
                            child: Center(
                              child: Text(
                                'Breakfast',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontFamily: "Product Sans",
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(16.0),
                            color: KButtonColor.withOpacity(0.29),
                            width: 70,
                            height: 30,
                            child: Center(
                              child: Text(
                                'Vegan',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontFamily: "Product Sans",
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(16.0),
                            color: KButtonColor.withOpacity(0.29),
                            width: 70,
                            height: 30,
                            child: Center(
                              child: Text(
                                'Japanese',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontFamily: "Product Sans",
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
                Divider(
                  color: Colors.grey,
                ),

                // bottom view after divider
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom:8.0),
                      child: Image.asset('assets/images/foodStyle.png',width: 40.0,height: 40.0,),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: Text(
                            'Fresh Tamagoyaki',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontFamily: "Product Sans",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              RatingBar(
                                initialRating: 3,
                                minRating: 1,
                                itemSize: 10.0,
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
                              SizedBox(
                                width: 10.0,
                              ),
                              Text('(431)')
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 125,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(12.0)),
                      child: FlatButton(
                          onPressed: () {
                            foodCart.addFoodItems(widget.foodItemList[widget.index]);
                            Toast.show(Strings.addOrder, context,
                                duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
                          },
                          child: Text(
                            'Add to order',
                            maxLines: 1,
                          )),
                    )
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Card(
                    elevation: 0.5,
                    color: Colors.white,
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset('assets/svg/moneyIcon.svg'),
                              SizedBox(
                                width: 12.0,
                              ),
                              Text(
                                '\$${foodCart.totalPrice}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20.0),
                              ),
                              Spacer(),
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> CheckOutScreen()));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: KButtonColor,
                                        borderRadius: BorderRadius.circular(12.0)),
                                    width: 160,
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left:12.0),
                                          child: Center(
                                            child: Text(
                                              'Place order',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.0,
                                                fontFamily: "Product Sans",
                                              ),
                                            ),
                                          ),
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Container(
                                            width: 25.0,
                                            height: 25.0,
                                            decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                BorderRadius.circular(6.0)),
                                            child: Center(
                                              child: Text(
                                                foodCart.count.toString(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
