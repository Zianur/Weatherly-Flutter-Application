import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String cityName = "";
  late String temp = "";
  late String realFeel = "";
  late String airSpeed = "";
  late String humidity = "";
  late String description = "";
  late String icon = "";

  TextEditingController searchController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? info =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    cityName = info!["city_name"];
    temp = info["temp_value"];
    realFeel = info["feellike_value"];
    airSpeed = info["airSpeed_value"];
    humidity = info["humidity_value"];
    description = info["main_description_value"];
    icon = info["icon_value"] ?? "NA";
    description = description.toUpperCase();
    cityName = cityName.toUpperCase();

    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.blue[600],
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                //Searchbar container
                margin: EdgeInsets.fromLTRB(20, 50, 20, 20),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),

                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: TextField(

                        //if go or search button is clicked from the key board
                        textInputAction: TextInputAction.go,
                        onSubmitted: (value) {
                           if (value.replaceAll(" ", "") != "") {
                          Navigator.pushReplacementNamed(context, "/loading",
                              arguments: {"city_name": value});
                        }
                        },

                        //controller is used to access the value of textfield
                        controller: searchController,
                        decoration: InputDecoration(
                            hintText: "Type City Name",
                            border: InputBorder.none),
                      ),
                    )),
                    GestureDetector(
                      onTap: () {
                        if (searchController.text.replaceAll(" ", "") != "") {
                          Navigator.pushReplacementNamed(context, "/loading",
                              arguments: {"city_name": searchController.text});
                        }
                      },
                      child: Container(
                        child: Icon(Icons.search),
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                        decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 120,
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            "assets/images/weather.png",
                            height: 80,
                            width: 80,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "$description",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "in $cityName",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      height: 250,
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.fromLTRB(20, 0, 5, 10),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Row(
                              children: [
                                Icon(WeatherIcons.thermometer),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                                  child: Text(
                                    "Temperature",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 70,
                          ),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Row(
                              children: [
                                Text(
                                  "$temp\u00B0C",
                                  style: TextStyle(fontSize: 40),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 250,
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.fromLTRB(5, 0, 20, 10),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Row(
                              children: [
                                Icon(WeatherIcons.thermometer),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                                  child: Text(
                                    "Real Feel",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 70),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "$realFeel\u00B0C",
                                  style: TextStyle(fontSize: 40),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      height: 250,
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.fromLTRB(20, 0, 5, 10),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Row(
                              children: [
                                Icon(WeatherIcons.wind),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                                  child: Text(
                                    "Air Speed",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 70,
                          ),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "$airSpeed",
                                  style: TextStyle(fontSize: 40),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "m/s",
                                  style: TextStyle(fontSize: 40),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 250,
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.fromLTRB(5, 0, 20, 10),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Row(
                              children: [
                                Icon(WeatherIcons.humidity),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                                  child: Text(
                                    "Humidity",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 70,
                          ),
                          FittedBox(
                            fit: BoxFit.contain,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "$humidity",
                                  style: TextStyle(fontSize: 40),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "%",
                                  style: TextStyle(fontSize: 40),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Text(
                      "Developed By Zianur Rahman",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Data Provided by OpenWeatherMap.org",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
