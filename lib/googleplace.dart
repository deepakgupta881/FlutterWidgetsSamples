import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geocoder/geocoder.dart';
import 'dart:async';
import 'package:google_maps_webservice/places.dart';

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
      home: demo(),
    );
  }
}

class demo extends StatefulWidget {
  @override
  CheckGooglePlaces createState() => new CheckGooglePlaces();
}

const kGoogleApiKey = "AIzaSyCwF7aZa6t84YkhH8KcIqtiMPAQ0oj1gQU";

class CheckGooglePlaces extends State<demo> {
  GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            child: RaisedButton(
              onPressed: () async {
                // show input autocomplete with selected mode
                // then get the Prediction selected
                Prediction p = await PlacesAutocomplete.show(
                    context: context, apiKey: kGoogleApiKey);
                displayPrediction(p);
              },
              child: Text('Find address'),
            )));
  }

  Future<Null> displayPrediction(Prediction p) async {
    if (p != null) {
      PlacesDetailsResponse detail =
          await _places.getDetailsByPlaceId(p.placeId);
      var placeId = p.placeId;
      double lat = detail.result.geometry.location.lat;
      double lng = detail.result.geometry.location.lng;
      var address = await Geocoder.local.findAddressesFromQuery(p.description);
      print("lat " + lat.toString());
      print("long " + lng.toString());
    }
  }
}
