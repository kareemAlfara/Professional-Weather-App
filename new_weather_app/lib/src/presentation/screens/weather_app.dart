import 'package:flutter/material.dart';
import 'package:new_weather_app/src/data/models/weatherModel.dart';
import 'package:new_weather_app/src/data/repositories/weatherController.dart';
import 'package:new_weather_app/src/presentation/screens/loadingScreen.dart';
import 'package:new_weather_app/src/presentation/screens/searchPage.dart';
import 'package:new_weather_app/src/presentation/screens/todayForecast.dart';
import 'package:new_weather_app/src/presentation/widget/mainCard.dart';
import 'package:new_weather_app/src/presentation/widget/todaylistview.dart';
import 'package:new_weather_app/src/services/components/components.dart';

class WeatherApp extends StatefulWidget {
  WeatherApp({super.key, required this.model});
  weatherModel? model;

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  void initState() {
    updateUI(widget.model!);
    // TODO: implement initState
    super.initState();
  }

  void updateUI(weatherModel weatherData) {
    setState(() {
      widget.model = weatherData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            navigat(context, widget: Loadingscreen(fromPage: "Location"));
          },
          icon: Icon(Icons.my_location_outlined, size: 33),
        ),
        title: defulttext(
          data: widget.model!.Cityname,
          color: Colors.white,
          fSize: 26,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              navigat(context, widget: Searchpage());
            },
            icon: Icon(Icons.search, size: 33),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 11),

            SizedBox(height: 11),

            Row(
              children: [
                SizedBox(width: 22),
                defulttext(
                  data: widget.model!.weathertext,
                  color: Colors.white,
                  fSize: 27,
                ),
                Icon(Icons.arrow_drop_down, size: 33),
              ],
            ),
            Image.asset(WeatherImage(widget.model!.weathertext), height: 255),
            SizedBox(height: 18),
            main_card(model: widget.model!),

            todayListview(model: widget.model!),
          ],
        ),
      ),
    );
  }
}
