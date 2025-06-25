import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:new_weather_app/src/data/models/weatherModel.dart';
import 'package:new_weather_app/src/data/repositories/weatherController.dart';
import 'package:new_weather_app/src/presentation/screens/weather_app.dart';
import 'package:new_weather_app/src/services/components/components.dart';

class Loadingscreen extends StatefulWidget {
  const Loadingscreen({super.key, required this.fromPage, this.cityName});
  final String fromPage;
  final String? cityName;
  @override
  State<Loadingscreen> createState() => _LoadingscreenState();
}

class _LoadingscreenState extends State<Loadingscreen> {
  weatherModel? model;
  @override
  void initState() {
    getweatherDate();
    // TODO: implement initState
    super.initState();
  }

  void getweatherDate() async {
    if (widget.fromPage == "Location") {
      model = await Weathercontroller().getWeatherByLocation();
    } else if (widget.fromPage == "city") {
      if (widget.cityName != null) {
        model = await Weathercontroller().getWeatherByCityName(
          cityName: widget.cityName,
        );
      } else {
        model = await Weathercontroller().getWeatherByLocation();
      }
    }
    if (model != null) {
      print(model!.avghumidity);
      print(model!.avghumidity);
      print(model!.avghumidity);
    
      navigat(context, widget: WeatherApp(model: model!, ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Lottie.asset("assets/loading.json")],
      ),
    );
  }
}
