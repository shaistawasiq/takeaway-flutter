import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CameraGalleryBottomSheet extends StatefulWidget {
  Function cameraClick;
  Function galleryClick;

  CameraGalleryBottomSheet({this.cameraClick, this.galleryClick});

  @override
  _CameraGalleryBottomSheetState createState() =>
      _CameraGalleryBottomSheetState();
}

class _CameraGalleryBottomSheetState extends State<CameraGalleryBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 30),
      height: 250,
      child: Column(
        children: <Widget>[
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                widget.cameraClick.call();
                Navigator.pop(context);
              },
              child: ListTile(
                leading: Icon(
                  FontAwesomeIcons.camera,
                  size: 30,
                ),
                title: Text(
                  "Camera",
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text("Click to Capture image from camera"),
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                widget.galleryClick.call();
                Navigator.pop(context);
              },
              child: ListTile(
                leading: Icon(
                  FontAwesomeIcons.image,
                  size: 30,
                ),
                title: Text(
                  "Gallery",
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text("Click to add picture from camera"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}