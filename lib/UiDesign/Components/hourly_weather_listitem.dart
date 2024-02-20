
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../Model/weather_model.dart';
class HourlyWeatherListItem extends StatelessWidget {
  final Hour? hour;
  const HourlyWeatherListItem({super.key,
  this.hour,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      width: 120,
      decoration: BoxDecoration(
      color: Colors.white24,
        borderRadius: BorderRadius.circular(20)
    ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(hour!.tempC!.round().toString(),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
              ),
              Text("o",
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.white
                ),
              ),

            ],
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.teal
            ),
            child: Image.network("https:${hour!.condition!.icon.toString()}"),
          ),
          Text(DateFormat.j().format(DateTime.parse(hour!.time!.toString(),
          ),
          ),
          style: TextStyle(
            color: Colors.white
          ),
          )
        ],
      ),

    );
  }
}
