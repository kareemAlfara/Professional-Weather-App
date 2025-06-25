//"https://api.weatherapi.com/v1/forecast.json?key=cd321da97aac408f8fc125209231109&q=cairo&aqi=no&alert=no"
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:new_weather_app/src/data/models/weatherModel.dart';

class Weatherhelper {
  final String url;

  Weatherhelper({required this.url});
  Future getWeather() async {
    try {
      http.Response response = await http.get(Uri.parse(url));
      var data = jsonDecode(response.body);

      return data;
    } on Exception catch (e) {
      // TODO
      print(e.toString());
      throw Exception("opps there was an other error");
    }
  }

}

  Future getmodel() async {
    try {
      http.Response response = await http.get(Uri.parse('https://api.weatherapi.com/v1/forecast.json?key=cd321da97aac408f8fc125209231109&q=cairo&aqi=no&alert=no'));
      var data = jsonDecode(response.body);
      weatherModel weathermodel = weatherModel.formJson(data);
      print(weathermodel.Cityname);
      print(weathermodel.avghumidity);
      print(weathermodel.Cityname);
      return weathermodel;
    } on Exception catch (e) {
      // TODO
      print(e.toString());
      throw Exception("opps there was an other error");
    }
  }