import 'package:flutter/material.dart';
import 'package:weatherapp_starter_project/Model/weather_model.dart';
import 'package:weatherapp_starter_project/Services/api_service.dart';
import 'package:weatherapp_starter_project/UiDesign/Components/todays_weather.dart';

import 'Components/future_forecast_listitem.dart';
import 'Components/hourly_weather_listitem.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiServices apiServices=ApiServices();
  final _textFieldController=TextEditingController();
  String searchText="auto:ip";

  _showTextInputDialogue(BuildContext context)async{
    return showDialog(
        context: context, builder: (context){
      return AlertDialog(
        title: Text("Search Location"),
        content: TextField(
          controller: _textFieldController,
          decoration: InputDecoration(
            hintText: "Search by City, Zip, lat, long",
          ),
        ),
        actions: [
          ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
                _textFieldController.clear();
              }, child: Text("Cancel")),
          ElevatedButton(
              onPressed: (){
                if(_textFieldController.text.isEmpty){
                  return;
                }

                Navigator.pop(context,_textFieldController.text);
                _textFieldController.clear();
              }, child: Text("Ok"))
        ],
      );
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text("Flutter Weather App"),
      actions: [
        IconButton(
            onPressed: () async{
           String text= await _showTextInputDialogue(context);
            setState(() {
              searchText=text;
            });
            },
            icon: Icon(Icons.search)),
        IconButton(
            onPressed: (){
              setState(() {
                searchText="auto:ip";
              });

            },
            icon: Icon(Icons.my_location))
      ],
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: apiServices.getWeatherData(searchText),
          builder: (context, snapshot){
            if(snapshot.hasData){
              WeatherModel? weatherModel=snapshot.data as WeatherModel?;
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    TodaysWeather(
                      weatherModel: weatherModel,
                    ),
                    SizedBox(height: 10,),
                    Text("Weather by Hours",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white
                    ),
                    ),
                    SizedBox(height: 10,),
                    SizedBox(
                      height: 150,
                      child: Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: weatherModel!.forecast!.forecastday![0].hour!.length,
                            itemBuilder: (context,index){
                            Hour? hour=weatherModel!.forecast!.forecastday![0].hour![index];
                              return HourlyWeatherListItem(hour: hour,);
                            }),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text("Next 7 Days Weather",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white
                      ),
                    ),
                    SizedBox(height: 10,),
                    Expanded(
                      child: ListView.builder(

                        itemCount: weatherModel!.forecast!.forecastday!.length,
                          itemBuilder: (context,index){
                            Forecastday? forecastday=weatherModel!.forecast!.forecastday![index];
                            return FutureForecastListItem(forecastday: forecastday,);
                          }),
                    )

                  ],
                ),
              );
            }
            else if(snapshot.hasError){
              return Center(child: Text("Error has occured"),);
            }
            return Center(child: CircularProgressIndicator(),);
          },
        ),
      ),
    );
  }
}
