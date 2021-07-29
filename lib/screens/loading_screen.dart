import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import '../services/location.dart';
import '../services/networking.dart';
import '../services/networking.dart';
import '../services/weather.dart';
import 'location_screen.dart';
import 'location_screen.dart';

const apiKey = '2c6693f0132e299bc41f2aef4f332e5b';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  Future<void> getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          size: 100,
          color: Colors.white,
        ),
      ),
      // body: Center(
      //     child: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Text(address ?? "loading.."),
      //     SizedBox(height: 10),
      //     RaisedButton(
      //       onPressed: () {
      //         setState(() {
      //           address = null;
      //         });
      //         gettingdata();
      //       },
      //       child: Text('getLocation'),
      //     ),
      //   ],
      // )),
    );
  }
}
