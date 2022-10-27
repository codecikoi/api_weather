import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  late String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              cursorColor: Colors.blueGrey[800],
              style: TextStyle(color: Colors.white70),
              decoration: InputDecoration(
                hintText: 'Enter city name',
                hintStyle: TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Colors.black87,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide.none),
                icon: Icon(Icons.location_city,
                    color: Colors.black87, size: 50.0),
              ),
              onChanged: (value) {
                cityName = value;
              },
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, cityName),
              child: Text(
                'Get Weather',
                style: TextStyle(fontSize: 30.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
