import 'package:flutter/material.dart';
import '../model/weather_forecast_daily.dart';
import '../utilities/forecast_util.dart';


class CityView extends StatelessWidget {

  final AsyncSnapshot<WeatherForecast> snapshot;
  const CityView({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var forecastList = snapshot.data?.list;
    var city = snapshot.data?.city.name;
    var country = snapshot.data?.city.country;
    var formattedDate = DateTime.fromMicrosecondsSinceEpoch(forecastList![0].dt * 1000);

    return Column(
      children: [
        Text(
          '$city, $country',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28.0,
            color: Colors.black87
          ),
        ),
        Text(
          Util.getFormattedDate(formattedDate),
          style: TextStyle(
            fontSize: 15.0
          ),
        )
      ],
    );
  }
}
