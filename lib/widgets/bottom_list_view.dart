import 'package:flutter/material.dart';

import '../model/weather_forecast_daily.dart';
import 'forecast_card.dart';

class BottomListView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const BottomListView({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '7-Day Weather Forecast'.toUpperCase(),
          style: TextStyle(
              fontSize: 20.0,
              color: Colors.black87,
              fontWeight: FontWeight.bold),
        ),
        Container(
          height: 140,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: ListView.separated(
            itemBuilder: (context, index) => Container(
              child: forecastCard(snapshot, index),
              width: MediaQuery.of(context).size.width / 2.7,
              height: 160,
              color: Colors.black87,
            ),
            separatorBuilder: (context, index) => SizedBox(width: 8.0),
            itemCount: snapshot.data!.list!.length,
          ),
        )
      ],
    );
  }
}
