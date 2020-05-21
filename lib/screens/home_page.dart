import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:c2btech/services/current_location.dart';
import 'package:c2btech/data_model/weather_data_pojo.dart';
import 'package:c2btech/services/weather_data.dart';
import 'package:c2btech/sub_widgets/card_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Constants
  CurrentLocation _currentLocation = new CurrentLocation();
  Weather _weather = new Weather();
  WeatherData _weatherData = new WeatherData();
  String currentCity = 'Chennai';
  bool loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //get current location before building the widget
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Weather'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: loading == true
                  ? Center(child: CupertinoActivityIndicator())
                  : CardView(
                      name: _weather.name,
                      country: _weather.country,
                      temperature: _weather.temperature,
                      weatherIcon: _weather.weatherIcon,
                      weatherDescription: _weather.weatherDescription,
                    ),
            ),
            Expanded(
              child: DropdownButton(
                iconSize: 40.0,
                items: _weatherData.getDropDownMenuItem(),
                value: currentCity,
                onChanged: (value) {
                  setState(() {
                    currentCity = value;
                    getWeatherData(currentCity);
                  });
                },
              ),
            )
          ],
        ));
  }

  void getCurrentLocation() async {
    //Get current location lat and long
    Position _position = await _currentLocation.getLocation();
    String city =
        ("${_position.latitude.toString()},${_position.longitude.toString()}")
            .trim();

    //get weather data for that position
    getWeatherData(city);
  }

  void getWeatherData(String city) async {
    //get weather data
    Weather weather = await _weatherData.getLocationWeather(city);
    setState(() {
      _weather = weather;
      loading = false;
    });
  }
}
