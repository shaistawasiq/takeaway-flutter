import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodes/Constants.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Your order',
          style: TextStyle(
            fontFamily: "Product Sans",
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'READY TO CHECKOUT',
                  style: TextStyle(
                      fontFamily: "Product Sans",
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              CartCard(),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'ORDER ON THE WAY',
                style: TextStyle(
                    fontFamily: "Product Sans",
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.0,
              ),
              CartOrderView(img: "assets/images/foodItem1.png",),
              CartOrderView(img: "assets/images/foodItem2.png",),
              CartOrderView(img: "assets/images/foodItem.png",),
            ],
          ),
        ),
      ),
    );
  }
}

class CartCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(
          side: new BorderSide(color: Colors.grey, width: 1.0),
          borderRadius: BorderRadius.circular(4.0)),
      color: Colors.white,
      child: Container(
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset('assets/svg/checkOut.svg'),
            SizedBox(width: 10.0,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'View all order',
                  style: TextStyle(
                    fontFamily: "Product Sans",
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    '\$ 17.6',
                    style: TextStyle(
                      fontFamily: "Product Sans",
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
        Spacer(),
        IconButton(
            icon: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.black,
            ),
            onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

class CartOrderView extends StatelessWidget {
  final String img;
  CartOrderView({this.img});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      child: Column(
        children: [
          Row(
            children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(8.0),
                height: 80,
                width: size.width * 0.3 - 25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage(img),
                      fit: BoxFit.cover,
                    )),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text('2',style: GoogleFonts.lato(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),),
                      SizedBox(width: 10.0,),
                      Text('x',style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: "Product Sans",
                        color: Colors.black,
                      ),),
                      SizedBox(width: 10.0,),
                      Text('Okonomiyaki',style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: "Product Sans",
                        color: Colors.black,
                      ),),
                    ],
                  ),
                  SizedBox(height: 10.0,),
                  Row(
                    children: [
                      Text('2',style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: "Product Sans",
                        color: Colors.black,
                      ),),
                      SizedBox(width: 10.0,),
                      Text('x',style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: "Product Sans",
                        color: Colors.black,
                      ),),
                      SizedBox(width: 10.0,),
                      Text('Okonomiyaki',style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: "Product Sans",
                        color: Colors.black,
                      ),),
                    ],
                  ),
                  SizedBox(height: 14.0,),
                  //  SizedBox(height: 10.0,),




                ],
              ),
            ],
          ),
           SizedBox(width: 16.0,),




            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/svg/cartFood.svg'),
                SizedBox(width: 16.0,),
                Text('Totsuki Elite',style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: "Product Sans",
                  color: Colors.black,
                ),),
                SizedBox(width: 30.0,),
                Text('\$16.00',style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: "Product Sans",
                  color: Colors.black,
                ),),
              ],
            ),
          ),
          SizedBox(height: 40.0,),
          Divider(color: Colors.grey,)
        ],
      ),
    );
  }
}

