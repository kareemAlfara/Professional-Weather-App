import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_weather_app/src/data/repositories/weatherHelper.dart';
import 'package:new_weather_app/src/presentation/screens/loadingScreen.dart';
import 'package:new_weather_app/src/presentation/screens/weather_app.dart';

void main(List<String> args) {
  runApp(Myapp());
  
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Loadingscreen(fromPage: 'Location'),
    );
  }
}
