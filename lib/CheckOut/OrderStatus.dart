import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:im_stepper/stepper.dart';
class OrderStatus extends StatefulWidget {
  @override
  _OrderStatusState createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
  int _selectedIndex = 0;
  List<Step> steps = [
    Step(
      isActive: true,
      state: StepState.complete,
      content: Container(
        child: Column(

          children: <Widget>[
            Row(
              children: [
                Text('Order Received',style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),),
                Spacer(),
                Text(
                  '7:00',
                  style: TextStyle(color: Colors.grey,fontSize: 14.0),
                ),
              ],
            ),
            SizedBox(height: 20.0,),
            Divider(color: Colors.grey,)
          ],
        ),
      ),
      title: Text('ORDER',style: TextStyle(
        color: Colors.grey,
        fontSize: 12.0,
      ),),
    ),
    Step(
      isActive: true,
      state: StepState.complete,
      content: Container(
        child: Column(

          children: <Widget>[
            Row(
              children: [
                Text('Order Received',style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),),
                Spacer(),
                Text(
                  '7:00',
                  style: TextStyle(color: Colors.grey,fontSize: 14.0),
                ),
              ],
            ),
            SizedBox(height: 20.0,),
            Divider(color: Colors.grey,)
          ],
        ),
      ),
      title: Text('COOKING',style: TextStyle(
        color: Colors.grey,
        fontSize: 12.0,
      ),),
    ),
    Step(
      isActive: true,
      state: StepState.complete,
      content: Container(
        child: Column(

          children: <Widget>[
            Row(
              children: [
                Text('Order Received',style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),),
                Spacer(),
                Text(
                  '7:00',
                  style: TextStyle(color: Colors.grey,fontSize: 14.0),
                ),
              ],
            ),
            SizedBox(height: 20.0,),
            Divider(color: Colors.grey,)
          ],
        ),
      ),
      title: Text('READY',style: TextStyle(
        color: Colors.grey,
        fontSize: 12.0,
      ),),
    ),
    Step(
      content: Container(
        child: Column(

          children: <Widget>[
            Row(
              children: [
                Text('Order Received',style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),),
                Spacer(),
                Text(
                  '7:00',
                  style: TextStyle(color: Colors.grey,fontSize: 14.0),
                ),
              ],
            ),
            SizedBox(height: 20.0,),
            Divider(color: Colors.grey,)
          ],
        ),
      ),
      title: Text('DELIVERY',style: TextStyle(
        color: Colors.grey,
        fontSize: 12.0,
      ),),
    ),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0.0,
        title: Text('Order Status',
          style: TextStyle(
            fontFamily: "Product Sans",
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),),

      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 16.0),
              leading: SvgPicture.asset("assets/svg/Info.svg"),
              title: Text('ORDER FROM',style: TextStyle(
                color: Colors.grey,
                fontSize: 10.0,
              ),),
              subtitle: Text('Totsuki Elite',style: TextStyle(
                color: Colors.black
              ),),
              trailing: Wrap(
                children: [
                  Container(
                  width: 20.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Icon(FontAwesomeIcons.phoneAlt,color: Colors.white,size: 12.0,),
                  ),
                  SizedBox(width: 6.0,),
                  Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Icon(FontAwesomeIcons.commentDots,color: Colors.white,size: 12.0,),
                  ),

                ],
              ),

            ),
            SizedBox(
              height: 12.0,
              child: Row(
                children: List.generate(150~/2, (index) => Expanded(
                  child: Container(
                    color: index%2==0?Colors.transparent
                        :Colors.grey,
                    height: 2,
                  ),
                )),
              ),
            ),

          //  SizedBox(height: 12.0,child:  Divider(color: Colors.grey,),),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ADD ADRESS',style: TextStyle(
                    color: Colors.grey,

                  ),),

              Theme(
                data: ThemeData(
                  canvasColor: Colors.amberAccent,
                    accentColor: Colors.orange,
                    primarySwatch: Colors.orange,
                    colorScheme: ColorScheme.light(
                        primary: Colors.orange
                    )
                ),
                    child: Stepper(
                      type: StepperType.vertical,
                      physics: AlwaysScrollableScrollPhysics(),
                      controlsBuilder: (BuildContext context, {
                        VoidCallback onStepContinue,
                        VoidCallback onStepCancel
                      }) => Container(),
                      steps: steps

                    ),
                  )

                ],
              ),
            ),
            SizedBox(height: 30.0),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: double.infinity,
                height: 70.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/gradBanner.png')

                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 10, bottom: 10),
                        child: Image.asset('assets/images/locationMarker.png')),
                    Padding(
                        padding: EdgeInsets.only(left: 10, bottom: 10),
                        child: Text(
                          'Order Tracking',
                          style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                        )),
                    Spacer(),
                    IconButton(icon: Icon(Icons.arrow_forward_ios_sharp,color: Colors.black,), onPressed: (){
                      Navigator.pushNamed(context, '/TrackUserOrder');
                    })
                  ],
                ),
              ),
            ),
            SizedBox(height: 50.0),


          ],
        ),
      ),
    );
  }
}

class LineDashedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..strokeWidth = 2;
    var max = 35;
    var dashWidth = 5;
    var dashSpace = 5;
    double startY = 0;
    while (max >= 0) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashWidth), paint);
      final space = (dashSpace + dashWidth);
      startY += space;
      max -= space;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
/*
   Stepper(
                physics: AlwaysScrollableScrollPhysics(),
                    controlsBuilder: (BuildContext context, {
                      VoidCallback onStepContinue,
                      VoidCallback onStepCancel
                    }) => Container(),
                    steps: [
                      Step(
                        isActive: true,
                        content: Container(
                          child: Column(

                            children: <Widget>[
                              Row(
                                children: [
                                  Text('Order Received',style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                  Spacer(),
                                  Text(
                                    '7:00',
                                    style: TextStyle(color: Colors.grey,fontSize: 14.0),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.0,),
                              Divider(color: Colors.grey,)
                            ],
                          ),
                        ),
                        title: Text('ORDER',style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.0,
                        ),),
                      ),
                      Step(
                        isActive: true,
                        content: Container(
                          child: Column(

                            children: <Widget>[
                              Row(
                                children: [
                                  Text('Order Received',style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                  Spacer(),
                                  Text(
                                    '7:00',
                                    style: TextStyle(color: Colors.grey,fontSize: 14.0),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.0,),
                              Divider(color: Colors.grey,)
                            ],
                          ),
                        ),
                        title: Text('ORDER',style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.0,
                        ),),
                      ),


                    ],
                  )*/