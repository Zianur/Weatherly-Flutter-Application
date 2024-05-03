import 'package:flutter/material.dart';
import 'package:weatherly_flutter_app/Class/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  late String temp = "";
  late String airSpeed = "";
  late String mainDescription = "";
  // late String description="";
  late String feelLikeTemp = "";
  late String humidity = "";
  late String icon = "";
  late String cityName = "dhaka";
  late Map<String, dynamic> dataToSend;


  void startApp(String cityName) async {
    worker instance = worker(location: cityName);
    await instance.getData();

    airSpeed = instance.airSpeed;
    temp = instance.temp;
    mainDescription = instance.mainDescription;
    // description = instance.description;
    feelLikeTemp = instance.feelLikeTemp;
    humidity = instance.humidity;
    icon = instance.icon;

    dataToSend = {
      "temp_value": temp,
      "feellike_value": feelLikeTemp,
      "airSpeed_value": airSpeed,
      // "description_value" : description,
      "main_description_value": mainDescription,
      "humidity_value": humidity,
      "icon_value": icon,
      "city_name": cityName
    };

    Navigator.pushReplacementNamed(context, '/home', arguments: dataToSend);
  }

  @override
  void initState() {
    // TODO: implement initState

    // startApp();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final Map<String, dynamic>? cityInfo =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    if (cityInfo!=null) {
      cityName = cityInfo["city_name"];
    }
    startApp(cityName);
    

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/images/weather.png",
                height: 240,
                width: 240,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Weatherly Application",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Developed by Zianur Rahman",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 30,
              ),
              SpinKitWave(
                color: Colors.white,
                size: 70.0,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.blue[600],
    );
  }
}
