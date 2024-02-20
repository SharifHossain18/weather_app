
import 'package:flutter/material.dart';
// import 'package:flutter_weather_bg_null_safety/bg/weather_bg.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:weatherapp_starter_project/Model/weather_model.dart';
import 'package:intl/intl.dart';

class TodaysWeather extends StatelessWidget {
  final WeatherModel? weatherModel;
  const TodaysWeather({super.key,
  this.weatherModel,
  });

  WeatherType getWeatherType(Current? current) {
    if (current!.isDay == 1) {
      if (current!.condition!.text == "Sunny") {
        return WeatherType.sunny;
      }
      else if (current!.condition!.text == "OverCast") {
        return WeatherType.overcast;
      }
      else if (current!.condition!.text == "Partly Cloudy") {
        return WeatherType.cloudy;
      }
      else if (current!.condition!.text == "Cloudy") {
        return WeatherType.cloudy;
      }
      else if (current!.condition!.text == "Mist") {
        return WeatherType.lightSnow;
      }
      else if (current!.condition!.text == "Clear") {
        return WeatherType.sunny;
      }
      else if (current!.condition!.text!.contains("thuunder")) {
        return WeatherType.thunder;
      }
      else if (current!.condition!.text!.contains("rain")) {
        return WeatherType.heavyRainy;
      }
      else if (current!.condition!.text!.contains("showers")) {
        return WeatherType.middleSnow;
      }


      else{
        if (current!.condition!.text == "Sunny") {
          return WeatherType.sunny;
        }
        else if (current!.condition!.text == "OverCast") {
          return WeatherType.overcast;
        }
        else if (current!.condition!.text == "Partly Cloudy") {
          return WeatherType.cloudyNight;
        }
        else if (current!.condition!.text == "Cloudy") {
          return WeatherType.cloudyNight;
        }
        else if (current!.condition!.text == "Mist") {
          return WeatherType.lightSnow;
        }
        else if (current!.condition!.text == "Clear") {
          return WeatherType.sunnyNight;
        }
        else if (current!.condition!.text!.contains("thuunder")) {
          return WeatherType.thunder;
        }
        else if (current!.condition!.text!.contains("rain")) {
          return WeatherType.heavyRainy;
        }
        else if (current!.condition!.text!.contains("showers")) {
          return WeatherType.middleSnow;
        }
      }
    }

      return WeatherType.thunder;
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WeatherBg(
            weatherType: getWeatherType(weatherModel!.current),
            width: MediaQuery.of(context).size.width,
            height: 320),
        SizedBox(
          width: double.infinity,
          height: 320,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  children: [
                    Text(weatherModel!.location!.name.toString(),
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                    ),
                    Text(DateFormat.yMMMMEEEEd().format(DateTime.parse(weatherModel!.current!.lastUpdated.toString())),
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  SizedBox(width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white10
                    ),
                      child: Image.network("https:${weatherModel!.current!.condition!.icon.toString()}")),
                  Spacer(),
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(weatherModel!.current!.tempC!.round().toString(),
                          style: TextStyle(
                            fontSize: 80,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink
                          ),
                          ),
                          Text("o",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink
                          ),
                          )
                        ],
                      ),
                      Text(weatherModel!.current!.condition!.text.toString(),
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                      )
                    ],
                  ),
                  SizedBox(width: 10,),
                ],
              ),
              Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text("Feels like",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight:FontWeight.w300,
                                color: Colors.white

                              ),),
                            Text(weatherModel!.current!.feelslikeC!.round().toString(),
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight:FontWeight.w300,
                                  color: Colors.white

                              ),),
                          ],
                        ),
                        Column(
                          children: [
                            Text("Wind",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight:FontWeight.w300,
                                  color: Colors.white

                              ),),
                            Text("${weatherModel!.current!.windKph!.round().toString()} km/hr",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight:FontWeight.w300,
                                  color: Colors.white

                              ),),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 6,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text("Humidity",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight:FontWeight.w300,
                                  color: Colors.white

                              ),),
                            Text("${weatherModel!.current!.humidity!.round().toString()}%",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight:FontWeight.w300,
                                  color: Colors.white

                              ),),
                          ],
                        ),
                        Column(
                          children: [
                            Text("Visibility",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight:FontWeight.w300,
                                  color: Colors.white

                              ),),
                            Text("${weatherModel!.current!.visKm!.round().toString()} km",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight:FontWeight.w300,
                                  color: Colors.white

                              ),),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
              
            ],
          ),
        )
      ],

    );
  }
}
