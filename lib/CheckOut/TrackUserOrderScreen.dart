import 'package:flutter/material.dart';
import 'package:google_map_polyline/google_map_polyline.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission/permission.dart';

class TrackOrderScreen extends StatefulWidget {
  @override
  _TrackOrderScreenState createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  final Set<Polyline> polyline = {};

  GoogleMapController googleMapController;
  List<LatLng> routeCoords;
  GoogleMapPolyline googleMapPolyline =
      new GoogleMapPolyline(apiKey: "AIzaSyAUUCZOSXtOhGDDXYLZnqlDs-CDpsdzFBk");


  List<Polyline> _polyLine = [];
  getPoints() {
    return [


LatLng(31.5105, 74.3478),
      LatLng(31.5019,74.3575),





    ];
  }


  @override
  Widget build(BuildContext context) {
    return   GoogleMap(
      myLocationEnabled: true,
      initialCameraPosition: CameraPosition(
        target: LatLng(31.5102, 74.3441),

        zoom: 12.99,
      ),

      polygons: Set<Polygon>.of(<Polygon>[
        Polygon(
            polygonId: PolygonId('area'),
            points: getPoints(),
            geodesic: true,
            strokeColor: Colors.red.withOpacity(0.6),
            strokeWidth: 5,
            fillColor: Colors.redAccent.withOpacity(0.1),
            visible: true,
        ),


      ]),);
  }

}

//"AIzaSyAUUCZOSXtOhGDDXYLZnqlDs-CDpsdzFBk"
