import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodes/Constants.dart';
import 'package:google_fonts/google_fonts.dart';
class FoodStyleScreen extends StatefulWidget {
  @override
  _FoodStyleScreenState createState() => _FoodStyleScreenState();
}

class _FoodStyleScreenState extends State<FoodStyleScreen> {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0,right: 16.0,left: 16.0),
              child: TextFormField(
                onChanged: (value) {},
                decoration: new InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  labelText: "Search",
                  fillColor: Colors.grey[200],
                  filled: true,

                    prefixIcon: ImageIcon(
                      AssetImage("assets/images/searchIcon.png"),
                      color: Colors.black,

                    ),

                  //fillColor: Colors.green
                ),
                keyboardType: TextInputType.text,
                style: new TextStyle(),
              ),
            ),
            SizedBox(height: 20.0,),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text('Suggestions for you',
                style: TextStyle(
                    fontFamily: "Product Sans",
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500
                ),),
            ),
            SuggestionsFoodWidget(),
            SuggestionsFoodWidget(),

            SizedBox(height: 80.0,),
            Center(
              child: Column(

                children: [
                  SvgPicture.asset('assets/svg/nope.svg'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Huh! You have no food',
                      style: TextStyle(
                          fontFamily: "Product Sans",
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('pick from suggestions or you can easily',
                      style: TextStyle(
                        fontFamily: "Product Sans",
                          color: Colors.grey,
                          fontSize: 20.0,

                      ),),
                  ),
                  SizedBox(height: 40.0,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
class SuggestionsFoodWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ListTile(
            dense: true,
            leading:  Container(
              height: 80,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage("assets/images/foodStyle.png"),
                    fit: BoxFit.cover,
                  )
              ),
            ),
            title: Text('Vegetarian',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
              fontFamily: "Product Sans",
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                children: [
                  Text('Added by',style:  TextStyle(
                    fontFamily: "Product Sans",
                    color: Colors.grey,
                    fontSize: 16.0,
                  ),),
                  SizedBox(width: 5.0,),
                  Text('200 +',style:  TextStyle(
                    fontFamily: "Product Sans",
                    color: Colors.black,
                    fontSize: 16.0,
                  ),),
                ],
              ),
            ),
            trailing:  Container(
              margin: EdgeInsets.all(8.0),
              width: 100,
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8.0)
              ),
              child: FlatButton(onPressed: (){
                Navigator.pushNamed(context, '/FoodStyleDetailsScreen');
              },
                  child: Text(
                    '+ Add to order',
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 12.0,
                    ),


                  )),
            )
          )
        ],
      ),
    );
  }
}
