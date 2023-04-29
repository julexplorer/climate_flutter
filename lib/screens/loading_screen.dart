import 'package:flutter/material.dart';
import 'package:climate_project/services/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // void getLocation() async {
  //   Location location = Location();
  //   await location.getCurrentLocation();
  //   print(location.latitude);
  //   print(location.longitude);
  // }

  // void getData () async{
  //
  //   Response response = await get(url);
  //   print (response.body);
  // }

  void getPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
    print(permission);
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getLocation();
  //   // getData();
  // }

  void getData() async {
    http.Response myResponse =
        await http.get(Uri.parse('https://reqres.in/api/users'));

    if (myResponse.statusCode == 200) {
      String data = myResponse.body;
      print(data);
    } else {
      print(myResponse.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // getPermission();
            // getLocation();
            getData();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
