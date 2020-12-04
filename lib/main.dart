import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodes/AuthScreens/LoginScreen.dart';
import 'package:foodes/AuthScreens/RegisterSuccessful.dart';
import 'package:foodes/CheckOut/CheckOutScreen.dart';
import 'package:foodes/CheckOut/OrderStatus.dart';
import 'package:foodes/CheckOut/TrackUserOrderScreen.dart';
import 'package:foodes/FoodDetails/FoodMenuItemsDetailsScreen.dart';
import 'package:foodes/FoodDetails/FoodStyleDetails.dart';
import 'package:foodes/Models/FoodCart.dart';
import 'package:foodes/Models/Home.dart';
import 'package:foodes/Profile/UserDetailsScreen.dart';
import 'package:foodes/Screens/FoodStyleScreen.dart';
import 'package:foodes/Screens/IntroScreens.dart';
import 'package:foodes/Screens/OrderScreen.dart';
import 'package:foodes/widgets/BottomNavigationBar.dart';
import 'package:provider/provider.dart';
import 'AuthScreens/QuickSurvey.dart';
import 'CheckOut/CheckOutOrderScreen.dart';
import 'CheckOut/SuccessfulOrder.dart';
import 'Screens/HomeScreen.dart';
import 'Screens/ProfileScreen.dart';
import 'SplashScreen.dart';
/*Future<void> main() async {
runApp(ChangeNotifierProvider(create: (context)=>FoodCart(),
child: MyApp(),
));

}*/
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(create: (context)=>FoodCart(),
    child: MyApp(),
  ));

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage("assets/images/foodItem1.png"),context);
    precacheImage(AssetImage("assets/images/foodItem2.png"),context);
    precacheImage(AssetImage("assets/images/foodItem.png"),context);
    precacheImage(AssetImage("assets/images/letStart.png"),context);
    precacheImage(AssetImage("assets/images/nope.png"),context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        '/welcome': (context) => SplashScreen(),
        '/IntroScreens': (context) => IntroScreens(),
        '/IntroScreens1': (context) => Intro2(),
        '/Homes': (context) => Home(),
        '/LogIn': (context) => LoginScreen(),
        '/RegisterScreen': (context) => RegisterSuccess(),
        '/QuickSurvey': (context) => QuickSurvey(),
        '/RegisterSuccess': (context) => RegisterSuccess(),
        '/BottomNavigation': (context) => MyStatefulWidget(),
        '/Home': (context) => HomeScreen(),
        '/FoodStyle': (context) => FoodStyleScreen(),
        '/OrderScreen': (context) => OrderScreen(),
        '/ProfileScreen': (context) => ProfileScreen(),
        '/FoodMenuItemsDetailsScreen': (context) => FoodMenuItemsDetailsScreen(),
        '/FoodStyleDetailsScreen': (context) => FoodStyleDetails(),
        '/CheckOutScreen': (context) => CheckOutScreen(),
        '/CheckOutOrderScreen': (context) => CheckOutOrderScreen(),
        '/SuccessFullyOrder': (context) => SuccessfulOrder(),
        '/OrderStatus': (context) => OrderStatus(),
        '/TrackUserOrder': (context) => TrackOrderScreen(),
        '/UserDetailsScreen': (context) => UserDetailsScreen(),

      },




  );
}
}




