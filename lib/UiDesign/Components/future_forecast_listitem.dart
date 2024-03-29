import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp_starter_project/Model/weather_model.dart';
class FutureForecastListItem extends StatelessWidget {
  final Forecastday? forecastday;
  const FutureForecastListItem({super.key,
  this.forecastday
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        children: [
          Image.network("https:${forecastday!.day!.condition!.icon!.toString()}"),
          Expanded(
            child: Text(DateFormat.MMMEd().format(DateTime.parse(forecastday!.date!.toString())),
            style: TextStyle(
              color: Colors.white,
            
            ),
            ),
          ),
          Expanded(
            child: Text(forecastday!.day!.condition!.text.toString(),
              style: TextStyle(
                color: Colors.white,

              ),
            ),
          ),
          Expanded(
            child: Text("^${forecastday!.day!.maxtempC!.round().toString()}/${forecastday!.day!.mintempC!.round().toString()}",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,

              ),
            ),
          )
        ],
      ),
    );
  }
}
