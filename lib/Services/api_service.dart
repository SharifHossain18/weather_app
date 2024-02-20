
import 'dart:convert';

import 'package:weatherapp_starter_project/Constant/constants.dart';
import 'package:http/http.dart' as http;
import '../Model/weather_model.dart';

class ApiServices{

Future<WeatherModel> getWeatherData(String searchText)async{

  String url="$base_url&q=$searchText&days=7";

  try{

    http.Response response=await http.get(Uri.parse(url));
    if(response.statusCode==200){
      Map<String, dynamic>json=jsonDecode(response.body);
      WeatherModel weatherModel=WeatherModel.fromJson(json);
      return weatherModel;
    }
    else{
      throw ("No data found");
    }

  }
  catch(e){
    print(e.toString());
    throw e.toString();

  }


}



}