import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodes/Models/Const.dart';
import 'package:foodes/Profile/EditUserDetailsScreen.dart';
import 'package:foodes/Screens/ProfileScreen.dart';
import 'package:foodes/widgets/IosAndroidChecks.dart';
import 'package:foodes/widgets/Progressbar.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class UserDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          "User Details",
          style: TextStyle(fontFamily: "Product Sans", color: Colors.black),
        ),
        actions: [
          IconButton(icon: Icon(Icons.edit,color: Colors.black,), onPressed: (){
            showCupertinoModalBottomSheet(context: context,
                builder: (context,scrollController) => EditUserDetailsScreen());
          })
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Const.currentUser?.userImage != null
              ? Center(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: CachedNetworkImage(
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                        imageUrl: Const.currentUser?.userImage ?? "",
                        placeholder: (context, url) => NativeProgress(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
              )
              : Center(
                child: Container(
                    margin: EdgeInsets.only(right: 12.0, top: 12.0),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: Colors.grey.withOpacity(.3),
                    ),
                    child: Icon(Icons.person),
                  ),
              ),
          NameWidget(
            label: 'Name',
            text: Const.currentUser.userName.toUpperCase(),
          ),
          NameWidget(
            label: 'Email',
            text: Const.currentUser.userEmail,
          ),
          NameWidget(
            label: 'Phone',
            text: Const.currentUser.userNumber,
          ),
        SizedBox(height: 50.0,),
          LogOutWidget(),

        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class NameWidget extends StatelessWidget {
  String label;
  String text;
  NameWidget({this.label, this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Text(label,
                style: TextStyle(
                  fontFamily: "Product Sans",
                  fontSize: 12.0,
                  color: Colors.grey,
                )),
          ),
          Text(text,
              style: TextStyle(
                fontFamily: "Product Sans",
                fontSize: 22.0,
                color: Colors.black,
              )),
          Divider(),
        ],
      ),
    );
  }
}
// ignore: must_be_immutable
class LogOutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        child: InkWell(
          onTap: (){
            Platform.isAndroid
                ? showSignOutAndroidAlert(
                context, "Are you sure you want to logout?")
                : showSignOutIosAlert(
                context, "Are you sure you want to logout?");
          },
          child: Column(
            children: <Widget>[
              ListTile(
                leading:  Icon(FontAwesomeIcons.signOutAlt),

                title: Text(
                  'Logout',
                  style: TextStyle(
                      fontFamily: "Product Sans",
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500

                  ),
                ),

              ),
              Padding(
                padding: EdgeInsets.only(left: 12.0, right: 12.0),
                child: Divider(
                  color: Colors.grey.withOpacity(0.3),
                ),
              )
            ],
          ),
        ),
        color: Colors.transparent,
      ),
      color: Colors.white,
    );
  }

}
