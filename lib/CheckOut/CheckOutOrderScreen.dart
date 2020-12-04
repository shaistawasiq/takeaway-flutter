import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodes/CheckOut/Preview.dart';
import 'package:foodes/Models/FoodCart.dart';
import 'package:provider/provider.dart';
import 'PaymentMethod.dart';
import 'SuccessfulOrder.dart';

class CheckOutOrderScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<CheckOutOrderScreen> {
  String userEmail, userPassword;

  @override
  Widget build(BuildContext context) {
return Consumer<FoodCart>(
  builder: (context,foodCart,child){
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          'Checkout order',
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
              Text('SELECT ADDRESS',
                  style: TextStyle( fontFamily: "Product Sans",color: Colors.grey, fontSize: 14)),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Farhan Fauzan',
                        style: TextStyle( fontFamily: "Product Sans",fontSize: 18)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '4536 NORTHWEST bOULEVARD, NJ',
                          style: TextStyle( fontFamily: "Product Sans",fontSize: 14),
                        ),
                        ButtonTheme(
                          minWidth: 30.0,
                          height: 30.0,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: BorderSide(color: Colors.black)),
                            color: Colors.black,
                            onPressed: () {
                              navigateToAddAddressScreen(context);
                            },
                            child: Text('Home',
                                style:TextStyle(
                                    fontFamily: "Product Sans",
                                    fontSize: 12, color: Colors.white)),
                          ),
                        ),
                        Icon(Icons.more_vert)
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 20, left: 10, right: 10),
                padding: EdgeInsets.only(top: 10),
                height: 70,
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Cashback 50% Friday',
                      style: TextStyle(
                          fontFamily: "Product Sans",
                          fontSize: 14),
                    ),
                    Container(
                      width: 80.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/cutBanner.png'),

                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text('2 Coupon',style: TextStyle(
                            color: Colors.black,
                          ),),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 14),
                        child: SvgPicture.asset('assets/svg/moneyIcon.svg'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 14),
                        child: Text(
                          'Pay Cash',
                          style: TextStyle(
                              fontFamily: "Product Sans",
                              fontSize: 16),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 10,
                        ),
                        child: Text(
                          'Fee:',
                          style: TextStyle(
                              fontFamily: "Product Sans",
                              color: Colors.grey, fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          '0.00',
                          style: TextStyle(
                              fontFamily: "Product Sans",
                              color: Colors.black, fontSize: 16),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                            top: 10,
                          ),
                          child: Icon(Icons.arrow_right))
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 20),
                    child: Text(
                      'ORDER ID',
                      style:TextStyle( fontFamily: "Product Sans",color: Colors.grey, fontSize: 14),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 20),
                    child: Text(
                      'Order id',
                      style: TextStyle( fontFamily: "Product Sans",fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Text(
                      'FDS-7850-37676-CDXX',
                      style: TextStyle( fontFamily: "Product Sans",fontSize: 16),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 20),
                    child: Text(
                      'Order date',
                      style: TextStyle( fontFamily: "Product Sans",fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Text(
                      'Today,08:00',
                      style:TextStyle( fontFamily: "Product Sans",fontSize: 16),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: const Divider(
                  color: Colors.grey,
                  height: 5,
                  thickness: 0.2,
                  indent: 2,
                  endIndent: 0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 20),
                    child: Text(
                      'ORDER DETAILS',
                      style: TextStyle( fontFamily: "Product Sans",color: Colors.grey, fontSize: 14),
                    ),
                  ),
                ],
              ),
          foodCart.foodItemBasket.length == 0 ? Container(
            alignment: Alignment.centerRight,
            child: Text('No orders yet!'),
          ):
          Container(
            height: 150.0,
            child: ListView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
                  itemCount: foodCart.foodItemBasket.length,
                  itemBuilder: (context,index){
                    return    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20, left: 20),
                          child: Text(
                            foodCart.foodItemBasket[index].foodName,
                            style:TextStyle( fontFamily: "Product Sans",fontSize: 16),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                              child: Text(
                                'X',
                                style: TextStyle( fontFamily: "Product Sans",fontSize: 16),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20, right: 20),
                              child: Text(
                                '1',
                                style: TextStyle( fontFamily: "Product Sans",fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
          ),


              Padding(
                padding: EdgeInsets.only(top: 10),
                child: const Divider(
                  color: Colors.grey,
                  height: 5,
                  thickness: 0.2,
                  indent: 2,
                  endIndent: 0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          'Total order:',
                          style: TextStyle( fontFamily: "Product Sans",fontSize: 16),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(right: 0),
                          child: ButtonTheme(
                            minWidth: 60,
                            height: 25.0,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: BorderSide(color: Color(0XFFFBF0D9))),
                              color: Color(0XFFFBF0D9),
                              onPressed: () {
                                //navigateToQuickSurveyTwo(context);
                              },
                              child: Text('Free delivery',
                                  style: TextStyle(
                                      fontFamily: "Product Sans",
                                      fontSize: 12, color: Colors.black)),
                            ),
                          )),
                      Padding(
                          padding: EdgeInsets.only(left: 20, right: 10),
                          child: Text('\$ ${foodCart.totalPrice.toString()}',
                              style: TextStyle( fontFamily: "Product Sans",fontSize: 20))),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: ButtonTheme(
                        minWidth: 300,
                        height: 50.0,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(color: Color(0xFFFFBD2F))),
                          color: Color(0xFFFFBD2F),
                          onPressed: () {
                            navigateToPaymentMethod(context);
                          },
                          child: Row(
                            children: [
                              Text('Pay now',
                                  style:TextStyle(
                                      fontFamily: "Product Sans",
                                      fontSize: 16, color: Colors.white)),
                              SizedBox(
                                width: 20.0,
                              ),
                              Container(
                                width: 30.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius:
                                    BorderRadius.circular(8.0)),
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
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );

  }
);

  }
}

Future navigateToPaymentMethod(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => PaymentMethod()));
}

Future navigateToSuccessfulOrder(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => SuccessfulOrder()));
}
Future navigateToAddAddressScreen(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => Preview()));
}
