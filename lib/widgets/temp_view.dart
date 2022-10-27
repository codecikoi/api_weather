import 'package:flutter/material.dart';

import '../model/weather_forecast_daily.dart';

class TempView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const TempView({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data?.list;
    var icon = forecastList?[0].getIconUrl();
    var temp = forecastList?[0].temp.day.toStringAsFixed(0);
    var description = forecastList?[0].weather[0].description.toUpperCase();

    return Row(
      children: [
        Image.network(icon!, scale: 0.4, color: Colors.black87),
        SizedBox(
          width: 20.0,
        ),
        Column(
          children: [
            Text(
              '$temp C',
              style: TextStyle(fontSize: 54.0, color: Colors.black87),
            ),
            Text(
              '$description',
              style: TextStyle(fontSize: 18.0, color: Colors.black87),
            ),
          ],
        ),
      ],
    );
  }
}
