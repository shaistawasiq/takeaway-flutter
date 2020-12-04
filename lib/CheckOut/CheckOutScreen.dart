import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodes/AuthScreens/Strings.dart';
import 'package:foodes/Models/CartItemDetails.dart';
import 'package:foodes/Models/FoodCart.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import '../Constants.dart';
class CheckOutScreen extends StatefulWidget {
/*CartItemDetails cartItemDetails;
CheckOutScreen(this.cartItemDetails);*/
  @override
  _CheckOutScreenState createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  int cartValue = 1;

  @override
  Widget build(BuildContext context) {
   /* print(widget.cartItemDetails.deliveryTime);
    print(widget.cartItemDetails.foodPrice);*/
    Size size = MediaQuery.of(context).size;
    return Consumer<FoodCart>(
      builder: (context,foodCart,child){
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            elevation: 0.0,
            title: Text('Checkout order',
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Product Sans",
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
          body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                 foodCart.foodItemBasket.length == 0 ?
                 Padding(
                   padding: const EdgeInsets.only(top:50.0),
                   child: Center(child: Text('No items in cart!',
                     style: TextStyle(fontSize: 18.0,color: Colors.grey),)),
                 )
                     :
                  Container(
                    height: 450.0,
                    child: ListView.builder(
                      physics: AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: foodCart.foodItemBasket.length,
                    itemBuilder: (context,index){
                      return   Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(6.0),
                                      height: 70,
                                      width: 65,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.0),
                                          image: DecorationImage(
                                            image: AssetImage(foodCart.foodItemBasket[index].img),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 20.0,left: 5.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [

                                              Text('2',style: TextStyle(
                                                fontFamily: "Product Sans",
                                                color: Colors.black,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                              ),),
                                              SizedBox(width: 12.0,),
                                              Text('X',style: TextStyle(
                                                fontFamily: "Product Sans",
                                                color: Colors.black,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                              ),),
                                              SizedBox(width: 12.0,),

                                              Text(foodCart.foodItemBasket[index].foodName,style: TextStyle(
                                                fontFamily: "Product Sans",
                                                color: Colors.black,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w500,
                                              ),),
                                              SizedBox(width: 16.0,),
                                              Text('\$12.00',style: TextStyle(
                                                fontFamily: "Product Sans",
                                                color: Colors.grey,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w500,
                                              ),)
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 20.0,left: 5.0),
                                          child: Row(
                                            children: [

                                              SvgPicture.asset('assets/svg/cartFood.svg'),
                                              SizedBox(width: 6.0,),
                                              Text('Totsuki Elite',style: TextStyle(
                                                fontFamily: "Product Sans",
                                                color: Colors.black,
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w500,
                                              ),),
                                              SizedBox(width: 12.0,),
                                              Container(
                                                width: 20,
                                                height: 20,
                                                child:SvgPicture.asset('assets/svg/timeIcon.svg'),
                                              ),
                                              SizedBox(width: 6.0,),
                                              Text('10 min',style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0,
                                                fontFamily: "Product Sans",
                                              ),),
                                              SizedBox(width: 55.0,),
                                              Text('')

                                            ],

                                          ),
                                        ),

                                      ],
                                    ),

                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 25.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Material(
                                    child: InkWell(
                                      onTap: (){
                                        setState(() {
                                          if(cartValue<=1){
                                            return;
                                          }
                                          cartValue --;
                                        });
                                      },
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15.0),
                                            border: Border.all(
                                              color: Colors.black,
                                              width: 2.0,
                                            )
                                        ),
                                        child:  Center(
                                          child: Text('-',style: TextStyle(
                                            fontFamily: "Product Sans",
                                            color: Colors.black,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w500,
                                          ),),
                                        ),
                                      ),
                                    ),
                                    color: Colors.transparent,
                                  ),
                                  SizedBox(width: 20.0,),
                                  Text('$cartValue',style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontFamily: "Product Sans",
                                    color: Colors.black,
                                    fontSize: 26.0,
                                    fontWeight: FontWeight.w500,
                                  ),),
                                  SizedBox(width: 20.0,),
                                  Material(
                                    child: InkWell(
                                      onTap: (){
                                        setState(() {
                                          cartValue ++;
                                        });
                                      },
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15.0),
                                          color: Colors.black,
                                        ),
                                        child:  Center(
                                          child: Text('+',style: TextStyle(
                                            fontFamily: "Product Sans",
                                            color: Colors.white,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w500,
                                          ),),
                                        ),
                                      ),
                                    ),
                                    color: Colors.transparent,
                                  ),
                                  SizedBox(width: 20.0,),
                                  IconButton(icon: Icon(Icons.delete,color: Colors.black,size: 20.0),onPressed: (){
                                    foodCart.removeFoodItems(foodCart.foodItemBasket[index]);
                                    Toast.show(Strings.removeOrder, context,
                                        duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
                                  },)
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Divider(color: Colors.grey.withOpacity(0.25),),
                            ),
                          ],
                        ),
                      );
                    },
                    ),
                  ),
                  /*AddToCartDetailsWidget(),
                  AddToCartDetailsWidget(),*/
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          blurRadius: 2.0,
                          spreadRadius: 0.0,
                          offset: Offset(0.0, 1.0), //(x,y) shadow direction: bottom right
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total order:',style: TextStyle(
                              fontFamily: "Product Sans",
                              color: Colors.grey,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(6.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.0),
                                    color: KButtonColor.withOpacity(0.75),
                                  ),

                                  child: Text('Free delivery',style: TextStyle(
                                    fontFamily: "Product Sans",
                                    color: Colors.black,
                                    fontSize: 12.0,
                                  ),),
                                ),
                                SizedBox(width: 16.0,),
                                Text('\$ ${foodCart.totalPrice}',style: TextStyle(
                                  fontFamily: "Product Sans",
                                  color: Colors.black,
                                  fontSize: 26.0,
                                ),),


                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:16.0),
                          child: FlatButton(
                              minWidth: size.width,
                              height: 65.0,
                              color: Color(0xffFFBD2F),
                              shape:  RoundedRectangleBorder(borderRadius:  BorderRadius.circular(8.0)),
                              onPressed: (){
                                Navigator.pushNamed(context, '/CheckOutOrderScreen');
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Place order',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                      fontFamily: "Product Sans",
                                    ),
                                  ),
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

                              )
                          ),
                        )
                      ],
                    ),
                  )

                ],
              )
          ),
        );
      },
    );

  }
}

