import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyGoogleMap',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyGoogleMap(title: 'MyMap'),
    );
  }
}


class MyGoogleMap extends StatefulWidget {
  MyGoogleMap({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyGoogleMap> {
  StreamSubscription _locationSubscription;
  Location _locationTracker = Location();
  Marker marker;
  Circle circle;
  GoogleMapController _controller;

  static final CameraPosition initialLocation = CameraPosition(
    target: LatLng(30.73629,  76.7884),
    zoom: 12,
  );

  Future<Uint8List> getMarker() async {
    ByteData byteData = await DefaultAssetBundle.of(context).load(
        "assets/car_icon.png");
    return byteData.buffer.asUint8List();
  }

  void updateMarkerAndCircle(LocationData newLocalData, Uint8List imageData) {
    LatLng latlng = LatLng(newLocalData.latitude, newLocalData.longitude);
    this.setState(() {
      marker = Marker(
          markerId: MarkerId("myMarker"),
          position: latlng,
          rotation: newLocalData.heading,
          draggable: false,
          zIndex: 2,
          flat: true,
          anchor: Offset(0.5, 0.5),
          icon: BitmapDescriptor.fromBytes(imageData));
      circle = Circle(
          circleId: CircleId("car"),
          radius: newLocalData.accuracy,
          zIndex: 1,
          strokeColor: Colors.red,
          center: latlng,
          fillColor: Colors.transparent.withAlpha(70));
    });
  }

  void getCurrentLocation() async {
    try {
      Uint8List imageData = await getMarker();
      var location = await _locationTracker.getLocation();

      updateMarkerAndCircle(location, imageData);

      if (_locationSubscription != null) {
        _locationSubscription.cancel();
      }


      _locationSubscription =
          _locationTracker.onLocationChanged().listen((newLocalData) {
            if (_controller != null) {
              _controller.animateCamera(
                  CameraUpdate.newCameraPosition(new CameraPosition(
                      bearing: 192.8334901395799,
                      target: LatLng(
                          newLocalData.latitude, newLocalData.longitude),
                      tilt: 0,
                      zoom: 18.00)));
              updateMarkerAndCircle(newLocalData, imageData);
            }
          });
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        debugPrint("Permission Denied");
      }
    }
  }

  @override
  void dispose() {
    if (_locationSubscription != null) {
      _locationSubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),centerTitle: true,
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: initialLocation,
        markers: Set.of((marker != null) ? [marker] : []),
        circles: Set.of((circle != null) ? [circle] : []),
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
        },

      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.location_searching),
          onPressed: () {
            getCurrentLocation();
          }),
    );
  }
}


/*

class MyGoogleMap extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyMapState();
}

class MyMapState extends State {
  List<Marker> allMarkers = [];
  static LatLng latLng = LatLng(30.900965, 75.857277);
  GoogleMapController googleMapController;
  Location _locationTracker = Location();

  static final CameraPosition initialPosition =
      CameraPosition(target: latLng, zoom: 15);

  @override
  void initState() {
    super.initState();
//    allMarkers.add(
//      Marker(markerId: MarkerId('myMarker'), draggable: true, position: latLng),
//    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Map"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: initialPosition,
              onMapCreated: (GoogleMapController googleMapController) {
                this.googleMapController = googleMapController;
              },
            )),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.location_searching),
        onPressed: () {
          getCurrentLocation();
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  void getCurrentLocation() async {
    var location = await _locationTracker.getLocation();
    print(location.latitude);
    setState(() {
      latLng = LatLng(location.latitude, location.longitude);
    });
  }
}
*/
