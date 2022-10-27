import 'package:api_weather/model/weather_forecast_daily.dart';
import 'package:api_weather/widgets/city_view.dart';
import 'package:api_weather/widgets/temp_view.dart';
import 'package:flutter/material.dart';

import '../api/weather_api.dart';
import '../widgets/bottom_list_view.dart';
import '../widgets/detail_view.dart';
import 'city_screen.dart';

class WeatherForecastScreen extends StatefulWidget {
  final WeatherForecast? locationWeather;
  const WeatherForecastScreen({Key? key, this.locationWeather})
      : super(key: key);

  @override
  State<WeatherForecastScreen> createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  late Future<WeatherForecast> forecastObject;
  late String _cityName;

  @override
  void initState() {
    super.initState();

    if (widget.locationWeather != null) {
      forecastObject = Future.value(widget.locationWeather);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather forecast'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.my_location),
          onPressed: () {
            setState(() {
              forecastObject = WeatherApi().fetchWeatherForecast();
            });
          },
        ),
        actions: [
          IconButton(
            onPressed: () async {
              var tappedName = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return CityScreen();
              }));
              if (tappedName != null) {
                setState(() {
                  _cityName = tappedName;
                  forecastObject = WeatherApi()
                      .fetchWeatherForecast(city: _cityName, isCity: true);
                });
              }
            },
            icon: Icon(Icons.location_city),
          )
        ],
      ),
      body: ListView(
        children: [
          FutureBuilder<WeatherForecast>(
              future: forecastObject,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      SizedBox(height: 50.0),
                      CityView(snapshot: snapshot),
                      SizedBox(height: 50.0),
                      TempView(snapshot: snapshot),
                      SizedBox(height: 50.0),
                      DetailView(snapshot: snapshot),
                      SizedBox(height: 50.0),
                      BottomListView(snapshot: snapshot),
                      SizedBox(height: 50.0),
                    ],
                  );
                } else {
                  return Center(
                    child: Text(
                      'City not found\nPlease, enter correct city',
                      style: TextStyle(fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                  );
                }
              })
        ],
      ),
    );
  }
}