class AddToCartDetailsWidget extends StatefulWidget {
  final String img;
  final String foodName;
  AddToCartDetailsWidget({this.img,this.foodName});
  @override
  _AddToCartDetailsWidgetState createState() => _AddToCartDetailsWidgetState();
}

class _AddToCartDetailsWidgetState extends State<AddToCartDetailsWidget> {
  int cartValue = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(6.0),
                    height: 70,
                    width: 65,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: AssetImage( widget.img),
                          fit: BoxFit.cover,
                        )),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0,left: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            Text('2',style: TextStyle(
                              fontFamily: "Product Sans",
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),),
                            SizedBox(width: 12.0,),
                            Text('X',style: TextStyle(
                              fontFamily: "Product Sans",
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),),
                            SizedBox(width: 12.0,),

                            Text(widget.foodName,style: TextStyle(
                              fontFamily: "Product Sans",
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                            ),),
                            SizedBox(width: 16.0,),
                            Text('\$12.00',style: TextStyle(
                              fontFamily: "Product Sans",
                              color: Colors.grey,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                            ),)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0,left: 5.0),
                        child: Row(
                          children: [

                            SvgPicture.asset('assets/svg/cartFood.svg'),
                            SizedBox(width: 6.0,),
                            Text('Totsuki Elite',style: TextStyle(
                              fontFamily: "Product Sans",
                              color: Colors.black,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                            ),),
                            SizedBox(width: 12.0,),
                            Container(
                              width: 20,
                              height: 20,
                              child:SvgPicture.asset('assets/svg/timeIcon.svg'),
                            ),
                            SizedBox(width: 6.0,),
                            Text('10 min',style: TextStyle(
                              color: Colors.black,
                              fontSize: 12.0,
                              fontFamily: "Product Sans",
                            ),),
                            SizedBox(width: 55.0,),
                            Text('')

                          ],

                        ),
                      ),

                    ],
                  ),

                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Material(
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        if(cartValue<=1){
                          return;
                        }
                        cartValue --;
                      });
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                            color: Colors.black,
                            width: 2.0,
                          )
                      ),
                      child:  Center(
                        child: Text('-',style: TextStyle(
                          fontFamily: "Product Sans",
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),),
                      ),
                    ),
                  ),
                  color: Colors.transparent,
                ),
                SizedBox(width: 20.0,),
                Text('$cartValue',style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontFamily: "Product Sans",
                  color: Colors.black,
                  fontSize: 26.0,
                  fontWeight: FontWeight.w500,
                ),),
                SizedBox(width: 20.0,),
                Material(
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        cartValue ++;
                      });
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.black,
                      ),
                      child:  Center(
                        child: Text('+',style: TextStyle(
                          fontFamily: "Product Sans",
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),),
                      ),
                    ),
                  ),
                  color: Colors.transparent,
                ),
                SizedBox(width: 20.0,),
                IconButton(icon: Icon(Icons.delete,color: Colors.black,size: 20.0),onPressed: (){},)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Divider(color: Colors.grey.withOpacity(0.25),),
          ),
        ],
      ),
    );
  }
}
