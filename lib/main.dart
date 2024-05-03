import 'package:flutter/material.dart';
import 'package:weatherly_flutter_app/Activity/loading.dart';

import 'Activity/home.dart';

void main() {
  runApp(MaterialApp(   
    /// home: Home(),
    
    debugShowCheckedModeBanner: false, //vanishes the debug banner

    //routes describes the route of the app
    routes: {
      "/" : (context) => Loading(), //by default takes to the Loading activity
      "/home" : (context) => Home(),
      "/loading" : (context) => Loading(),
    },
  ));
}