import 'dart:convert';
import 'package:http/http.dart';


class worker {
  String location;
  late double lat;
  late double lon;
  late String temp;
  late String feelLikeTemp;
  late String airSpeed;
  late String humidity;
  late String mainDescription;
  late String icon;
  // late String description;

  //constructor
  worker({required this.location}) //{}makes the parameter, named parameter
  {
    location = this.location;
  }

    Future<void> getData() async {
      try {
        final String url =
            'https://nominatim.openstreetmap.org/search?q=$location&format=json&limit=1';

        Response responseCity = await get(Uri.parse(url));
        List cityList = jsonDecode(responseCity.body);

        //Getting lat and lon
        Map cityMap = cityList[0];
        lat = double.parse(cityMap['lat']);
        lon = double.parse(cityMap['lon']);

        Response responseData = await get(Uri.parse(
            "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=8b0cd55e357ca0adb6e05c92bf8df43a"));

        Map data = jsonDecode(responseData.body);

        //Getting temperature
        Map mainData = data['main'];
        double getTemp = mainData['temp'] - 273.15;
        temp = getTemp.toStringAsFixed(2);
        double getFeelLikeTemp = mainData['feels_like'] - 273.15;
        feelLikeTemp = getFeelLikeTemp.toStringAsFixed(2);

        humidity = mainData['humidity'].toString();

        //Getting airSpeed
        airSpeed = data['wind']['speed']
            .toString(); //we can also do this but need to understand map and list

        //Getting description

        // List weatherList = data['weather'];
        // Map weatherMap = weatherList[0];
        // mainDescription = weatherMap['main'];
        // description = weatherMap['description'];

        mainDescription = data['weather'][0]['description'];
        icon = data['weather'][0]['icon'];
        // description = data['weather'][0]['main'].toString();

      } catch (e) {
        temp = "NA";
        // description = "Error Occured";
        mainDescription = "NA";
        feelLikeTemp = "NA";
        humidity = "NA";
        airSpeed = "NA";
        icon = "NA";
      }
    }
  }
